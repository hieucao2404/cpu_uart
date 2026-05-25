`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2026 07:22:25 PM
// Design Name: 
// Module Name: ahb_spi
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ahb_spi(
    // --- AHB-Lite Slave Interface ---
    input wire hclk,
    input wire hresetn, // Active-low reset from AHB bus
    input wire hsel,    // 1 when CPU targets this peripheral
    input wire [31:0] haddr,
    input wire [31:0] hwdata,
    input wire hwrite,
    input wire [1:0] htrans, 
    
    output wire [31:0] hrdata,
    output wire hreadyout,
    
    // --- External SPI Physical Pins ---
    output wire mosi,
    input  wire miso,
    output wire sclk,
    output wire cs
    );
    
    // -----1. AHB Pipeline Registers (Address Phase -> Data Phase)
    reg [31:0] saved_addr;
    reg saved_write;
    reg active_transfer;
    
    always @(posedge hclk or negedge hresetn) begin
        if(!hresetn) begin
            active_transfer <= 1'b0;
            saved_addr <= 32'h0;
            saved_write <= 1'b0;
        end else begin
            // Address Phase: Catch the control signals
            if(hsel && htrans == 2'b10) begin // 2'b10 is NONSEQ(valid transfer)
            saved_addr <= haddr;
            saved_write <= hwrite;
            active_transfer <= 1'b1;
            end else begin
            active_transfer <= 1'b0;
        end
      end
     end
    
     // --------------------------
     // 2. SPI Master Instantiation
     // ---------------------------
     reg spi_start;
     reg [7:0] spi_tx_byte;
     wire [7:0] spi_rx_byte;
     wire spi_done_pulse;
     
    // Convert AHB active-low reset to SPI active-hig reset
    wire spi_reset = ~hresetn;
    
    spi_master my_spi_core(
        .clk(hclk),
        .reset(spi_reset),
        .start(spi_start),
        .tx_byte(spi_tx_byte),
        .miso(miso),
        .mosi(mosi),
        .sclk(sclk),
        .cs(cs), 
        .rx_byte(spi_rx_byte),
        .done(spi_done_pulse)
    );
    
    // ------------------------------
    // 3. Write Logic (CPU -> SPI)
    //--------------------------------
    always @(posedge hclk or negedge hresetn) begin
        if(!hresetn) begin
            spi_start <= 1'b0;
            spi_tx_byte <=  8'h00;
         end else begin
            // Default to 0 so 'start' is just 1-cycle pulse
            spi_start <= 1'b0;
            
            //Data Phase: Execute the Write
            if(hsel && htrans == 2'b10 && hwrite) begin
                //Offset 0x00: TX Register
                if(saved_addr[7:0] == 8'h00) begin
                    spi_tx_byte <= hwdata[7:0];
                    spi_start <= 1'b1; // Trigger the SPI master
                end
           end
         end
    end
    
    // ------------------------------------------
    // 4. Status Flag Logic (Sticky Done Flag)
    // ------------------------------------------
    // The 'done' signal from spi_master is only high for 1 clock cycle
    // We need to trap in in a sticky register so the CPU does not miss it.
    reg spi_done_sticky;
    
    always @(posedge hclk or negedge hresetn) begin
        if(!hresetn) begin
            spi_done_sticky <= 1'b0;
        end else if (spi_done_pulse) begin
            spi_done_sticky <= 1'b1; // Flag goes high when transfer finishes
        end else if (active_transfer && !saved_write && saved_addr[7:0] == 8'h04) begin
            spi_done_sticky <= 1'b0; // CPU just read the RX data, clear the flag
        end
     end
     
     // ---------------------
     // 5. Read Logic (SPI - CPU)
     // -----------------
     reg [31:0] rdata_out;
     always @(*) begin
        rdata_out = 32'h0;// Default
        // Data phase: Execute the Read
        if(active_transfer && !saved_write) begin
            case(saved_addr[7:0])
                8'h04: rdata_out = {24'h0, spi_rx_byte}; //Offset 0x04: RX Data
                8'h08: rdata_out = {32'h0, spi_done_sticky}; // Offset 0x08: Status
                default: rdata_out = 32'h0;
             endcase
         end
      end
      
      assign hrdata = rdata_out;
      
      //We never need to stall the CPU bus because our registers reply instanly
      assign hreadyout = 1'b1;
    
    
endmodule

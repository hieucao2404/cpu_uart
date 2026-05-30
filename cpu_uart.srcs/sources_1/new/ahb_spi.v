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
   input wire hclk,
    input wire hresetn, 
    input wire hsel,    
    input wire [31:0] haddr,
    input wire [31:0] hwdata,
    input wire hwrite,
    input wire [1:0] htrans, 
    
    output wire [31:0] hrdata,
    output wire hreadyout,
    
    output wire mosi,
    input  wire miso,
    output wire sclk,
    output wire cs
    );
    
     // 1. SPI Master Instantiation
     reg spi_start;
     reg [7:0] spi_tx_byte;
     wire [7:0] spi_rx_byte;
     wire spi_done_pulse;
     
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

    // 2. Instantaneous Write Logic (No Pipeline)
    always @(posedge hclk or negedge hresetn) begin
        if(!hresetn) begin
            spi_start <= 1'b0;
            spi_tx_byte <=  8'h00;
         end else begin
            spi_start <= 1'b0; 
            if(hsel && htrans == 2'b10 && hwrite) begin
                if(haddr[7:0] == 8'h00) begin
                    spi_tx_byte <= hwdata[7:0];
                    spi_start <= 1'b1; 
                end
           end
         end
    end
    
    // 3. Sticky Done Flag Logic
    reg spi_done_sticky;
    always @(posedge hclk or negedge hresetn) begin
        if(!hresetn) begin
            spi_done_sticky <= 1'b0;
        end else if (spi_done_pulse) begin
            spi_done_sticky <= 1'b1;
        end else if (hsel && htrans == 2'b10 && !hwrite && haddr[7:0] == 8'h04) begin
            spi_done_sticky <= 1'b0; // Clear on RX data read
        end
     end
     
     // 4. Combinatorial Read Logic (Responds instantly!)
     assign hrdata = (hsel && !hwrite && haddr[7:0] == 8'h04) ? {24'h0, spi_rx_byte} :
                    (hsel && !hwrite && haddr[7:0] == 8'h08) ? {31'h0, spi_done_sticky} : 32'h0;
      
      assign hreadyout = 1'b1;
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2026 01:27:55 PM
// Design Name: 
// Module Name: apb_uart
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


module apb_uart(
    //APB bus interface
    input pclk,
    input presetn, // APB reset os traditionally active-low
    input [31:0] paddr,
    input psel, //1 whe the address decoder selects this uart
    input penable,
    input pwrite,
    input [31:0] pwdata,
    output reg [31:0] prdata,
    output pready,
    
    //Physical wire
    input rx_pin,
    output tx_pin
    );
    
    //Internal wire connecting to raw uart
    wire       uart_reset;
    reg        tx_start;
    reg  [7:0] tx_data_in;
    wire       tx_active;
    wire       tx_done;
    
    wire [7:0] rx_data_out;
    wire       rx_done;
    
    // Convert APB active-low reset to your UART's active-high reset
    assign uart_reset = ~presetn;

    // --- 1. Instantiate YOUR Raw UART Core (Formerly top.v) ---
    uart_core my_raw_uart (
        .clk(pclk),
        .reset(uart_reset),
        
        // TX Ports
        .tx_start(tx_start),
        .tx_data(tx_data_in),
        .tx_active(tx_active),
        .tx_done(tx_done),
        .tx_pin(tx_pin),
        
        // RX Ports
        .rx_pin(rx_pin),
        .rx_data(rx_data_out),
        .rx_done(rx_done)
    );
    
    //APB Write logic( CPU -> UART)
    always @(posedge pclk) begin
        if(!presetn) begin
            tx_start <= 1'b0;
            tx_data_in <= 8'h00;
        end
        else begin
            //Default: do not start a transmission
            tx_start <= 1'b0;
            
            //If bus is selected, enabled and wrirint to TX Register(Offset 0x00)
            if(psel && penable && pwrite && paddr[7:0] == 8'h00) begin
                tx_data_in <= pwdata[7:0];
                tx_start <= 1'b1; // Send a 1-cycle pulse to start transmission
            end
         end
       end
       
       // 3. Sticky RX Data Ready Flag --
       // catches the 1-cycle tx_done pulse and holds it until the CPU reads the data
       reg rx_data_ready;
       
       always @(posedge pclk) begin
        if(!presetn) begin
            rx_data_ready <= 1'b0;
        end
        else if (rx_done) begin
            rx_data_ready <= 1'b1; // New data arrived, flag goes high
        end
        else if (psel && penable && !pwrite && paddr[7:0] == 8'h04) begin
            rx_data_ready <= 1'b0; // CPU just read the RX register, clear the flag.
        end
     end
     
     //4, APU Read Logic (UART -> CPU)
       always @(*) begin
        prdata = 32'h0; // Default to 0
        if(psel && !pwrite) begin
            case(paddr[7:0])
                8'h04: prdata = {24'h0, rx_data_out}; //Read rx data
                8'h08: prdata = {30'h0, rx_data_ready, tx_active};// read statis
                default: prdata = 32'h0;
             endcase
         end
      end
      
      // --- 5. Ready Logic
      //Out registers respond instantly in 1 clock cycle, sp we are always ready
      assign pready = 1'b1;
      
endmodule

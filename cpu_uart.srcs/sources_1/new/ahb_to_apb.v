`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/21/2026 06:10:46 PM
// Design Name: 
// Module Name: ahb_to_apb
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


module ahb_to_apb(
    // --- AHB-Lite Slave Interface (Connects to CPU/Interconnect) ---
    input wire hclk,
    input wire hresetn, // 1 = Interconnect selected this bridge
    input wire hsel,
    input wire [31:0] haddr,
    input wire [31:0] hwdata,
    input wire hwrite,
    input wire [1:0] htrans, 
    output reg hreadyout, // 0 = stall, 1 = go
    output wire [31:0] hrdata, // We won't use this for UART TX, but good for RX later
    
    // ------- APB Master Interface (Connects to UART) ---
    output reg psel,
    output reg penable,
    output reg pwrite,
    output reg [31:0] paddr,
    output reg [31:0] pwdata
    );
    
    //
    // State Machine Encoding
    localparam ST_IDLE = 2'b00;
    localparam ST_SETUP = 2'b01;
    localparam ST_ACCESS = 2'b10;
    
    reg [1:0] current_state, next_state;
    
    // Registers to catch the AHB Address Phase signals
    // AHB is piplelined! We get Address in Cycle 1, Data in Cycle 2
    reg [31:0] saved_addr;
    reg saved_write;
    
    // 1. Sequentia; State Register
    always@(posedge hclk or negedge hresetn) begin
        if(!hresetn) begin
            current_state <= ST_IDLE;
            saved_addr <= 32'b0;
            saved_write <= 1'b0;
        end else begin
            current_state <= next_state;
            
            // If we are starting a transfer, latch the address phase!
            if(hsel && htrans == 2'b10 && current_state == ST_IDLE) begin
                saved_addr <=  haddr;
                saved_write <=  hwrite;
            end 
         end
      end
      
      
     // 2. Combinatorial Next State & Output Logic
     always @(*) begin
        // Default Outputs (IDLE conditions)
        next_state = current_state;
        hreadyout = 1'b1; //Default: Do not stall the CPU
        psel = 1'b0;
        penable = 1'b0;
        paddr = 32'h0;
        pwdata = 32'h0;
        pwrite = 1'b0;
        
        case (current_state) 
            ST_IDLE: begin
                //Check if the CPU wants to talk to us (HTRANS = 2'b10 is NONSEQ)
                if(hsel && htrans == 2'b10) begin
                    hreadyout = 1'b0;//Freeze the CPU immediately
                    next_state = ST_SETUP;
                end
           end
           
           ST_SETUP: begin
            hreadyout = 1'b0; // Keep CPU frozen
            
            //Drive the APB bus (Cycle 2: AHB Data has arrived!)
            psel = 1'b1;
            paddr = saved_addr;
            pwrite = saved_write;
            pwdata = hwdata;
            
            // Assume APB Peripheral is instantly ready (no pready signal)
            //Next clock cycle, we go to IDLE, and hreadyout defaults back to 1
            next_state = ST_ACCESS;
            end
            
            ST_ACCESS: begin 
             hreadyout = 1'b1; 
             
            //Finish the APB handshake
            psel = 1'b1;
            penable = 1'b1;
            paddr = saved_addr;
            pwrite = saved_write;
            pwdata = hwdata;
            
            next_state = ST_IDLE;
            end
            endcase
            
          end
          
          //For now, hardwire hrdata to 0. Map when RX loopback
          assign hrdata = 32'h0;         
    
endmodule

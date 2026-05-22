`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2026 10:21:29 AM
// Design Name: 
// Module Name: ahb_ram
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


module ahb_ram(
    input hclk,
    input hsel,
    input [31:0] haddr,
    input [31:0] hwdata,
    input hwrite,
    input [1:0] htrans,
    output wire [31:0] hrdata,
    output wire hreadyout
    );
    
    //16kB memory array (4096x32-bit words)
    reg[31:0] memory [0:4095];
    
    
    //Pipe line Registers to catch cycle 1 signals, for cycle 2 execution
    reg [31:0] saved_addr;
    reg saved_write;
    reg active_transfer;
    
    // Initialize RAM to zero for clean simulations
    integer i;
    initial begin
        for(i = 0; i < 4096; i = i + 1) begin
            memory[i] = 32'h0;
        end
    end
    
    always @(posedge hclk) begin
        // --- CYCLE 1: Address phase ---
        // If the CPU selects us and is starting a transfer, save the target info
        if (hsel && htrans == 2'b10) begin
            saved_addr <= haddr;
            saved_write <= hwrite;
            active_transfer <= 1'b1;
        end else begin
            active_transfer <= 1'b0;
        end
        
        // --- Cycle 2: Data phase ---
        // The data has arrived on hwdata. We use the address we saved last cycle.
        if(active_transfer && saved_write) begin
            // Shift address right by 2 to convert byte address to word index
            memory[saved_addr[13:2]] <= hwdata;
         end
     end
     
     // ---- Combinatorial Read ---
     // RAM is fast enough to output data in the same cycle it is addressed
     assign hrdata = (hsel && !hwrite) ? memory[haddr[13:2]] : 32'h0;
     
     //RAM is instantaneous, so it never needs to stall the CPU
     assign hreadyout = 1'b1;
     
endmodule

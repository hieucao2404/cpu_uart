`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2026 01:55:07 PM
// Design Name: 
// Module Name: ahb_pmu
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


module ahb_pmu(
    // AHB Interface
    input wire hclk,
    input wire hresetn,
    input wire hsel,
    input wire [31:0] haddr,
    input wire [31:0] hwdata,
    input wire hwrite,
    input wire [1:0] htrans,
    
    output wire [31:0] hrdata,
    output wire hreadyout,
    
    
    //PMU Specific Outputs
    output wire uart_clk_en,
    output wire spi_clk_en,
    output wire i2c_clk_en
    );
    
    // The single Power/Clock Control Register
    reg [31:0] clk_enable_reg;
    
    always @(posedge hclk or negedge hresetn) begin
        if(!hresetn) begin
         // Default to 0 (Everything is OFF on boot)
         clk_enable_reg <= 12'h00000000;
         end else begin
            //Single-cycle write catch (same as our SPI fix!)
            if(hsel && htrans == 2'b10 && hwrite) begin
                if(haddr[7:0] == 8'h00) begin
                    clk_enable_reg <=  hwdata;
                end
            end
       end
   end
   
   // Map the register bits to the output wires
   assign uart_clk_en = clk_enable_reg[0];
   assign spi_clk_en = clk_enable_reg[1];
   assign i2c_clk_en = clk_enable_reg[2];
   
   //CPU read logic
   assign hrdata = (hsel && !hwrite && haddr[7:0] == 8'h00) ? clk_enable_reg : 32'h0;
   
   //We never stall the bus
   assign hreadyout = 1'b1;      
    
endmodule

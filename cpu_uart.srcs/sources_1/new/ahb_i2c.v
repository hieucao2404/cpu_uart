`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2026 07:23:20 PM
// Design Name: 
// Module Name: ahb_i2c
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


module ahb_i2c(
  input wire sys_clk,
    // AHB-Lite Bus Interface
    input wire hclk,
    input wire hresetn,
    input wire hsel,
    input wire [31:0] haddr,
    input wire [31:0] hwdata,
    input wire hwrite,
    input wire [1:0] htrans,
    
    output wire [31:0] hrdata,
    output wire hreadyout,
    
    // Physical I2C pins
    inout wire sda,
    output wire scl
);
     
    // Internal Registers
    reg [6:0] i2c_addr;
    reg i2c_rw;
    reg [7:0] i2c_tx_data;
    reg i2c_enable_raw; 
    
    wire i2c_busy;
    wire [7:0] i2c_rx_data;
    
    wire true_busy = i2c_busy | i2c_enable_raw;

    // -------------------------------------------------------------------------
    // Single-Cycle Write Logic (Runs on sys_clk to bypass delta-cycle gating)
    // -------------------------------------------------------------------------
    always @(posedge sys_clk or negedge hresetn) begin
        if(!hresetn) begin
            i2c_addr <= 7'b0;
            i2c_rw <= 1'b0;
            i2c_tx_data <= 8'b0;
            i2c_enable_raw <= 1'b0;
        end else begin
        
            // Instantaneous catch (Matches your ahb_spi.v and ahb_pmu.v)
            if(hsel && htrans == 2'b10 && hwrite) begin
                if (haddr[7:0] == 8'h00) begin
                    i2c_tx_data <= hwdata[23:16];
                    i2c_rw <= hwdata[8];
                    i2c_addr <= hwdata[6:0];
                    i2c_enable_raw <= 1'b1;
                end
            end
            
            // Clear enable as soon as the master wakes up and reports busy
            if(i2c_busy) begin
                i2c_enable_raw <= 1'b0;
            end
        end
    end
    
    // -------------------------------------------------------------------------
    // Two-flop synchronizer for i2c_enable into gated_i2c_clk domain
    // -------------------------------------------------------------------------
    reg i2c_enable_sync1, i2c_enable_sync;
    always @(posedge hclk or negedge hresetn) begin
        if(!hresetn) begin
            i2c_enable_sync1 <= 1'b0;
            i2c_enable_sync <= 1'b0;
        end else begin
            i2c_enable_sync1 <= i2c_enable_raw;
            i2c_enable_sync <= i2c_enable_sync1;
        end
    end
        
    // Read Logic (CPU <- I2C)
    assign hrdata = (haddr[7:0] == 8'h04) ? {24'b0, i2c_rx_data} : 
                    (haddr[7:0] == 8'h08) ? {31'b0, true_busy} : 32'h0;
    assign hreadyout = 1'b1;
        
    // Instantiate Your I2C Master
    i2c_master my_i2c_core (
        .clk(hclk),       
        .rst(~hresetn), 
        .enable(i2c_enable_sync),
        .addr(i2c_addr),
        .data_in(i2c_tx_data),
        .rw(i2c_rw),
        .busy(i2c_busy),
        .data_out(i2c_rx_data),
        .sda(sda),
        .scl(scl)
    );
endmodule

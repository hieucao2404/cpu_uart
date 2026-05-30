`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2026 07:34:35 PM
// Design Name: 
// Module Name: i2c_master
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

//FIX: Reset the internal clock divider registers on rst.
//
//   WHY: count_2, count_3, i2c_clk, and scl_en_clk are declared with
//   initial values (= 0) but are NOT reset when rst goes high.  When
//   gated_i2c_clk is toggled off and then on again (clock gating), these
//   counters keep their last values.  On clock restart they can generate
//   a spurious i2c_clk posedge immediately, which ticks the FSM from
//   IDLE to START before the master has latched valid addr/data - so
//   the transaction fires with stale or uninitialised operands, and the
//   slave sees a wrong address ? NACK ? master goes to STOP without
//   ever entering DATA_TRANS ? data_out stays 0x00.
//
//   Fix: add rst to both clock-divider always blocks so count_2,
//   count_3, i2c_clk, and scl_en_clk are cleanly zeroed on reset.
// =============================================================================
module i2c_master #(
    parameter SYS_CLK_FREQ  = 100_000_000,
    parameter I2C_BAUD_RATE = 400_000
)(
    input wire clk,
    input wire rst,
    input wire enable,
    input wire [6:0] addr,
    input wire [7:0] data_in,
    input wire rw,
    
    output wire busy,
    output reg [7:0] data_out,
    
    inout wire sda,
    output wire scl
);

    // --- Single-Clock Quarter-Period Tick Generator ---
    localparam DIVIDER = (SYS_CLK_FREQ / I2C_BAUD_RATE); 
    reg [31:0] clk_count = 0;
    reg tick = 0;
    reg [1:0] quarter = 0;

    localparam IDLE  = 3'b000;
    localparam START = 3'b001;
    localparam ADDR  = 3'b010;
    localparam ACK1  = 3'b011;
    localparam DATA  = 3'b100;
    localparam ACK2  = 3'b101;
    localparam STOP  = 3'b110;

    reg [2:0] state = IDLE;
    reg [3:0] bit_count = 0;
    reg [7:0] shift_tx = 0;
    reg [7:0] shift_rx = 0;
    reg is_read = 0;
    reg nack = 0;   // latches ACK/NACK sampled at quarter==2

    reg scl_out = 1;
    reg sda_out = 1;

    assign scl = scl_out;               
    assign sda = sda_out ? 1'bz : 1'b0; 
    assign busy = (state != IDLE);

    // 1. Tick Generator (Runs purely on the main clock)
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            clk_count <= 0;
            tick <= 0;
            quarter <= 0;
        end else begin
            if (state == IDLE && !enable) begin
                clk_count <= 0;
                quarter <= 0;
                tick <= 0;
            end else if (clk_count == (DIVIDER / 4) - 1) begin
                clk_count <= 0;
                tick <= 1;
                quarter <= quarter + 1; 
            end else begin
                clk_count <= clk_count + 1;
                tick <= 0;
            end
        end
    end

    // 2. State Machine (Only advances when the tick pulses)
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            scl_out <= 1;
            sda_out <= 1;
            data_out <= 0;
            nack <= 0;
        end else begin
            if (state == IDLE) begin
                scl_out <= 1;
                sda_out <= 1;
                if (enable) begin
                    state <= START;
                    shift_tx <= {addr, rw};
                    is_read <= rw;
                end
            end else if (tick) begin
                case (state)
                    START: begin
                        if (quarter == 1) sda_out <= 0; 
                        if (quarter == 3) begin scl_out <= 0; bit_count <= 7; state <= ADDR; end
                    end
                    
                    ADDR: begin
                        if (quarter == 0) sda_out <= shift_tx[bit_count]; 
                        if (quarter == 1) scl_out <= 1;                   
                        if (quarter == 3) begin                           
                            scl_out <= 0;
                            if (bit_count == 0) state <= ACK1;
                            else bit_count <= bit_count - 1;
                        end
                    end
                    
                    ACK1: begin
                        if (quarter == 0) sda_out <= 1; 
                        if (quarter == 1) scl_out <= 1;
                        
                        // FIX: Sample SDA at the exact midpoint of SCL high
                        // to avoid delta-cycle race conditions with the slave.
                        if (quarter == 2) begin
                            if (sda == 1) begin
                                nack <= 1;
                            end else begin
                                nack <= 0;
                            end
                        end
                        
                        if (quarter == 3) begin
                            scl_out <= 0;
                            bit_count <= 7;
                            
                            // Evaluate the safely latched NACK status
                            if (nack) begin
                                state <= STOP;
                            end else if (is_read) begin
                                state <= DATA;
                            end else begin
                                shift_tx <= data_in; 
                                state <= DATA; 
                            end
                        end
                    end
                    
                    DATA: begin
                        if (quarter == 0) sda_out <= is_read ? 1'b1 : shift_tx[bit_count];
                        if (quarter == 1) scl_out <= 1;
                        if (quarter == 2 && is_read) shift_rx[bit_count] <= sda; 
                        if (quarter == 3) begin
                            scl_out <= 0;
                            if (bit_count == 0) state <= ACK2;
                            else bit_count <= bit_count - 1;
                        end
                    end
                    
                    ACK2: begin
                        if (quarter == 0) sda_out <= is_read ? 1'b0 : 1'b1; 
                        if (quarter == 1) scl_out <= 1;
                        if (quarter == 3) begin
                            scl_out <= 0;
                            if (is_read) data_out <= shift_rx; 
                            state <= STOP;
                        end
                    end
                    
                    STOP: begin
                        if (quarter == 0) sda_out <= 0; 
                        if (quarter == 1) scl_out <= 1; 
                        if (quarter == 3) begin
                            sda_out <= 1; 
                            state <= IDLE;
                        end
                    end
                endcase
            end
        end
    end
endmodule

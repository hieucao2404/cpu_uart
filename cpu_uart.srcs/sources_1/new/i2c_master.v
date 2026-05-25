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


module i2c_master #(
    // --- NEW: Dynamic System Parameters ---
    parameter SYS_CLK_FREQ  = 100_000_000, // Default 100 MHz AHB clock
    parameter I2C_BAUD_RATE = 400_000      // Default 400 kHz Fast Mode
    )(
    input clk,
    input rst,
    input wire enable,
    input wire [6:0] addr,
    input wire [7:0] data_in,
    input wire rw, // High for read, Low for write
    
    output wire busy, // High when busy
    output reg [7:0] data_out,
    
    inout wire sda, // Serial data line
    output wire scl
    );
    
    // Automated Clock Divider 
    // (100MHz / 400kHz) / 2 = 126 ticks per half-cycle
    localparam I2C_DIVIDER = (SYS_CLK_FREQ / I2C_BAUD_RATE) / 2;
    localparam SCL_DIVIDER = I2C_DIVIDER / 2;
    
    //Prefixe FSM States
    localparam I2C_IDLE       = 3'b000;
    localparam I2C_START      = 3'b001;
    localparam I2C_ADDR       = 3'b010;
    localparam I2C_READ_ACK_1 = 3'b011;
    localparam I2C_DATA_TRANS = 3'b100;
    localparam I2C_WRITE_ACK  = 3'b101;
    localparam I2C_READ_ACK_2 = 3'b110;
    localparam I2C_STOP       = 3'b111;
    
    //internal registers
    reg [2:0] state = I2C_IDLE;
    reg [2:0] count = 0;
    
    // Counters adapted to use the dynamic parameter math
    reg [31:0] count_2 = 0;
    reg [31:0] count_3 = 0;
    
    reg i2c_clk = 0;
    reg scl_en_clk = 0;
    reg scl_enable = 0;
    reg sda_enable = 0;
    
    
    reg sda_out;
    reg [7:0] saved_addr;
    reg [7:0] saved_data;
    
    //Generate i2c_clk (using dynamic divider)
    always @(posedge clk) begin
        if(count_2 == (I2C_DIVIDER - 1)) begin
            i2c_clk <=  ~i2c_clk;
            count_2 <= 0;
        end
        else count_2 <= count_2 + 1;
    end
    
    
    // Generate scl_en_clk (using dynamic divider)
    always @(posedge clk) begin
        if(count_3 == (SCL_DIVIDER - 1)) begin
            scl_en_clk <= ~scl_en_clk;
            count_3 <= 0;
        end
        else count_3 <= count_3 + 1;
    end
    
    // Logci for scl_enable
    always @(negedge scl_en_clk or posedge rst) begin
        if(rst)
            scl_enable <= 1'b0;
        else begin
            if((state == I2C_IDLE) || (state == I2C_START) || (state == I2C_STOP))
                scl_enable <= 1'b0;
            else 
                scl_enable <= 1'b1;
            end
       end
       
       // Main
       always @(posedge i2c_clk or posedge rst) begin
        if(rst) 
            state <= I2C_IDLE;
        else begin
            case(state)
                I2C_IDLE: begin
                    if(enable) begin
                        state <= I2C_START;
                        saved_addr <= {addr, rw};
                        saved_data <= data_in;
                    end
                    else state <= I2C_IDLE;
                end
                
                I2C_START: begin
                    state <= I2C_ADDR;
                    count <= 7;
                end
                
                I2C_ADDR: begin
                    if(count == 0) state <= I2C_READ_ACK_1;
                    else begin
                        count <=  count - 1;
                        state <= I2C_ADDR;
                    end
                 end
                 
                 I2C_READ_ACK_1: begin
                    if(sda == 0) begin //ACK
                        count <= 7;
                        state <= I2C_DATA_TRANS;
                    end
                    else state <= I2C_STOP; //NACK
                  end
                  
                  I2C_DATA_TRANS: begin
                    if(saved_addr[0]) begin // READ
                        data_out[count] <= sda;
                        if(count == 0) state <= I2C_WRITE_ACK;
                        else begin
                            count <= count - 1;
                            state <= I2C_DATA_TRANS;
                        end
                    end
                    else begin // WRITE
                        if(count == 0) state <= I2C_READ_ACK_2;
                        else begin 
                            count <= count - 1;
                            state <= I2C_DATA_TRANS;
                        end
                    end
                end
                
                I2C_WRITE_ACK: state <= I2C_STOP;
                
                I2C_READ_ACK_2: begin
                    if(sda == 0 && enable == 1) state <= I2C_IDLE;
                    else state <= I2C_STOP;
                end
                
                I2C_STOP: state <= I2C_IDLE;
              endcase
           end
       end
       
       
       //Logic for sda_enable and sda_out
       always @(negedge i2c_clk or posedge rst) begin
            if(rst) begin
                sda_out <= 1;
                sda_enable <= 1;
            end
            else begin
                case(state)
                    I2C_START: begin
                        sda_out <= 0;
                        sda_enable <= 1;
                    end
                    
                    I2C_ADDR: begin
                        sda_out <= saved_addr[count];
                        sda_enable <= 1;
                     end
                     
                     I2C_READ_ACK_1: sda_enable <= 0;
                     
                     I2C_DATA_TRANS: begin
                        if(saved_addr[0])
                            sda_enable <= 0; // READ
                        else begin
                            sda_out <= saved_data[count];
                            sda_enable <= 1; //Write
                        end
                     end
                     
                     I2C_WRITE_ACK: begin
                        sda_out <= 0;
                        sda_enable <= 1;
                     end
                     
                     I2C_READ_ACK_2: sda_enable <= 0;
                     
                     I2C_STOP: begin
                        sda_out <= 1;
                        sda_enable <= 1;
                     end
                     
                 endcase
             end
         end
         
         assign scl = (scl_enable) ? i2c_clk : 1'b1;
         assign sda = (sda_enable) ? sda_out : 1'bz;
         assign busy = (state == I2C_IDLE) ? 0 : 1;
    
endmodule

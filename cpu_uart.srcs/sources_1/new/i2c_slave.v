`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2026 08:51:35 PM
// Design Name: 
// Module Name: i2c_slave
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


module i2c_slave #(
    // --- NEW: Parameterized Addresses and Payload ---
    parameter SLAVE_ADDRESS = 7'b1010111, // 0x57
    parameter DUMMY_DATA    = 8'b11001101 // 0xCD
)(
    input wire scl, // serial clock line
    inout wire sda // serial data line
    );
    
    //Safely Prefixed FSM States
    localparam SLAVE_READ_ADDR = 2'b00;
    localparam SLAVE_SEND_ACK_1 = 2'b01;
    localparam SLAVE_DATA_TRANS = 2'b10;
    localparam SLAVE_SEND_ACK_2 = 2'b11;
    
    //Internal registers
    reg [1:0] state =  SLAVE_READ_ADDR; // current state
    reg [6:0] addr; // received address
    reg rw;
    reg [7:0] data_in = 0; 
    reg [7:0] data_out = DUMMY_DATA;// stored data (using parameter
    
    reg sda_out = 0; // data to put on sda
    reg sda_enable = 0;
    reg sda_enable_2 = 1;
    reg [2:0] count = 7; //General counter
    reg start = 0;
    reg stop = 1; // signal to reset
    
    // Check start and stop conditions
    always @(sda) begin
        //Staryt condition (SDA drops while SCL is high)
        if(sda == 0 && scl == 1) begin
            start <= 1;
            stop <= 0;
        end
        
        //STOP condition
        if(sda == 1 && scl == 1) begin
            start <= 0;
            stop <= 1;
        end
     end
     
     //Generate state machine
     always @(posedge scl) begin
        if(start) begin
            case (state)
                SLAVE_READ_ADDR: begin
                    if(count == 0) begin
                        sda_enable_2 <= 1;
                        rw <= sda;
                        state <= SLAVE_SEND_ACK_1;
                     end else begin
                        addr[count-1] <= sda;
                        count <= count  - 1;
                        state <= SLAVE_READ_ADDR;
                     end
                 end
                 
                 SLAVE_SEND_ACK_1: begin
                    if(addr == SLAVE_ADDRESS) begin
                        state <= SLAVE_DATA_TRANS;
                        count <= 7;
                     end
                 end
                 
                 SLAVE_DATA_TRANS: begin
                    // Read Phase
                    if(!rw) begin
                        data_in[count] <= sda;
                        if(count == 0) begin
                            state <= SLAVE_SEND_ACK_2;
                         end else begin
                            count <= count - 1;
                            state <= SLAVE_DATA_TRANS;
                         end
                     end
                     
                     //Write Phase -- 
                     else begin
                        if(count == 0) begin
                            state <= SLAVE_READ_ADDR;
                        end else begin
                            count <= count - 1;
                            state <= SLAVE_DATA_TRANS;
                        end
                    end
                end
                
                
                SLAVE_SEND_ACK_2: begin
                    state <= SLAVE_READ_ADDR;
                    sda_enable_2 <= 0;
                    count <= 7;
                end
             endcase
          end else if (stop) begin
            state <= SLAVE_READ_ADDR;
            sda_enable_2 <= 1;
            count <= 7;
          end
      end
      
      //Logic for sda_enable
      always @(negedge scl) begin
        case(state)
            SLAVE_READ_ADDR: sda_enable <= 0;
            
            SLAVE_SEND_ACK_1: begin
            // ACK
            if(addr == SLAVE_ADDRESS) begin
                sda_out <= 0;
                sda_enable <= 1;
            end
            
            //NACK
            else sda_enable <= 0;
       end
       
       
       SLAVE_DATA_TRANS: begin
        // READ
        if(!rw) sda_enable <= 0;
        //WRITE
        else begin
            sda_out <= data_out[count];
            sda_enable <= 1;
        end
      end
      
      SLAVE_SEND_ACK_2: begin
        sda_out <= 0;
        sda_enable <= 1;
     end
     endcase
     end
     
     assign sda = (sda_enable && sda_enable_2) ? sda_out : 1'bz;
endmodule

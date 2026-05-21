`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2026 02:28:32 PM
// Design Name: 
// Module Name: soc_top_tb
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


module soc_top_tb();
// --- 1. Global Signals ---
    reg clk;
    reg reset;
    
    // --- 2. SoC Physical Pins ---
    wire  rx_pin;
    wire tx_pin;
    
    // --- 3. SoC Debug Pins ---
    wire [31:0] out_pc;
    wire [31:0] out_alu_result;
    
    // ---------------------------------------------------------
    // 2. THE HARDWARE LOOPBACK
    // This physically wires the transmit pin directly to the receive pin.
    // Whatever the CPU shouts out of TX, it will immediately hear on RX.
    // ---------------------------------------------------------
    assign rx_pin = tx_pin;

    // --- 4. Instantiate the Motherboard ---
    soc_top uut (
        .clk(clk),
        .reset(reset),
        .rx_pin(rx_pin),
        .tx_pin(tx_pin),
        .out_pc(out_pc),
        .out_alu_result(out_alu_result)
    );

    // --- 5. Clock Generation (100MHz -> 10ns period) ---
    always #5 clk = ~clk;

    // --- 6. Simulation Stimulus ---
    initial begin
      // Initialize console output
        $display("--------------------------------------------------");
        $display("RISC-V SoC Full-Duplex Loopback Test Started.");
        $display("--------------------------------------------------");

        // Start with reset HIGH (System is held in reset)
        clk = 0;
        reset = 1;

        // Wait 20ns, then drop reset to 0 to wake up the CPU
        #20;
        reset = 0;
        $display("Time: %0t | CPU Booted. Executing Machine Code...", $time);

        // Wait for 150,000 nanoseconds.
        // (115200 baud rate takes ~87,000ns for one complete 8-bit character)
        #150000;

        $display("--------------------------------------------------");
        $display("Simulation Complete. Check the waveform for rx_data!");
        $display("--------------------------------------------------");
        $finish;
    end
    
   // 6. Real-time pin monitoring
    always @(tx_pin) begin
        if ($time > 20) // Ignore initial unknown (X) states during reset
            $display("Time: %0t | TX Pin changed to: %b", $time, tx_pin);
    end
endmodule

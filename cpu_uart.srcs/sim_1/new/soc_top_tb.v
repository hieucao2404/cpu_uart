`timescale 1ns / 1ps
// =============================================================================
// tb_soc_top.v  -  Clock-Gating Demo Testbench
// =============================================================================
// Validates that the SoC can enable/disable peripheral clocks via the PMU and
// drive SPI ? I2C ? UART transactions in sequence, mirroring the program.mem
// firmware exactly.
//
// ADDRESS MAP (from soc_top.v decoder):
//   0x0000_xxxx  RAM
//   0x4000_xxxx  APB bridge ? UART
//   0x5000_xxxx  AHB SPI
//   0x6000_xxxx  AHB PMU
//   0x7000_xxxx  AHB I2C
//
// PMU clk_enable_reg  [0] = uart_clk_en
//                     [1] = spi_clk_en
//                     [2] = i2c_clk_en
//
// SPI register map  (0x5000_xxxx):
//   +0x00  TX  (write starts transfer)
//   +0x04  RX  (read)
//   +0x08  STATUS  bit[0] = sticky done flag
//
// I2C register map  (0x7000_xxxx):
//   +0x00  CTRL  [23:16]=tx_data  [8]=rw  [6:0]=addr
//   +0x04  RX data
//   +0x08  STATUS  bit[0] = busy
//
// UART register map (0x4000_xxxx via APB bridge):
//   +0x00  TX data (write)
//   +0x04  RX data (read)
//   +0x08  STATUS  bit[1]=tx_active  bit[0]=rx_data_ready
// =============================================================================

module tb_soc_top;
// --- 1. Global Signals ---
    reg clk;
    reg reset;
    
    // --- 2. SoC Physical Pins ---
    wire  rx_pin;
    wire tx_pin;
    
    // --- 3. SoC Debug Pins ---
    wire [31:0] out_pc;
    wire [31:0] out_alu_result;
    
    
    // --- SPI Physical Pins
    wire mosi_pin;
    wire miso_pin;
    wire sclk_pin;
    wire cs_pin;
    
    // --- I2C Physical Pins
    wire i2c_scl;
    wire i2c_sda;
    
    // --- SPI Hardware Loopback ---
    assign miso_pin = mosi_pin;
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
        
        .mosi_pin(mosi_pin),
        .miso_pin(miso_pin),
        .sclk_pin(sclk_pin),
        .cs_pin(cs_pin),
        
        .i2c_sda(i2c_sda),
        .i2c_scl(i2c_scl),
        
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
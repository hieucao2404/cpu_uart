`timescale 1ns / 1ps

module soc_top (
    input  wire clk,
    input  wire reset,
    
    // External Physical Pins
    input  wire rx_pin,
    output wire tx_pin,
    
    output wire mosi_pin,
    input wire miso_pin,
    output wire sclk_pin,
    output wire cs_pin,
    
    //I2C Physical Pis
    inout wire i2c_sda,
    output wire i2c_scl
    
//    // Debug/Implementation pins
//    output wire [31:0] out_pc,
//    output wire [31:0] out_alu_result
);
    //wire clk;

  // --- AHB-Lite Master Wires (From CPU) ---
    wire [31:0] haddr;
    wire [31:0] hwdata;
    wire        hwrite;
    wire [1:0]  htrans;
    wire [2:0]  hsize;
    wire [31:0] hrdata;
    wire        hready;

    // --- AHB Slave Wires ---
    wire        hsel_apb;
    wire        hready_apb;
    wire [31:0] hrdata_apb;
    
    wire        hsel_ram;
    wire        hready_ram;
    wire [31:0] hrdata_ram;

    wire        hsel_spi;
    wire        hready_spi;
    wire [31:0] hrdata_spi;
        
    wire        hsel_pmu;
    wire        hready_pmu;
    wire [31:0] hrdata_pmu;

    // I2C Wires
    wire        hsel_i2c;
    wire        hready_i2c;
    wire [31:0] hrdata_i2c;

    // --- APB Master Wires (From Bridge to UART) ---
    wire        psel;
    wire        penable;
    wire        pwrite;
    wire [31:0] paddr;
    wire [31:0] pwdata;
    wire [31:0] prdata; 

    // =========================================================================
    // THE AHB INTERCONNECT (BUS FABRIC)
    // =========================================================================
    
    // 1. Address Decoder (Where is the CPU trying to talk?)
    wire is_ram = (haddr[31:16] == 16'h0000);
    wire is_apb = (haddr[31:16] == 16'h4000);
    wire is_spi = (haddr[31:16] == 16'h5000);
    wire is_pmu = (haddr[31:16] == 16'h6000);
    wire is_i2c = (haddr[31:16] == 16'h7000); // I2C Base Address
    
    // 2. Select Signals: Only trigger if the CPU makes a valid request (NONSEQ)
    assign hsel_ram = is_ram & (htrans == 2'b10);
    assign hsel_apb = is_apb & (htrans == 2'b10);
    assign hsel_spi = is_spi & (htrans == 2'b10);
    assign hsel_pmu = is_pmu & (htrans == 2'b10);
    assign hsel_i2c = is_i2c & (htrans == 2'b10);
    
   // --- CLOCK GATING WIRES (From PMU) ---
    wire uart_clk_en;
    wire spi_clk_en;
    wire i2c_clk_en;
    
    // --- GRACE PERIOD TIMERS ---
    // We use different sized counters because the protocols run at different speeds.
    reg [15:0]  uart_grace_counter; // Keep UART alive long enough for a full 115200 baud frame
    reg        uart_clk_en_ext;

    reg [4:0]  spi_grace_counter;  // 31 cycles is plenty for SPI's final shift
    reg        spi_clk_en_ext;

    reg [15:0] i2c_grace_counter;  // Keep I2C alive long enough for a full 400 kHz transaction
    reg        i2c_clk_en_ext;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            uart_grace_counter <= 16'd0;
            uart_clk_en_ext    <= 1'b0;

            spi_grace_counter  <= 5'd0;
            spi_clk_en_ext     <= 1'b0;

            i2c_grace_counter  <= 16'd0;
            i2c_clk_en_ext     <= 1'b0;
        end else begin
            // 1. UART Timer
            if (uart_clk_en) begin
                uart_grace_counter <= 16'd12000;
                uart_clk_en_ext    <= 1'b1;
            end else if (uart_grace_counter != 0) begin
                uart_grace_counter <= uart_grace_counter - 1;
                uart_clk_en_ext    <= 1'b1;
            end else begin
                uart_clk_en_ext    <= 1'b0;
            end

            // 2. SPI Timer
            if (spi_clk_en) begin
                spi_grace_counter <= 5'd31;
                spi_clk_en_ext    <= 1'b1;
            end else if (spi_grace_counter != 0) begin
                spi_grace_counter <= spi_grace_counter - 1;
                spi_clk_en_ext    <= 1'b1;
            end else begin
                spi_clk_en_ext    <= 1'b0;
            end

            // 3. I2C Timer (Longer countdown)
            if (i2c_clk_en) begin
                i2c_grace_counter <= 16'd20000;
                i2c_clk_en_ext    <= 1'b1;
            end else if (i2c_grace_counter != 0) begin
                i2c_grace_counter <= i2c_grace_counter - 1;
                i2c_clk_en_ext    <= 1'b1;
            end else begin
                i2c_clk_en_ext    <= 1'b0;
            end
        end
    end

    // --- FINAL GATED CLOCKS ---
    // Apply the extended enable signals to the clock gating AND gates
    wire gated_uart_clk = clk & (uart_clk_en_ext | reset);
    wire gated_spi_clk  = clk & (spi_clk_en_ext  | reset);
    wire gated_i2c_clk  = clk & (i2c_clk_en_ext  | reset);
    
//    // 3. The Data & Stall Multiplexer
//    // The CPU must stall if ANY selected peripheral asks it to wait.
//    assign hready = hready_apb & hready_ram & hready_spi & hready_pmu & hready_i2c;
     assign hready = hready_apb & hready_ram & hready_spi & hready_pmu & hready_i2c;
    // Route the requested read data back to the CPU based on the address space
    assign hrdata = is_apb ? hrdata_apb : 
                    is_spi ? hrdata_spi : 
                    is_pmu ? hrdata_pmu : 
                    is_i2c ? hrdata_i2c : 
                    hrdata_ram;
  

    // 3. The Data & Stall Multiplexer
    // The CPU must stall if ANY selected peripheral asks it to wait.
//    assign hready = hready_apb & hready_ram & hready_spi & hready_pmu;
    
 

    // =========================================================================
    // MODULE INSTANTIATIONS
    // =========================================================================

    // 1. The CPU Core (AHB Master)
    // We invert the active-high board reset to match the AHB active-low standard
    (* dont_touch = "true" *)
    cpu_core my_cpu (
        .hclk(clk),
        .hresetn(~reset),
        
        // Debug
//        .out_pc(out_pc),
//        .out_alu_result(out_alu_result),
        
        // AHB Bus
        .haddr(haddr),
        .hwdata(hwdata),
        .hwrite(hwrite),
        .htrans(htrans),
        .hsize(hsize),
        .hrdata(hrdata),
        .hready(hready)
    );

    // 2. The AHB-to-APB Bridge (AHB Slave -> APB Master)
    ahb_to_apb my_bridge (
        .hclk(clk),
        .hresetn(~reset),
        
        // AHB Slave Ports
        .hsel(hsel_apb),
        .haddr(haddr),
        .hwdata(hwdata),
        .hwrite(hwrite),
        .htrans(htrans),
        .hreadyout(hready_apb),
        .hrdata(hrdata_apb),
        
        // APB Master Ports
        .psel(psel),
        .penable(penable),
        .pwrite(pwrite),
        .paddr(paddr),
        .pwdata(pwdata),
        .prdata(prdata) 
    );

    //  The UART Peripheral (APB Slave)
    apb_uart my_uart (
        .pclk(gated_uart_clk),
        .presetn(~reset),
        
        // APB Slave Ports
        .psel(psel),
        .penable(penable),
        .pwrite(pwrite),
        .paddr(paddr),
        .pwdata(pwdata),
        .prdata(prdata), 
        .pready(), // We can leave this unconnected since our bridge assumes instant readiness for now
        
        // External Pins
        .rx_pin(rx_pin),
        .tx_pin(tx_pin)
    );
    
    ahb_spi my_spi(
        .hclk(gated_spi_clk),
        .hresetn(~reset),
        
        // AHB Slave Ports
        .hsel(hsel_spi),
        .haddr(haddr),
        .hwdata(hwdata),
        .hwrite(hwrite),
        .htrans(htrans),
        .hrdata(hrdata_spi),
        .hreadyout(hready_spi),
        
        // Physical SPI Pins
        .mosi(mosi_pin),
        .miso(miso_pin),
        .sclk(sclk_pin),
        .cs(cs_pin)
    );
    
    // . Power Management Unit
    ahb_pmu my_pmu (
        .hclk(clk),            // The PMU itself MUST always run on the main clock!
        .hresetn(~reset),
        .hsel(hsel_pmu),
        .haddr(haddr),
        .hwdata(hwdata),
        .hwrite(hwrite),
        .htrans(htrans),
        .hrdata(hrdata_pmu),
        .hreadyout(hready_pmu),
        .uart_clk_en(uart_clk_en),
        .spi_clk_en(spi_clk_en),
        .i2c_clk_en(i2c_clk_en)
    );
    
    ahb_i2c my_i2c (
        .sys_clk(clk),
        .hclk(gated_i2c_clk),
        .hresetn(~reset),
        .hsel(hsel_i2c),
        .haddr(haddr),
        .hwdata(hwdata),
        .hwrite(hwrite),
        .htrans(htrans),
        .hrdata(hrdata_i2c),
        .hreadyout(hready_i2c),
        .sda(i2c_sda),
        .scl(i2c_scl)
    );
    
    //  Hardware I2C Loopback
    // Emulate physical pull-up resistors on the open-drain SDA line
    pullup(i2c_sda);
    
    i2c_slave my_i2c_slave (
        .scl(i2c_scl),       
        .sda(i2c_sda)        
    );
    
    //. The Data RAM (AHB Slave)
    ahb_ram my_dmem (
        .hclk(clk),
        .hsel(hsel_ram),
        .haddr(haddr),
        .hwdata(hwdata),
        .hwrite(hwrite),
        .htrans(htrans),
        .hrdata(hrdata_ram),
        .hreadyout(hready_ram)
    );

endmodule

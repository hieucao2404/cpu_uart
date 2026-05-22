`timescale 1ns / 1ps

module soc_top (
    input  wire clk,
    input  wire reset,
    
    // External Physical Pins
    input  wire rx_pin,
    output wire tx_pin,
    
    // Debug/Implementation pins
    output wire [31:0] out_pc,
    output wire [31:0] out_alu_result
);

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
    wire is_apb = (haddr[31:16] == 16'h4000);
    wire is_ram = (haddr[31:16] == 16'h0000);
    
    // 2. Select Signals: Only trigger if the CPU is making a valid request (NONSEQ)
    assign hsel_apb = is_apb & (htrans == 2'b10);
    assign hsel_ram = is_ram & (htrans == 2'b10);

    // 3. The Data & Stall Multiplexer
    // The CPU must stall if ANY selected peripheral asks it to wait.
    assign hready = hready_apb & hready_ram; 
    
    // Route the requested read data back to the CPU based on the address space
    assign hrdata = is_apb ? hrdata_apb : hrdata_ram;

    // =========================================================================
    // MODULE INSTANTIATIONS
    // =========================================================================

    // 1. The CPU Core (AHB Master)
    // We invert the active-high board reset to match the AHB active-low standard
    cpu_core my_cpu (
        .hclk(clk),
        .hresetn(~reset),
        
        // Debug
        .out_pc(out_pc),
        .out_alu_result(out_alu_result),
        
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
        .pwdata(pwdata)
    );

    // 3. The UART Peripheral (APB Slave)
    apb_uart my_uart (
        .pclk(clk),
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

    // 4. The Data RAM (AHB Slave)
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
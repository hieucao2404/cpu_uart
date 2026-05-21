`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2026 02:18:28 PM
// Design Name: 
// Module Name: soc_top
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


module soc_top(
    input clk,
    input reset,
    
    //Physical UART pins to the real world
    input rx_pin,
    output wire tx_pin,
    
    //Debug/Implementation pins (so Vivado doesn't delete the design!)
    output wire [31:0] out_pc,
    output wire [31:0] out_alu_result
    );
    
    // --- 1. Motherboard Interconnect Wires ---
    
    // CPU Memory Wires
    wire [31:0] cpu_mem_addr;
    wire [31:0] cpu_mem_wdata;
    wire [31:0] cpu_mem_rdata;
    wire        cpu_mem_we;
    wire        cpu_mem_re;
    
    // APB Bridge Wires
    wire [31:0] apb_paddr;
    wire [31:0] apb_pwdata;
    wire [31:0] apb_prdata;
    wire        apb_pwrite;
    wire        apb_penable;
    wire        apb_psel;
    wire        apb_pready;
    wire [31:0] apb_rdata_out; // Data coming back from the bridge to the CPU

    // Data Memory (RAM) Wires
    wire [31:0] ram_rdata;
    wire        ram_we;
    wire        ram_re;
    
    // 2.--- The Address Decode (The Traffic Cop) ---
    //Rule: Any address starting with 0x4000 belongs to the APB bus (UART)
    wire is_apb_addr = (cpu_mem_addr[31:16] == 16'h4000);
    
    //Generate the "transfer" signal to wake up the APB master FSM
    wire apb_transfer = is_apb_addr & (cpu_mem_we | cpu_mem_re);
    
    // The RAM only gets Write/Read signals if the address is NOT in the APB range
    assign ram_we = cpu_mem_we & ~is_apb_addr;
    assign ram_re = cpu_mem_re & ~is_apb_addr;
    
    // the input multiplexer: Route the correct data back to the CPU
    assign cpu_mem_rdata = (is_apb_addr) ?  apb_rdata_out : ram_rdata;
    
    // --- 3. Instantiations (Plugging the chips into the motherboard) ---
    
    // The Brain
    cpu_core my_cpu (
        .clk(clk),
        .reset(reset),
        .out_pc(out_pc),
        .out_alu_result(out_alu_result),
        
        .mem_addr_out(cpu_mem_addr),
        .mem_wdata_out(cpu_mem_wdata),
        .mem_write_out(cpu_mem_we),
        .mem_read_out(cpu_mem_re),
        .mem_rdata_in(cpu_mem_rdata)
    );

    // Data Memory (RAM)
    dmem my_ram (
        .clk(clk),
        .mem_write(ram_we),
        .mem_read(ram_re),
        .address(cpu_mem_addr),
        .write_data(cpu_mem_wdata),
        .read_data(ram_rdata)
    );

    // The Bus (CPU to APB Bridge)
    apb_master my_bridge (
        .clk(clk),
        .reset_n(~reset),           // APB uses active-low reset
        .transfer(apb_transfer),
        .addr(cpu_mem_addr),
        .wdata(cpu_mem_wdata),
        .write(cpu_mem_we),
        .prdata(apb_prdata),        // Data coming FROM UART
        .pselx(apb_psel),
        .penable(apb_penable),
        .paddr(apb_paddr),
        .pwdata(apb_pwdata),
        .pwrite(apb_pwrite),
        .pready(apb_pready),        // Ready coming FROM UART
        .rdata(apb_rdata_out)       // Data going BACK to CPU
    );

    // The Peripheral (APB UART)
    apb_uart my_uart (
        .pclk(clk),
        .presetn(~reset),           // APB uses active-low reset
        .paddr(apb_paddr),
        .psel(apb_psel),
        .penable(apb_penable),
        .pwrite(apb_pwrite),
        .pwdata(apb_pwdata),
        .prdata(apb_prdata),
        .pready(apb_pready),
        .rx_pin(rx_pin),
        .tx_pin(tx_pin)
    );
endmodule

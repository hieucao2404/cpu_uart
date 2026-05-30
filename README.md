# Custom 32-bit RISC-V System-on-Chip (SoC)

A custom-designed, single-cycle 32-bit RISC-V System-on-Chip written entirely in Verilog. This SoC features a modular AMBA bus architecture (AHB-Lite and APB) and a dedicated Power Management Unit (PMU) for dynamic clock gating.

It is designed to serve as the highly efficient, central embedded controller for complex hardware systems, specifically tailored for driving sensor networks (I2C/SPI), serial debug interfaces (UART), and high-speed mechanical actuators.

## 🏗️ System Architecture

At the heart of the design is a bespoke, single-cycle RV32I core. Instead of directly polling hardware, the CPU communicates with a central AHB-Lite interconnect fabric, which seamlessly routes instructions and payloads to memory-mapped peripherals.

### Core Components

* **CPU:** 32-bit RISC-V Single-Cycle Core.
* **Bus Fabric:** AHB-Lite Interconnect with combinatorial address decoding and stall (`hready`) multiplexing.
* **Memory:** 16kB block RAM (Single-cycle combinatorial read).
* **Power Management Unit (PMU):** A memory-mapped register block that individually gates the `hclk` lines to specific peripherals, minimizing dynamic power consumption when hardware is idle.

### Peripheral Bridges

* **AHB-to-APB Bridge:** Translates high-speed AHB transactions into APB setup/access phases.
* **APB UART:** Serial communication (115200 baud).
* **AHB SPI Master:** High-speed synchronous serial interface.
* **AHB I2C Master:** Fast Mode (400kHz) two-wire interface. Features specialized pipeline logic to handle clock domain crossing (CDC) between the 100MHz CPU domain and the slow 400kHz physical bus, complete with start/stop conditions and ACK/NACK generation.

## 🗺️ Memory Map

The system utilizes a memory-mapped I/O (MMIO) architecture. Peripherals are addressed sequentially starting from `0x4000_0000`.

| Base Address | Module | Description | Registers |
| --- | --- | --- | --- |
| `0x0000_0000` | **RAM** | 16kB Main Data Memory | N/A |
| `0x4000_0000` | **UART** | APB Serial Interface | `0x00`: TX Data<br>

<br>`0x04`: RX Data<br>

<br>`0x08`: Status (Ready/Busy) |
| `0x5000_0000` | **SPI** | AHB SPI Master | `0x00`: TX Data<br>

<br>`0x04`: RX Data<br>

<br>`0x08`: Status (Sticky Done) |
| `0x6000_0000` | **PMU** | Power Management Unit | `0x00`: Clock Gate Register<br>

<br> * Bit 0: UART Enable<br>

<br> * Bit 1: SPI Enable<br>

<br> * Bit 2: I2C Enable |
| `0x7000_0000` | **I2C** | AHB I2C Master | `0x00`: Command (Addr [6:0], RW [8], TX Data)<br>

<br>`0x04`: RX Data<br>

<br>`0x08`: Status (Busy) |

## 🚀 Getting Started (Linux / Vivado)

This project is built and simulated using Xilinx Vivado.

### 1. Load the Firmware

The CPU executes raw machine code loaded into the instruction memory module. To update the firmware, edit the `program.mem` file located in the simulation directory.

* Hex values should be written one 32-bit word per line.

### 2. Run the Simulation

If you prefer a Linux CLI workflow over the Vivado GUI, you can run the simulation using `xsim`:

```bash
# Compile the Verilog files
xvlog -sv src/*.v testbenches/*.v

# Elaborate the design
xelab -debug typical -top soc_top -snapshot soc_snapshot

# Run the simulation
xsim soc_snapshot -R

```

*(For graphical waveform debugging, launch the Vivado GUI and add the physical pins (`mosi_pin`, `tx_pin`, `i2c_sda`, `i2c_scl`) to your wave configuration).*

## 🧪 Verification & Testing

The SoC includes robust hardware simulation tests to verify bus arbitration, clock domain crossing, and concurrent peripheral execution.

### Full-System Concurrency Test

The `program.mem` includes an integration test that wakes up the PMU and simultaneously fires the UART (`0xAB`), SPI (`0x5A`), and I2C (`0xCD`) transmissions. The CPU successfully enters a high-speed polling loop, harvesting the data from each peripheral exactly as their physical wire transmissions conclude.

### Clock Gating Rejection Test

Proves PMU security and power savings. The CPU attempts a ghost write to the SPI module while its PMU bit is set to `0`. The peripheral safely ignores the data, remaining entirely frozen until the CPU restores its clock.

*** ### Future Roadmap

* Implement standard C compiler support (RISC-V GCC) to replace manual assembly/hex coding.
* Integrate physical external components (OLED screens, liquid level sensors, temperature relays).
* Synthesize the design onto a physical FPGA target.

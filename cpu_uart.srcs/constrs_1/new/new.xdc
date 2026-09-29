create_clock -period 10000 [get_ports clk]

## ===================================================================
## 1. SYSTEM CLOCK (AC701 uses a 200MHz Differential Clock)
## ===================================================================
## Note: The AC701 does not have a native 100MHz single-ended clock. 
## It uses a 200MHz LVDS pair on pins R3 and P3.
#set_property PACKAGE_PIN R3 [get_ports clk_p]
#set_property IOSTANDARD DIFF_SSTL15 [get_ports clk_p]
#set_property PACKAGE_PIN P3 [get_ports clk_n]
#set_property IOSTANDARD DIFF_SSTL15 [get_ports clk_n]

#create_clock -period 5.000 -name sys_clk_pin -waveform {0.000 2.500} -add [get_ports clk_p]

## ===================================================================
## 2. SYSTEM RESET (CPU Reset Button on AC701)
## ===================================================================
## Pin U4 is the "CPU_RESET" button on the AC701.
#set_property PACKAGE_PIN U4 [get_ports reset]
#set_property IOSTANDARD SSTL15 [get_ports reset]

## ===================================================================
## 3. UART TRANSMIT / RECEIVE (USB-UART Bridge)
## ===================================================================
## IMPORTANT: The UART bridge on the AC701 is wired to FPGA Bank 13. 
## Bank 13 runs at 1.8 Volts! You MUST use LVCMOS18, not LVCMOS33.
#set_property PACKAGE_PIN T19 [get_ports tx_pin]
#set_property IOSTANDARD LVCMOS18 [get_ports tx_pin]

#set_property PACKAGE_PIN U19 [get_ports rx_pin]
#set_property IOSTANDARD LVCMOS18 [get_ports rx_pin]

## ===================================================================
## 4. SPI & I2C (Map these to PMOD Header J58)
## ===================================================================
## The AC701 PMOD header (J58) is level-shifted to 3.3V. 
## Replace the "___" with the specific PMOD pins you wire your devices to.
#set_property PACKAGE_PIN P24 [get_ports mosi_pin]
#set_property IOSTANDARD LVCMOS18 [get_ports mosi_pin]

#set_property PACKAGE_PIN R25 [get_ports miso_pin]
#set_property IOSTANDARD LVCMOS18 [get_ports miso_pin]

#set_property PACKAGE_PIN R26 [get_ports sclk_pin]
#set_property IOSTANDARD LVCMOS18 [get_ports sclk_pin]

#set_property PACKAGE_PIN T24 [get_ports cs_pin]
#set_property IOSTANDARD LVCMOS18 [get_ports cs_pin]

#set_property PACKAGE_PIN T25 [get_ports i2c_scl]
#set_property IOSTANDARD LVCMOS18 [get_ports i2c_scl]

#set_property PACKAGE_PIN U26 [get_ports i2c_sda]
#set_property IOSTANDARD LVCMOS18 [get_ports i2c_sda]

## Enable internal pull-ups for I2C if your external modules don't have them
#set_property PULLUP true [get_ports i2c_scl]
#set_property PULLUP true [get_ports i2c_sda]
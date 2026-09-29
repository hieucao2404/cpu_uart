# File saved with Nlview 6.8.11  2018-08-07 bk=1.4403 VDI=40 GEI=35 GUI=JA:9.0 non-TLS-threadsafe
# 
# non-default properties - (restore without -noprops)
property attrcolor #000000
property attrfontsize 8
property autobundle 1
property backgroundcolor #ffffff
property boxcolor0 #000000
property boxcolor1 #000000
property boxcolor2 #000000
property boxinstcolor #000000
property boxpincolor #000000
property buscolor #008000
property closeenough 5
property createnetattrdsp 2048
property decorate 1
property elidetext 40
property fillcolor1 #ffffcc
property fillcolor2 #dfebf8
property fillcolor3 #f0f0f0
property gatecellname 2
property instattrmax 30
property instdrag 15
property instorder 1
property marksize 12
property maxfontsize 18
property maxzoom 7.5
property netcolor #19b400
property objecthighlight0 #ff00ff
property objecthighlight1 #ffff00
property objecthighlight2 #00ff00
property objecthighlight3 #ff6666
property objecthighlight4 #0000ff
property objecthighlight5 #ffc800
property objecthighlight7 #00ffff
property objecthighlight8 #ff00ff
property objecthighlight9 #ccccff
property objecthighlight10 #0ead00
property objecthighlight11 #cefc00
property objecthighlight12 #9e2dbe
property objecthighlight13 #ba6a29
property objecthighlight14 #fc0188
property objecthighlight15 #02f990
property objecthighlight16 #f1b0fb
property objecthighlight17 #fec004
property objecthighlight18 #149bff
property objecthighlight19 #eb591b
property overlapcolor #19b400
property pbuscolor #000000
property pbusnamecolor #000000
property pinattrmax 20
property pinorder 2
property pinpermute 0
property portcolor #000000
property portnamecolor #000000
property ripindexfontsize 8
property rippercolor #000000
property rubberbandcolor #000000
property rubberbandfontsize 18
property selectattr 0
property selectionappearance 2
property selectioncolor #0000ff
property sheetheight 44
property sheetwidth 68
property showmarks 1
property shownetname 0
property showpagenumbers 1
property showripindex 4
property timelimit 1
#
module new soc_top work:soc_top:NOFILE -nosplit
load symbol RTL_OR1 work OR pin I0 input pin I1 input pin O output fillcolor 1
load symbol RTL_AND0 work AND pin I0 input pin I1 input pin O output fillcolor 1
load symbol RTL_MUX6 work MUX pin S input.bot pinBus I0 input.left [31:0] pinBus I1 input.left [31:0] pinBus O output.right [31:0] fillcolor 1
load symbol RTL_INV work INV pin I0 input pin O output fillcolor 1
load symbol RTL_MUX215 work MUX pin O output.right pinBus I0 input.left [0:0] pinBus S input.bot [1:0] fillcolor 1
load symbol RTL_EQ16 work RTL(=) pin O output.right pinBus I0 input.left [15:0] pinBus I1 input.left [15:0] fillcolor 1
load symbol ahb_to_apb work:ahb_to_apb:NOFILE HIERBOX pin hclk input.left pin hreadyout output.right pin hresetn input.left pin hsel input.left pin hwrite input.left pin penable output.right pin psel output.right pin pwrite output.right pinBus haddr input.left [31:0] pinBus hrdata output.right [31:0] pinBus htrans input.left [1:0] pinBus hwdata input.left [31:0] pinBus paddr output.right [31:0] pinBus prdata input.left [31:0] pinBus pwdata output.right [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol cpu_core work:cpu_core:NOFILE HIERBOX pin hclk input.left pin hready input.left pin hresetn input.left pin hwrite output.right pinBus haddr output.right [31:0] pinBus hrdata input.left [31:0] pinBus hsize output.right [2:0] pinBus htrans output.right [1:0] pinBus hwdata output.right [31:0] pinBus out_alu_result output.right [31:0] pinBus out_pc output.right [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol ahb_ram work:ahb_ram:NOFILE HIERBOX pin hclk input.left pin hreadyout output.right pin hsel input.left pin hwrite input.left pinBus haddr input.left [31:0] pinBus hrdata output.right [31:0] pinBus htrans input.left [1:0] pinBus hwdata input.left [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol ahb_i2c work:ahb_i2c:NOFILE HIERBOX pin hclk input.left pin hreadyout output.right pin hresetn input.left pin hsel input.left pin hwrite input.left pin scl output.right pin sda inout.right pin sys_clk input.left pinBus haddr input.left [31:0] pinBus hrdata output.right [31:0] pinBus htrans input.left [1:0] pinBus hwdata input.left [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol i2c_slave work:i2c_slave:NOFILE HIERBOX pin scl input.left pin sda inout.right boxcolor 1 fillcolor 2 minwidth 13%
load symbol ahb_pmu work:ahb_pmu:NOFILE HIERBOX pin hclk input.left pin hreadyout output.right pin hresetn input.left pin hsel input.left pin hwrite input.left pin i2c_clk_en output.right pin spi_clk_en output.right pin uart_clk_en output.right pinBus haddr input.left [31:0] pinBus hrdata output.right [31:0] pinBus htrans input.left [1:0] pinBus hwdata input.left [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol ahb_spi work:ahb_spi:NOFILE HIERBOX pin cs output.right pin hclk input.left pin hreadyout output.right pin hresetn input.left pin hsel input.left pin hwrite input.left pin miso input.left pin mosi output.right pin sclk output.right pinBus haddr input.left [31:0] pinBus hrdata output.right [31:0] pinBus htrans input.left [1:0] pinBus hwdata input.left [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol apb_uart work:apb_uart:NOFILE HIERBOX pin pclk input.left pin penable input.left pin pready output.right pin presetn input.left pin psel input.left pin pwrite input.left pin rx_pin input.left pin tx_pin output.right pinBus paddr input.left [31:0] pinBus prdata output.right [31:0] pinBus pwdata input.left [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol uart_core work:uart_core:NOFILE HIERBOX pin clk input.left pin reset input.left pin rx_done output.right pin rx_pin input.left pin tx_active output.right pin tx_done output.right pin tx_pin output.right pin tx_start input.left pinBus rx_data output.right [7:0] pinBus tx_data input.left [7:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol RTL_MUX69 work MUX pinBus I0 input.left [31:0] pinBus I1 input.left [31:0] pinBus I2 input.left [31:0] pinBus O output.right [31:0] pinBus S input.bot [7:0] fillcolor 1
load symbol RTL_EQ3 work RTL(=) pin O output.right pinBus I0 input.left [7:0] pinBus I1 input.left [7:0] fillcolor 1
load symbol RTL_MUX18 work MUX pin I0 input.left pin I1 input.left pin O output.right pin S input.bot fillcolor 1
load symbol RTL_REG_SYNC__BREG_5 work GEN pin C input.clk.left pin CE input.left pin D input.left pin Q output.right pin RST input.top fillcolor 1
load symbol RTL_REG_SYNC__BREG_11 work GEN pin C input.clk.left pin D input.left pin Q output.right pin RST input.top fillcolor 1
load symbol RTL_REG_SYNC__BREG_5 work[7:0]sswws GEN pin C input.clk.left pin CE input.left pinBus D input.left [7:0] pinBus Q output.right [7:0] pin RST input.top fillcolor 1 sandwich 3 prop @bundle 8
load symbol rx work:rx:NOFILE HIERBOX pin clk input.left pin reset input.left pin rx input.left pin rx_done output.right pinBus rx_data output.right [7:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol tx work:tx:NOFILE HIERBOX pin clk input.left pin reset input.left pin tx output.right pin tx_active output.right pin tx_done output.right pin tx_start input.left pinBus tx_data input.left [7:0] boxcolor 1 fillcolor 2 minwidth 13%
load port i2c_sda inout -pg 1 -y 910
load port mosi_pin output -pg 1 -y 680
load port sclk_pin output -pg 1 -y 710
load port i2c_scl output -pg 1 -y 880
load port rx_pin input -pg 1 -y 140
load port clk input -pg 1 -y 220
load port cs_pin output -pg 1 -y 620
load port miso_pin input -pg 1 -y 1180
load port tx_pin output -pg 1 -y 190
load port reset input -pg 1 -y 110
load inst gated_uart_clk0_i RTL_OR1 work -attr @cell(#000000) RTL_OR -pg 1 -lvl 13 -y 330
load inst hready0_i RTL_AND0 work -attr @cell(#000000) RTL_AND -pg 1 -lvl 6 -y 510
load inst my_uart apb_uart work:apb_uart:NOFILE -autohide -attr @cell(#000000) apb_uart -attr @fillcolor #fafafa -pinAttr pready @attr n/c -pinBusAttr paddr @name paddr[31:0] -pinBusAttr prdata @name prdata[31:0] -pinBusAttr pwdata @name pwdata[31:0] -pg 1 -lvl 15 -y 108
load inst my_uart|prdata1_i RTL_AND0 work -hier my_uart -attr @cell(#000000) RTL_AND -attr @name prdata1_i -pg 1 -lvl 8 -y 708
load inst hsel_ram_i RTL_AND0 work -attr @cell(#000000) RTL_AND -pg 1 -lvl 2 -y 390
load inst hsel_spi_i RTL_AND0 work -attr @cell(#000000) RTL_AND -pg 1 -lvl 14 -y 850
load inst htrans_i RTL_MUX215 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0 -pinBusAttr I0 @attr S=2'b10 -pinBusAttr S @name S[1:0] -pg 1 -lvl 1 -y 590
load inst my_uart|my_raw_uart uart_core work:uart_core:NOFILE -hier my_uart -autohide -attr @cell(#000000) uart_core -attr @name my_raw_uart -attr @fillcolor #fafafa -pinAttr tx_done @attr n/c -pinBusAttr rx_data @name rx_data[7:0] -pinBusAttr tx_data @name tx_data[7:0] -pg 1 -lvl 5 -y 376
load inst my_uart|rx_data_ready2_i RTL_INV work -hier my_uart -attr @cell(#000000) RTL_INV -attr @name rx_data_ready2_i -pg 1 -lvl 3 -y 748
load inst my_uart|my_raw_uart|rx_inst rx work:rx:NOFILE -hier my_uart|my_raw_uart -autohide -attr @cell(#000000) rx -attr @name rx_inst -pinBusAttr rx_data @name rx_data[7:0] -pg 1 -lvl 1 -y 396
load inst hrdata0_i RTL_MUX6 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[31:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[31:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[31:0] -pg 1 -lvl 6 -y 900
load inst hrdata1_i RTL_MUX6 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[31:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[31:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[31:0] -pg 1 -lvl 5 -y 830
load inst hrdata_i RTL_MUX6 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[31:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[31:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[31:0] -pg 1 -lvl 7 -y 610
load inst hsel_apb_i RTL_AND0 work -attr @cell(#000000) RTL_AND -pg 1 -lvl 2 -y 460
load inst my_bridge ahb_to_apb work:ahb_to_apb:NOFILE -autohide -attr @cell(#000000) ahb_to_apb -pinBusAttr haddr @name haddr[31:0] -pinBusAttr hrdata @name hrdata[31:0] -pinBusAttr htrans @name htrans[1:0] -pinBusAttr hwdata @name hwdata[31:0] -pinBusAttr paddr @name paddr[31:0] -pinBusAttr prdata @name prdata[31:0] -pinBusAttr pwdata @name pwdata[31:0] -pg 1 -lvl 3 -y 210
load inst my_uart|prdata_i__0 RTL_MUX6 work -hier my_uart -attr @cell(#000000) RTL_MUX -attr @name prdata_i__0 -pinBusAttr I0 @name I0[31:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[31:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[31:0] -pg 1 -lvl 9 -y 488
load inst my_uart|rx_data_ready1_i RTL_AND0 work -hier my_uart -attr @cell(#000000) RTL_AND -attr @name rx_data_ready1_i -pg 1 -lvl 4 -y 718
load inst gated_i2c_clk0_i RTL_OR1 work -attr @cell(#000000) RTL_OR -pg 1 -lvl 12 -y 60
load inst my_cpu cpu_core work:cpu_core:NOFILE -autohide -attr @cell(#000000) cpu_core -pinBusAttr haddr @name haddr[31:0] -pinBusAttr hrdata @name hrdata[31:0] -pinBusAttr hsize @name hsize[2:0] -pinBusAttr hsize @attr n/c -pinBusAttr htrans @name htrans[1:0] -pinBusAttr hwdata @name hwdata[31:0] -pinBusAttr out_alu_result @name out_alu_result[31:0] -pinBusAttr out_alu_result @attr n/c -pinBusAttr out_pc @name out_pc[31:0] -pinBusAttr out_pc @attr n/c -pg 1 -lvl 8 -y 560
load inst my_uart|prdata_i RTL_MUX69 work -hier my_uart -attr @cell(#000000) RTL_MUX -attr @name prdata_i -pinBusAttr I0 @name I0[31:0] -pinBusAttr I0 @attr S=8'b00000100 -pinBusAttr I1 @name I1[31:0] -pinBusAttr I1 @attr S=8'b00001000 -pinBusAttr I2 @name I2[31:0] -pinBusAttr I2 @attr S=default -pinBusAttr O @name O[31:0] -pinBusAttr S @name S[7:0] -pg 1 -lvl 8 -y 478
load inst my_uart|rx_data_ready_i RTL_MUX18 work -hier my_uart -attr @cell(#000000) RTL_MUX -attr @name rx_data_ready_i -pinAttr I0 @attr S=1'b1 -pinAttr I1 @attr S=default -pg 1 -lvl 6 -y 618
load inst my_uart|rx_data_ready_i__0 RTL_MUX18 work -hier my_uart -attr @cell(#000000) RTL_MUX -attr @name rx_data_ready_i__0 -pinAttr I0 @attr S=1'b0 -pinAttr I1 @attr S=default -pg 1 -lvl 6 -y 348
load inst my_uart|tx_data_in_i RTL_MUX18 work -hier my_uart -attr @cell(#000000) RTL_MUX -attr @name tx_data_in_i -pinAttr I0 @attr S=1'b0 -pinAttr I1 @attr S=default -pg 1 -lvl 3 -y 418
load inst my_uart|tx_start1_i RTL_AND0 work -hier my_uart -attr @cell(#000000) RTL_AND -attr @name tx_start1_i -pg 1 -lvl 2 -y 448
load inst my_uart|my_raw_uart|tx_inst tx work:tx:NOFILE -hier my_uart|my_raw_uart -autohide -attr @cell(#000000) tx -attr @name tx_inst -pinBusAttr tx_data @name tx_data[7:0] -pg 1 -lvl 1 -y 526
load inst hsel_i2c_i RTL_AND0 work -attr @cell(#000000) RTL_AND -pg 1 -lvl 13 -y 780
load inst is_i2c_i RTL_EQ16 work -attr @cell(#000000) RTL_EQ -pinBusAttr I0 @name I0[15:0] -pinBusAttr I1 @name I1[15:0] -pinBusAttr I1 @attr V=B\"0111000000000000\" -pg 1 -lvl 3 -y 850
load inst my_i2c_slave i2c_slave work:i2c_slave:NOFILE -autohide -attr @cell(#000000) i2c_slave -pg 1 -lvl 15 -y 1518
load inst my_uart|rx_data_ready1_i__0 RTL_EQ3 work -hier my_uart -attr @cell(#000000) RTL_EQ -attr @name rx_data_ready1_i__0 -pinBusAttr I0 @name I0[7:0] -pinBusAttr I1 @name I1[7:0] -pinBusAttr I1 @attr V=B\"00000100\" -pg 1 -lvl 4 -y 598
load inst my_dmem ahb_ram work:ahb_ram:NOFILE -autohide -attr @cell(#000000) ahb_ram -pinBusAttr haddr @name haddr[31:0] -pinBusAttr hrdata @name hrdata[31:0] -pinBusAttr htrans @name htrans[1:0] -pinBusAttr hwdata @name hwdata[31:0] -pg 1 -lvl 3 -y 450
load inst my_uart|tx_start0_i RTL_AND0 work -hier my_uart -attr @cell(#000000) RTL_AND -attr @name tx_start0_i -pg 1 -lvl 3 -y 308
load inst my_uart|tx_start_reg RTL_REG_SYNC__BREG_11 work -hier my_uart -attr @cell(#000000) RTL_REG_SYNC -attr @name tx_start_reg -pg 1 -lvl 4 -y 198
load inst gated_spi_clk_i RTL_AND0 work -attr @cell(#000000) RTL_AND -pg 1 -lvl 14 -y 390
load inst my_uart|tx_start1_i__0 RTL_EQ3 work -hier my_uart -attr @cell(#000000) RTL_EQ -attr @name tx_start1_i__0 -pinBusAttr I0 @name I0[7:0] -pinBusAttr I1 @name I1[7:0] -pg 1 -lvl 2 -y 318
load inst my_uart|tx_start2_i RTL_AND0 work -hier my_uart -attr @cell(#000000) RTL_AND -attr @name tx_start2_i -pg 1 -lvl 1 -y 438
load inst my_uart|tx_data_in_reg[7:0] RTL_REG_SYNC__BREG_5 work[7:0]sswws -hier my_uart -attr @cell(#000000) RTL_REG_SYNC -attr @name tx_data_in_reg[7:0] -pg 1 -lvl 4 -y 328
load inst gated_spi_clk0_i RTL_OR1 work -attr @cell(#000000) RTL_OR -pg 1 -lvl 13 -y 400
load inst gated_uart_clk_i RTL_AND0 work -attr @cell(#000000) RTL_AND -pg 1 -lvl 14 -y 320
load inst hready2_i RTL_AND0 work -attr @cell(#000000) RTL_AND -pg 1 -lvl 4 -y 510
load inst hresetn0_i RTL_INV work -attr @cell(#000000) RTL_INV -pg 1 -lvl 2 -y 260
load inst hsel_pmu_i RTL_AND0 work -attr @cell(#000000) RTL_AND -pg 1 -lvl 10 -y 1010
load inst is_pmu_i RTL_EQ16 work -attr @cell(#000000) RTL_EQ -pinBusAttr I0 @name I0[15:0] -pinBusAttr I1 @name I1[15:0] -pinBusAttr I1 @attr V=B\"0110000000000000\" -pg 1 -lvl 9 -y 1110
load inst my_i2c ahb_i2c work:ahb_i2c:NOFILE -autohide -attr @cell(#000000) ahb_i2c -pinBusAttr haddr @name haddr[31:0] -pinBusAttr hrdata @name hrdata[31:0] -pinBusAttr htrans @name htrans[1:0] -pinBusAttr hwdata @name hwdata[31:0] -pg 1 -lvl 14 -y 570
load inst my_pmu ahb_pmu work:ahb_pmu:NOFILE -autohide -attr @cell(#000000) ahb_pmu -pinBusAttr haddr @name haddr[31:0] -pinBusAttr hrdata @name hrdata[31:0] -pinBusAttr htrans @name htrans[1:0] -pinBusAttr hwdata @name hwdata[31:0] -pg 1 -lvl 11 -y 300
load inst my_uart|rx_data_ready_reg RTL_REG_SYNC__BREG_5 work -hier my_uart -attr @cell(#000000) RTL_REG_SYNC -attr @name rx_data_ready_reg -pg 1 -lvl 7 -y 608
load inst hready1_i RTL_AND0 work -attr @cell(#000000) RTL_AND -pg 1 -lvl 5 -y 420
load inst is_ram_i RTL_EQ16 work -attr @cell(#000000) RTL_EQ -pinBusAttr I0 @name I0[15:0] -pinBusAttr I1 @name I1[15:0] -pg 1 -lvl 1 -y 380
load inst my_uart|tx_start_i RTL_MUX18 work -hier my_uart -attr @cell(#000000) RTL_MUX -attr @name tx_start_i -pinAttr I0 @attr S=1'b0 -pinAttr I1 @attr S=default -pg 1 -lvl 3 -y 168
load inst gated_i2c_clk_i RTL_AND0 work -attr @cell(#000000) RTL_AND -pg 1 -lvl 13 -y 80
load inst is_spi_i RTL_EQ16 work -attr @cell(#000000) RTL_EQ -pinBusAttr I0 @name I0[15:0] -pinBusAttr I1 @name I1[15:0] -pinBusAttr I1 @attr V=B\"0101000000000000\" -pg 1 -lvl 5 -y 960
load inst my_uart|uart_reset_i RTL_INV work -hier my_uart -attr @cell(#000000) RTL_INV -attr @name uart_reset_i -pg 1 -lvl 4 -y 448
load inst hrdata2_i RTL_MUX6 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[31:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[31:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[31:0] -pg 1 -lvl 4 -y 790
load inst hready_i RTL_AND0 work -attr @cell(#000000) RTL_AND -pg 1 -lvl 7 -y 420
load inst is_apb_i RTL_EQ16 work -attr @cell(#000000) RTL_EQ -pinBusAttr I0 @name I0[15:0] -pinBusAttr I1 @name I1[15:0] -pinBusAttr I1 @attr V=B\"0100000000000000\" -pg 1 -lvl 1 -y 480
load inst my_spi ahb_spi work:ahb_spi:NOFILE -autohide -attr @cell(#000000) ahb_spi -pinBusAttr haddr @name haddr[31:0] -pinBusAttr hrdata @name hrdata[31:0] -pinBusAttr htrans @name htrans[1:0] -pinBusAttr hwdata @name hwdata[31:0] -pg 1 -lvl 15 -y 1278
load inst my_uart|rx_data_ready0_i RTL_AND0 work -hier my_uart -attr @cell(#000000) RTL_AND -attr @name rx_data_ready0_i -pg 1 -lvl 5 -y 756
load net hrdata_pmu[13] -attr @rip hrdata[13] -pin hrdata1_i I0[13] -pin my_pmu hrdata[13]
load net hrdata2_i_n_19 -attr @rip O[12] -pin hrdata1_i I1[12] -pin hrdata2_i O[12]
load net my_uart|prdata_i_n_0 -attr @rip(#000000) O[31] -attr @name prdata_i_n_0 -pin my_uart|prdata_i O[31] -pin my_uart|prdata_i__0 I0[31]
load net hrdata[20] -attr @rip O[20] -pin hrdata_i O[20] -pin my_cpu hrdata[20]
load net hrdata_apb[21] -attr @rip hrdata[21] -pin hrdata_i I0[21] -pin my_bridge hrdata[21]
load net p_0_in[9] -attr @rip haddr[25] -pin is_apb_i I0[9] -pin is_i2c_i I0[9] -pin is_pmu_i I0[9] -pin is_ram_i I0[9] -pin is_spi_i I0[9] -pin my_bridge haddr[25] -pin my_cpu haddr[25] -pin my_dmem haddr[25] -pin my_i2c haddr[25] -pin my_pmu haddr[25] -pin my_spi haddr[25]
load net my_uart|prdata_i_n_1 -attr @rip(#000000) O[30] -attr @name prdata_i_n_1 -pin my_uart|prdata_i O[30] -pin my_uart|prdata_i__0 I0[30]
load net hwdata[16] -attr @rip hwdata[16] -pin my_bridge hwdata[16] -pin my_cpu hwdata[16] -pin my_dmem hwdata[16] -pin my_i2c hwdata[16] -pin my_pmu hwdata[16] -pin my_spi hwdata[16]
load net hwdata[1] -attr @rip hwdata[1] -pin my_bridge hwdata[1] -pin my_cpu hwdata[1] -pin my_dmem hwdata[1] -pin my_i2c hwdata[1] -pin my_pmu hwdata[1] -pin my_spi hwdata[1]
load net my_uart|prdata_i_n_2 -attr @rip(#000000) O[29] -attr @name prdata_i_n_2 -pin my_uart|prdata_i O[29] -pin my_uart|prdata_i__0 I0[29]
load net my_uart|rx_data_out[7] -attr @rip(#000000) rx_data[7] -attr @name rx_data_out[7] -pin my_uart|my_raw_uart rx_data[7] -pin my_uart|prdata_i I0[7]
load net my_uart|rx_data_ready1_i__0_n_0 -attr @name rx_data_ready1_i__0_n_0 -pin my_uart|rx_data_ready0_i I1 -pin my_uart|rx_data_ready1_i__0 O
netloc my_uart|rx_data_ready1_i__0_n_0 1 4 1 6370J
load net hrdata_ram[11] -attr @rip hrdata[11] -pin hrdata2_i I1[11] -pin my_dmem hrdata[11]
load net my_uart|prdata_i_n_3 -attr @rip(#000000) O[28] -attr @name prdata_i_n_3 -pin my_uart|prdata_i O[28] -pin my_uart|prdata_i__0 I0[28]
load net paddr[5] -attr @rip paddr[5] -pin my_bridge paddr[5] -pin my_uart paddr[5]
load net prdata[15] -attr @rip prdata[15] -pin my_bridge prdata[15] -pin my_uart prdata[15]
load net my_uart|prdata_i_n_4 -attr @rip(#000000) O[27] -attr @name prdata_i_n_4 -pin my_uart|prdata_i O[27] -pin my_uart|prdata_i__0 I0[27]
load net my_uart|my_raw_uart|rx_done -attr @name rx_done -hierPin my_uart|my_raw_uart rx_done -pin my_uart|my_raw_uart|rx_inst rx_done
netloc my_uart|my_raw_uart|rx_done 1 1 1 N
load net my_uart|my_raw_uart|tx_data[7] -attr @rip tx_data[7] -attr @name tx_data[7] -hierPin my_uart|my_raw_uart tx_data[7] -pin my_uart|my_raw_uart|tx_inst tx_data[7]
load net hrdata[29] -attr @rip O[29] -pin hrdata_i O[29] -pin my_cpu hrdata[29]
load net hwrite -pin my_bridge hwrite -pin my_cpu hwrite -pin my_dmem hwrite -pin my_i2c hwrite -pin my_pmu hwrite -pin my_spi hwrite
netloc hwrite 1 2 13 700 690 NJ 690 NJ 690 NJ 690 NJ 690 NJ 690 2890 450 NJ 450 3520 610 NJ 610 NJ 610 4400 520 4830
load net my_uart|prdata_i_n_5 -attr @rip(#000000) O[26] -attr @name prdata_i_n_5 -pin my_uart|prdata_i O[26] -pin my_uart|prdata_i__0 I0[26]
load net prdata[22] -attr @rip prdata[22] -pin my_bridge prdata[22] -pin my_uart prdata[22]
load net my_uart|prdata_i_n_6 -attr @rip(#000000) O[25] -attr @name prdata_i_n_6 -pin my_uart|prdata_i O[25] -pin my_uart|prdata_i__0 I0[25]
load net my_uart|prdata_i_n_7 -attr @rip(#000000) O[24] -attr @name prdata_i_n_7 -pin my_uart|prdata_i O[24] -pin my_uart|prdata_i__0 I0[24]
load net my_uart|tx_data_in[7] -attr @rip(#000000) 7 -attr @name tx_data_in[7] -pin my_uart|my_raw_uart tx_data[7] -pin my_uart|tx_data_in_reg[7:0] Q[7]
load net hrdata0_i_n_30 -attr @rip O[1] -pin hrdata0_i O[1] -pin hrdata_i I1[1]
load net hrdata_i2c[3] -attr @rip hrdata[3] -pin hrdata2_i I0[3] -pin my_i2c hrdata[3]
load net paddr[26] -attr @rip paddr[26] -pin my_bridge paddr[26] -pin my_uart paddr[26]
load net prdata[7] -attr @rip prdata[7] -pin my_bridge prdata[7] -pin my_uart prdata[7]
load net my_uart|prdata_i_n_8 -attr @rip(#000000) O[23] -attr @name prdata_i_n_8 -pin my_uart|prdata_i O[23] -pin my_uart|prdata_i__0 I0[23]
load net my_uart|pwdata[7] -attr @rip(#000000) pwdata[7] -attr @name pwdata[7] -hierPin my_uart pwdata[7] -pin my_uart|tx_data_in_reg[7:0] D[7]
load net hrdata0_i_n_31 -attr @rip O[0] -pin hrdata0_i O[0] -pin hrdata_i I1[0]
load net hrdata_i2c[25] -attr @rip hrdata[25] -pin hrdata2_i I0[25] -pin my_i2c hrdata[25]
load net hwdata[12] -attr @rip hwdata[12] -pin my_bridge hwdata[12] -pin my_cpu hwdata[12] -pin my_dmem hwdata[12] -pin my_i2c hwdata[12] -pin my_pmu hwdata[12] -pin my_spi hwdata[12]
load net my_uart|prdata[1] -attr @rip(#000000) O[1] -attr @name prdata[1] -hierPin my_uart prdata[1] -pin my_uart|prdata_i__0 O[1]
load net my_uart|prdata_i_n_9 -attr @rip(#000000) O[22] -attr @name prdata_i_n_9 -pin my_uart|prdata_i O[22] -pin my_uart|prdata_i__0 I0[22]
load net my_uart|my_raw_uart|rx_data[6] -attr @rip rx_data[6] -attr @name rx_data[6] -hierPin my_uart|my_raw_uart rx_data[6] -pin my_uart|my_raw_uart|rx_inst rx_data[6]
load net hrdata_pmu[8] -attr @rip hrdata[8] -pin hrdata1_i I0[8] -pin my_pmu hrdata[8]
load net hrdata_ram[21] -attr @rip hrdata[21] -pin hrdata2_i I1[21] -pin my_dmem hrdata[21]
load net hrdata_apb[10] -attr @rip hrdata[10] -pin hrdata_i I0[10] -pin my_bridge hrdata[10]
load net hrdata_apb[5] -attr @rip hrdata[5] -pin hrdata_i I0[5] -pin my_bridge hrdata[5]
load net pwdata[15] -attr @rip pwdata[15] -pin my_bridge pwdata[15] -pin my_uart pwdata[15]
load net paddr[11] -attr @rip paddr[11] -pin my_bridge paddr[11] -pin my_uart paddr[11]
load net my_uart|pwdata[1] -attr @rip(#000000) pwdata[1] -attr @name pwdata[1] -hierPin my_uart pwdata[1] -pin my_uart|tx_data_in_reg[7:0] D[1]
load net my_uart|tx_start -attr @name tx_start -pin my_uart|my_raw_uart tx_start -pin my_uart|tx_start_reg Q
netloc my_uart|tx_start 1 4 1 6510
load net psel -pin my_bridge psel -pin my_uart psel
netloc psel 1 3 12 1170 190 NJ 190 NJ 190 NJ 190 NJ 190 NJ 190 NJ 190 NJ 190 NJ 190 NJ 190 NJ 190 5010J
load net pwdata[8] -attr @rip pwdata[8] -pin my_bridge pwdata[8] -pin my_uart pwdata[8]
load net hrdata_spi[10] -attr @rip hrdata[10] -pin hrdata0_i I0[10] -pin my_spi hrdata[10]
load net hready -pin hready_i O -pin my_cpu hready
netloc hready 1 7 1 2500
load net pwdata[0] -attr @rip pwdata[0] -pin my_bridge pwdata[0] -pin my_uart pwdata[0]
load net hrdata_pmu[17] -attr @rip hrdata[17] -pin hrdata1_i I0[17] -pin my_pmu hrdata[17]
load net hrdata_i2c[18] -attr @rip hrdata[18] -pin hrdata2_i I0[18] -pin my_i2c hrdata[18]
load net hrdata_apb[20] -attr @rip hrdata[20] -pin hrdata_i I0[20] -pin my_bridge hrdata[20]
load net hrdata_pmu[14] -attr @rip hrdata[14] -pin hrdata1_i I0[14] -pin my_pmu hrdata[14]
load net hwdata[0] -attr @rip hwdata[0] -pin my_bridge hwdata[0] -pin my_cpu hwdata[0] -pin my_dmem hwdata[0] -pin my_i2c hwdata[0] -pin my_pmu hwdata[0] -pin my_spi hwdata[0]
load net hwdata[15] -attr @rip hwdata[15] -pin my_bridge hwdata[15] -pin my_cpu hwdata[15] -pin my_dmem hwdata[15] -pin my_i2c hwdata[15] -pin my_pmu hwdata[15] -pin my_spi hwdata[15]
load net prdata[12] -attr @rip prdata[12] -pin my_bridge prdata[12] -pin my_uart prdata[12]
load net my_uart|rx_data_out[6] -attr @rip(#000000) rx_data[6] -attr @name rx_data_out[6] -pin my_uart|my_raw_uart rx_data[6] -pin my_uart|prdata_i I0[6]
load net hwdata[28] -attr @rip hwdata[28] -pin my_bridge hwdata[28] -pin my_cpu hwdata[28] -pin my_dmem hwdata[28] -pin my_i2c hwdata[28] -pin my_pmu hwdata[28] -pin my_spi hwdata[28]
load net prdata[19] -attr @rip prdata[19] -pin my_bridge prdata[19] -pin my_uart prdata[19]
load net hrdata_i2c[8] -attr @rip hrdata[8] -pin hrdata2_i I0[8] -pin my_i2c hrdata[8]
load net hrdata_ram[9] -attr @rip hrdata[9] -pin hrdata2_i I1[9] -pin my_dmem hrdata[9]
load net paddr[4] -attr @rip paddr[4] -pin my_bridge paddr[4] -pin my_uart paddr[4]
load net my_uart|my_raw_uart|tx_data[6] -attr @rip tx_data[6] -attr @name tx_data[6] -hierPin my_uart|my_raw_uart tx_data[6] -pin my_uart|my_raw_uart|tx_inst tx_data[6]
load net hrdata_i2c[30] -attr @rip hrdata[30] -pin hrdata2_i I0[30] -pin my_i2c hrdata[30]
load net hready_pmu -pin hready0_i I1 -pin my_pmu hreadyout
netloc hready_pmu 1 5 7 1880 560 2170J 530 2460J 510 NJ 510 NJ 510 NJ 510 3790
load net prdata[21] -attr @rip prdata[21] -pin my_bridge prdata[21] -pin my_uart prdata[21]
load net my_uart|tx_start_i_n_0 -attr @name tx_start_i_n_0 -pin my_uart|tx_start_i O -pin my_uart|tx_start_reg RST
netloc my_uart|tx_start_i_n_0 1 3 1 5910
load net hrdata_pmu[25] -attr @rip hrdata[25] -pin hrdata1_i I0[25] -pin my_pmu hrdata[25]
load net hrdata_ram[14] -attr @rip hrdata[14] -pin hrdata2_i I1[14] -pin my_dmem hrdata[14]
load net hrdata_spi[24] -attr @rip hrdata[24] -pin hrdata0_i I0[24] -pin my_spi hrdata[24]
load net hrdata_i2c[2] -attr @rip hrdata[2] -pin hrdata2_i I0[2] -pin my_i2c hrdata[2]
load net hrdata0_i_n_20 -attr @rip O[11] -pin hrdata0_i O[11] -pin hrdata_i I1[11]
load net prdata[6] -attr @rip prdata[6] -pin my_bridge prdata[6] -pin my_uart prdata[6]
load net my_uart|psel -attr @name psel -hierPin my_uart psel -pin my_uart|prdata1_i I0 -pin my_uart|tx_start2_i I0
netloc my_uart|psel 1 0 8 5210 668 NJ 668 NJ 668 NJ 668 6330J 836 7200J 698 NJ 698 NJ
load net hrdata_i2c[24] -attr @rip hrdata[24] -pin hrdata2_i I0[24] -pin my_i2c hrdata[24]
load net gated_i2c_clk0 -pin gated_i2c_clk0_i O -pin gated_i2c_clk_i I1
netloc gated_i2c_clk0 1 12 1 4040
load net hrdata0_i_n_21 -attr @rip O[10] -pin hrdata0_i O[10] -pin hrdata_i I1[10]
load net <const0> -ground -pin is_apb_i I1[15] -pin is_apb_i I1[13] -pin is_apb_i I1[12] -pin is_apb_i I1[11] -pin is_apb_i I1[10] -pin is_apb_i I1[9] -pin is_apb_i I1[8] -pin is_apb_i I1[7] -pin is_apb_i I1[6] -pin is_apb_i I1[5] -pin is_apb_i I1[4] -pin is_apb_i I1[3] -pin is_apb_i I1[2] -pin is_apb_i I1[1] -pin is_apb_i I1[0] -pin is_i2c_i I1[15] -pin is_i2c_i I1[11] -pin is_i2c_i I1[10] -pin is_i2c_i I1[9] -pin is_i2c_i I1[8] -pin is_i2c_i I1[7] -pin is_i2c_i I1[6] -pin is_i2c_i I1[5] -pin is_i2c_i I1[4] -pin is_i2c_i I1[3] -pin is_i2c_i I1[2] -pin is_i2c_i I1[1] -pin is_i2c_i I1[0] -pin is_pmu_i I1[15] -pin is_pmu_i I1[12] -pin is_pmu_i I1[11] -pin is_pmu_i I1[10] -pin is_pmu_i I1[9] -pin is_pmu_i I1[8] -pin is_pmu_i I1[7] -pin is_pmu_i I1[6] -pin is_pmu_i I1[5] -pin is_pmu_i I1[4] -pin is_pmu_i I1[3] -pin is_pmu_i I1[2] -pin is_pmu_i I1[1] -pin is_pmu_i I1[0] -pin is_ram_i I1[15] -pin is_ram_i I1[14] -pin is_ram_i I1[13] -pin is_ram_i I1[12] -pin is_ram_i I1[11] -pin is_ram_i I1[10] -pin is_ram_i I1[9] -pin is_ram_i I1[8] -pin is_ram_i I1[7] -pin is_ram_i I1[6] -pin is_ram_i I1[5] -pin is_ram_i I1[4] -pin is_ram_i I1[3] -pin is_ram_i I1[2] -pin is_ram_i I1[1] -pin is_ram_i I1[0] -pin is_spi_i I1[15] -pin is_spi_i I1[13] -pin is_spi_i I1[11] -pin is_spi_i I1[10] -pin is_spi_i I1[9] -pin is_spi_i I1[8] -pin is_spi_i I1[7] -pin is_spi_i I1[6] -pin is_spi_i I1[5] -pin is_spi_i I1[4] -pin is_spi_i I1[3] -pin is_spi_i I1[2] -pin is_spi_i I1[1] -pin is_spi_i I1[0]
load net hwdata[11] -attr @rip hwdata[11] -pin my_bridge hwdata[11] -pin my_cpu hwdata[11] -pin my_dmem hwdata[11] -pin my_i2c hwdata[11] -pin my_pmu hwdata[11] -pin my_spi hwdata[11]
load net pwdata[25] -attr @rip pwdata[25] -pin my_bridge pwdata[25] -pin my_uart pwdata[25]
load net my_uart|my_raw_uart|rx_data[5] -attr @rip rx_data[5] -attr @name rx_data[5] -hierPin my_uart|my_raw_uart rx_data[5] -pin my_uart|my_raw_uart|rx_inst rx_data[5]
load net hrdata0_i_n_22 -attr @rip O[9] -pin hrdata0_i O[9] -pin hrdata_i I1[9]
load net hrdata_pmu[2] -attr @rip hrdata[2] -pin hrdata1_i I0[2] -pin my_pmu hrdata[2]
load net paddr[27] -attr @rip paddr[27] -pin my_bridge paddr[27] -pin my_uart paddr[27]
load net my_uart|tx_active -attr @rip(#000000) 0 -attr @name tx_active -pin my_uart|my_raw_uart tx_active -pin my_uart|prdata_i I1[0]
load net hrdata_apb[4] -attr @rip hrdata[4] -pin hrdata_i I0[4] -pin my_bridge hrdata[4]
load net hrdata0_i_n_23 -attr @rip O[8] -pin hrdata0_i O[8] -pin hrdata_i I1[8]
load net hrdata_i2c[12] -attr @rip hrdata[12] -pin hrdata2_i I0[12] -pin my_i2c hrdata[12]
load net hrdata0_i_n_24 -attr @rip O[7] -pin hrdata0_i O[7] -pin hrdata_i I1[7]
load net hrdata_pmu[9] -attr @rip hrdata[9] -pin hrdata1_i I0[9] -pin my_pmu hrdata[9]
load net hrdata0_i_n_25 -attr @rip O[6] -pin hrdata0_i O[6] -pin hrdata_i I1[6]
load net hrdata_apb[11] -attr @rip hrdata[11] -pin hrdata_i I0[11] -pin my_bridge hrdata[11]
load net pwdata[16] -attr @rip pwdata[16] -pin my_bridge pwdata[16] -pin my_uart pwdata[16]
load net my_uart|prdata_i_n_20 -attr @rip(#000000) O[11] -attr @name prdata_i_n_20 -pin my_uart|prdata_i O[11] -pin my_uart|prdata_i__0 I0[11]
load net hrdata2_i_n_0 -attr @rip O[31] -pin hrdata1_i I1[31] -pin hrdata2_i O[31]
load net hrdata0_i_n_26 -attr @rip O[5] -pin hrdata0_i O[5] -pin hrdata_i I1[5]
load net hsel_pmu -pin hsel_pmu_i O -pin my_pmu hsel
netloc hsel_pmu 1 10 1 3420
load net my_uart|prdata[29] -attr @rip(#000000) O[29] -attr @name prdata[29] -hierPin my_uart prdata[29] -pin my_uart|prdata_i__0 O[29]
load net my_uart|prdata_i_n_21 -attr @rip(#000000) O[10] -attr @name prdata_i_n_21 -pin my_uart|prdata_i O[10] -pin my_uart|prdata_i__0 I0[10]
load net my_uart|pwdata[2] -attr @rip(#000000) pwdata[2] -attr @name pwdata[2] -hierPin my_uart pwdata[2] -pin my_uart|tx_data_in_reg[7:0] D[2]
load net hrdata2_i_n_1 -attr @rip O[30] -pin hrdata1_i I1[30] -pin hrdata2_i O[30]
load net hrdata0_i_n_27 -attr @rip O[4] -pin hrdata0_i O[4] -pin hrdata_i I1[4]
load net hrdata_pmu[11] -attr @rip hrdata[11] -pin hrdata1_i I0[11] -pin my_pmu hrdata[11]
load net pwdata[9] -attr @rip pwdata[9] -pin my_bridge pwdata[9] -pin my_uart pwdata[9]
load net my_uart|prdata[6] -attr @rip(#000000) O[6] -attr @name prdata[6] -hierPin my_uart prdata[6] -pin my_uart|prdata_i__0 O[6]
load net my_uart|prdata_i_n_22 -attr @rip(#000000) O[9] -attr @name prdata_i_n_22 -pin my_uart|prdata_i O[9] -pin my_uart|prdata_i__0 I0[9]
load net hrdata[18] -attr @rip O[18] -pin hrdata_i O[18] -pin my_cpu hrdata[18]
load net hrdata2_i_n_2 -attr @rip O[29] -pin hrdata1_i I1[29] -pin hrdata2_i O[29]
load net hrdata_i2c[20] -attr @rip hrdata[20] -pin hrdata2_i I0[20] -pin my_i2c hrdata[20]
load net hrdata0_i_n_28 -attr @rip O[3] -pin hrdata0_i O[3] -pin hrdata_i I1[3]
load net my_uart|prdata[31] -attr @rip(#000000) O[31] -attr @name prdata[31] -hierPin my_uart prdata[31] -pin my_uart|prdata_i__0 O[31]
load net my_uart|prdata_i_n_23 -attr @rip(#000000) O[8] -attr @name prdata_i_n_23 -pin my_uart|prdata_i O[8] -pin my_uart|prdata_i__0 I0[8]
load net hrdata_pmu[18] -attr @rip hrdata[18] -pin hrdata1_i I0[18] -pin my_pmu hrdata[18]
load net hrdata2_i_n_3 -attr @rip O[28] -pin hrdata1_i I1[28] -pin hrdata2_i O[28]
load net hrdata0_i_n_29 -attr @rip O[2] -pin hrdata0_i O[2] -pin hrdata_i I1[2]
load net hwdata[14] -attr @rip hwdata[14] -pin my_bridge hwdata[14] -pin my_cpu hwdata[14] -pin my_dmem hwdata[14] -pin my_i2c hwdata[14] -pin my_pmu hwdata[14] -pin my_spi hwdata[14]
load net is_ram -pin hsel_ram_i I0 -pin is_ram_i O
netloc is_ram 1 1 1 NJ
load net my_uart|prdata_i_n_24 -attr @rip(#000000) O[7] -attr @name prdata_i_n_24 -pin my_uart|prdata_i O[7] -pin my_uart|prdata_i__0 I0[7]
load net hrdata_i2c[19] -attr @rip hrdata[19] -pin hrdata2_i I0[19] -pin my_i2c hrdata[19]
load net hrdata2_i_n_4 -attr @rip O[27] -pin hrdata1_i I1[27] -pin hrdata2_i O[27]
load net prdata[18] -attr @rip prdata[18] -pin my_bridge prdata[18] -pin my_uart prdata[18]
load net pwdata[3] -attr @rip pwdata[3] -pin my_bridge pwdata[3] -pin my_uart pwdata[3]
load net sclk_pin -pin my_spi sclk -port sclk_pin
netloc sclk_pin 1 15 1 8510J
load net my_uart|prdata_i_n_25 -attr @rip(#000000) O[6] -attr @name prdata_i_n_25 -pin my_uart|prdata_i O[6] -pin my_uart|prdata_i__0 I0[6]
load net hrdata2_i_n_5 -attr @rip O[26] -pin hrdata1_i I1[26] -pin hrdata2_i O[26]
load net hrdata[0] -attr @rip O[0] -pin hrdata_i O[0] -pin my_cpu hrdata[0]
load net hrdata_ram[8] -attr @rip hrdata[8] -pin hrdata2_i I1[8] -pin my_dmem hrdata[8]
load net paddr[3] -attr @rip paddr[3] -pin my_bridge paddr[3] -pin my_uart paddr[3]
load net prdata[13] -attr @rip prdata[13] -pin my_bridge prdata[13] -pin my_uart prdata[13]
load net my_uart|prdata_i_n_26 -attr @rip(#000000) O[5] -attr @name prdata_i_n_26 -pin my_uart|prdata_i O[5] -pin my_uart|prdata_i__0 I0[5]
load net my_uart|my_raw_uart|tx_data[5] -attr @rip tx_data[5] -attr @name tx_data[5] -hierPin my_uart|my_raw_uart tx_data[5] -pin my_uart|my_raw_uart|tx_inst tx_data[5]
load net hrdata[22] -attr @rip O[22] -pin hrdata_i O[22] -pin my_cpu hrdata[22]
load net clk -port clk -pin gated_i2c_clk_i I0 -pin gated_spi_clk_i I0 -pin gated_uart_clk_i I0 -pin my_bridge hclk -pin my_cpu hclk -pin my_dmem hclk -pin my_i2c sys_clk -pin my_pmu hclk
netloc clk 1 0 14 NJ 220 NJ 220 600 400 1230J 370 NJ 370 NJ 370 NJ 370 2540 370 NJ 370 NJ 370 3400 130 NJ 130 4060 130 4380
load net hrdata2_i_n_6 -attr @rip O[25] -pin hrdata1_i I1[25] -pin hrdata2_i O[25]
load net hwdata[29] -attr @rip hwdata[29] -pin my_bridge hwdata[29] -pin my_cpu hwdata[29] -pin my_dmem hwdata[29] -pin my_i2c hwdata[29] -pin my_pmu hwdata[29] -pin my_spi hwdata[29]
load net pwdata[30] -attr @rip pwdata[30] -pin my_bridge pwdata[30] -pin my_uart pwdata[30]
load net my_uart|prdata_i_n_27 -attr @rip(#000000) O[4] -attr @name prdata_i_n_27 -pin my_uart|prdata_i O[4] -pin my_uart|prdata_i__0 I0[4]
load net hrdata2_i_n_7 -attr @rip O[24] -pin hrdata1_i I1[24] -pin hrdata2_i O[24]
load net hrdata_i2c[9] -attr @rip hrdata[9] -pin hrdata2_i I0[9] -pin my_i2c hrdata[9]
load net hwdata[3] -attr @rip hwdata[3] -pin my_bridge hwdata[3] -pin my_cpu hwdata[3] -pin my_dmem hwdata[3] -pin my_i2c hwdata[3] -pin my_pmu hwdata[3] -pin my_spi hwdata[3]
load net my_uart|prdata_i_n_28 -attr @rip(#000000) O[3] -attr @name prdata_i_n_28 -pin my_uart|prdata_i O[3] -pin my_uart|prdata_i__0 I0[3]
load net hrdata2_i_n_8 -attr @rip O[23] -pin hrdata1_i I1[23] -pin hrdata2_i O[23]
load net hrdata_pmu[24] -attr @rip hrdata[24] -pin hrdata1_i I0[24] -pin my_pmu hrdata[24]
load net hrdata_ram[13] -attr @rip hrdata[13] -pin hrdata2_i I1[13] -pin my_dmem hrdata[13]
load net htrans[1] -attr @rip htrans[1] -pin htrans_i S[1] -pin my_bridge htrans[1] -pin my_cpu htrans[1] -pin my_dmem htrans[1] -pin my_i2c htrans[1] -pin my_pmu htrans[1] -pin my_spi htrans[1]
load net p_0_in[10] -attr @rip haddr[26] -pin is_apb_i I0[10] -pin is_i2c_i I0[10] -pin is_pmu_i I0[10] -pin is_ram_i I0[10] -pin is_spi_i I0[10] -pin my_bridge haddr[26] -pin my_cpu haddr[26] -pin my_dmem haddr[26] -pin my_i2c haddr[26] -pin my_pmu haddr[26] -pin my_spi haddr[26]
load net my_uart|prdata_i_n_29 -attr @rip(#000000) O[2] -attr @name prdata_i_n_29 -pin my_uart|prdata_i O[2] -pin my_uart|prdata_i__0 I0[2]
load net my_uart|tx_data_in[5] -attr @rip(#000000) 5 -attr @name tx_data_in[5] -pin my_uart|my_raw_uart tx_data[5] -pin my_uart|tx_data_in_reg[7:0] Q[5]
load net hrdata2_i_n_9 -attr @rip O[22] -pin hrdata1_i I1[22] -pin hrdata2_i O[22]
load net hrdata0_i_n_10 -attr @rip O[21] -pin hrdata0_i O[21] -pin hrdata_i I1[21]
load net paddr[24] -attr @rip paddr[24] -pin my_bridge paddr[24] -pin my_uart paddr[24]
load net prdata[5] -attr @rip prdata[5] -pin my_bridge prdata[5] -pin my_uart prdata[5]
load net hrdata_i2c[23] -attr @rip hrdata[23] -pin hrdata2_i I0[23] -pin my_i2c hrdata[23]
load net hrdata0_i_n_11 -attr @rip O[20] -pin hrdata0_i O[20] -pin hrdata_i I1[20]
load net hrdata_spi[25] -attr @rip hrdata[25] -pin hrdata0_i I0[25] -pin my_spi hrdata[25]
load net hwdata[10] -attr @rip hwdata[10] -pin my_bridge hwdata[10] -pin my_cpu hwdata[10] -pin my_dmem hwdata[10] -pin my_i2c hwdata[10] -pin my_pmu hwdata[10] -pin my_spi hwdata[10]
load net pwdata[24] -attr @rip pwdata[24] -pin my_bridge pwdata[24] -pin my_uart pwdata[24]
load net rx_pin -pin my_uart rx_pin -port rx_pin
netloc rx_pin 1 0 15 NJ 140 NJ 140 NJ 140 1110J 250 NJ 250 NJ 250 NJ 250 NJ 250 NJ 250 NJ 250 NJ 250 NJ 250 NJ 250 NJ 250 4930J
load net my_uart|my_raw_uart|rx_data[4] -attr @rip rx_data[4] -attr @name rx_data[4] -hierPin my_uart|my_raw_uart rx_data[4] -pin my_uart|my_raw_uart|rx_inst rx_data[4]
load net hrdata0_i_n_12 -attr @rip O[19] -pin hrdata0_i O[19] -pin hrdata_i I1[19]
load net hrdata_spi[30] -attr @rip hrdata[30] -pin hrdata0_i I0[30] -pin my_spi hrdata[30]
load net <const1> -power -pin htrans_i I0[0] -pin is_apb_i I1[14] -pin is_i2c_i I1[14] -pin is_i2c_i I1[13] -pin is_i2c_i I1[12] -pin is_pmu_i I1[14] -pin is_pmu_i I1[13] -pin is_spi_i I1[14] -pin is_spi_i I1[12]
load net hrdata_apb[3] -attr @rip hrdata[3] -pin hrdata_i I0[3] -pin my_bridge hrdata[3]
load net hrdata0_i_n_13 -attr @rip O[18] -pin hrdata0_i O[18] -pin hrdata_i I1[18]
load net hrdata_i2c[11] -attr @rip hrdata[11] -pin hrdata2_i I0[11] -pin my_i2c hrdata[11]
load net pwdata[12] -attr @rip pwdata[12] -pin my_bridge pwdata[12] -pin my_uart pwdata[12]
load net my_uart|tx_start0 -attr @name tx_start0 -pin my_uart|tx_data_in_reg[7:0] CE -pin my_uart|tx_start0_i O -pin my_uart|tx_start_reg D
netloc my_uart|tx_start0 1 3 1 5910
load net hrdata0_i_n_14 -attr @rip O[17] -pin hrdata0_i O[17] -pin hrdata_i I1[17]
load net hrdata_pmu[3] -attr @rip hrdata[3] -pin hrdata1_i I0[3] -pin my_pmu hrdata[3]
load net my_uart|tx_start1 -attr @name tx_start1 -pin my_uart|tx_start0_i I0 -pin my_uart|tx_start1_i O
netloc my_uart|tx_start1 1 2 1 5650
load net my_uart|my_raw_uart|tx_pin -attr @name tx_pin -hierPin my_uart|my_raw_uart tx_pin -pin my_uart|my_raw_uart|tx_inst tx
netloc my_uart|my_raw_uart|tx_pin 1 1 1 6920
load net hrdata0_i_n_15 -attr @rip O[16] -pin hrdata0_i O[16] -pin hrdata_i I1[16]
load net my_uart|prdata_i_n_10 -attr @rip(#000000) O[21] -attr @name prdata_i_n_10 -pin my_uart|prdata_i O[21] -pin my_uart|prdata_i__0 I0[21]
load net hrdata0_i_n_16 -attr @rip O[15] -pin hrdata0_i O[15] -pin hrdata_i I1[15]
load net p_0_in[4] -attr @rip haddr[20] -pin is_apb_i I0[4] -pin is_i2c_i I0[4] -pin is_pmu_i I0[4] -pin is_ram_i I0[4] -pin is_spi_i I0[4] -pin my_bridge haddr[20] -pin my_cpu haddr[20] -pin my_dmem haddr[20] -pin my_i2c haddr[20] -pin my_pmu haddr[20] -pin my_spi haddr[20]
load net my_uart|prdata[28] -attr @rip(#000000) O[28] -attr @name prdata[28] -hierPin my_uart prdata[28] -pin my_uart|prdata_i__0 O[28]
load net my_uart|prdata_i_n_11 -attr @rip(#000000) O[20] -attr @name prdata_i_n_11 -pin my_uart|prdata_i O[20] -pin my_uart|prdata_i__0 I0[20]
load net hrdata_apb[12] -attr @rip hrdata[12] -pin hrdata_i I0[12] -pin my_bridge hrdata[12]
load net hrdata0_i_n_17 -attr @rip O[14] -pin hrdata0_i O[14] -pin hrdata_i I1[14]
load net pwdata[17] -attr @rip pwdata[17] -pin my_bridge pwdata[17] -pin my_uart pwdata[17]
load net my_uart|prdata_i_n_12 -attr @rip(#000000) O[19] -attr @name prdata_i_n_12 -pin my_uart|prdata_i O[19] -pin my_uart|prdata_i__0 I0[19]
load net hrdata0_i_n_18 -attr @rip O[13] -pin hrdata0_i O[13] -pin hrdata_i I1[13]
load net hrdata[12] -attr @rip O[12] -pin hrdata_i O[12] -pin my_cpu hrdata[12]
load net my_uart|prdata_i_n_13 -attr @rip(#000000) O[18] -attr @name prdata_i_n_13 -pin my_uart|prdata_i O[18] -pin my_uart|prdata_i__0 I0[18]
load net my_uart|pwdata[3] -attr @rip(#000000) pwdata[3] -attr @name pwdata[3] -hierPin my_uart pwdata[3] -pin my_uart|tx_data_in_reg[7:0] D[3]
load net my_uart|my_raw_uart|clk -attr @name clk -hierPin my_uart|my_raw_uart clk -pin my_uart|my_raw_uart|rx_inst clk -pin my_uart|my_raw_uart|tx_inst clk
netloc my_uart|my_raw_uart|clk 1 0 1 6660
load net hrdata0_i_n_19 -attr @rip O[12] -pin hrdata0_i O[12] -pin hrdata_i I1[12]
load net hrdata_pmu[12] -attr @rip hrdata[12] -pin hrdata1_i I0[12] -pin my_pmu hrdata[12]
load net gated_i2c_clk -pin gated_i2c_clk_i O -pin my_i2c hclk
netloc gated_i2c_clk 1 13 1 4420
load net hwdata[13] -attr @rip hwdata[13] -pin my_bridge hwdata[13] -pin my_cpu hwdata[13] -pin my_dmem hwdata[13] -pin my_i2c hwdata[13] -pin my_pmu hwdata[13] -pin my_spi hwdata[13]
load net prdata[10] -attr @rip prdata[10] -pin my_bridge prdata[10] -pin my_uart prdata[10]
load net my_uart|prdata[7] -attr @rip(#000000) O[7] -attr @name prdata[7] -hierPin my_uart prdata[7] -pin my_uart|prdata_i__0 O[7]
load net my_uart|prdata_i_n_14 -attr @rip(#000000) O[17] -attr @name prdata_i_n_14 -pin my_uart|prdata_i O[17] -pin my_uart|prdata_i__0 I0[17]
load net hrdata[19] -attr @rip O[19] -pin hrdata_i O[19] -pin my_cpu hrdata[19]
load net hrdata[9] -attr @rip O[9] -pin hrdata_i O[9] -pin my_cpu hrdata[9]
load net hrdata_i2c[21] -attr @rip hrdata[21] -pin hrdata2_i I0[21] -pin my_i2c hrdata[21]
load net hrdata_ram[0] -attr @rip hrdata[0] -pin hrdata2_i I1[0] -pin my_dmem hrdata[0]
load net hwdata[26] -attr @rip hwdata[26] -pin my_bridge hwdata[26] -pin my_cpu hwdata[26] -pin my_dmem hwdata[26] -pin my_i2c hwdata[26] -pin my_pmu hwdata[26] -pin my_spi hwdata[26]
load net pwdata[2] -attr @rip pwdata[2] -pin my_bridge pwdata[2] -pin my_uart pwdata[2]
load net my_uart|prdata_i_n_15 -attr @rip(#000000) O[16] -attr @name prdata_i_n_15 -pin my_uart|prdata_i O[16] -pin my_uart|prdata_i__0 I0[16]
load net hrdata_ram[7] -attr @rip hrdata[7] -pin hrdata2_i I1[7] -pin my_dmem hrdata[7]
load net paddr[2] -attr @rip paddr[2] -pin my_bridge paddr[2] -pin my_uart paddr[2]
load net my_uart|prdata_i_n_16 -attr @rip(#000000) O[15] -attr @name prdata_i_n_16 -pin my_uart|prdata_i O[15] -pin my_uart|prdata_i__0 I0[15]
load net my_uart|my_raw_uart|tx_active -attr @name tx_active -hierPin my_uart|my_raw_uart tx_active -pin my_uart|my_raw_uart|tx_inst tx_active
netloc my_uart|my_raw_uart|tx_active 1 1 1 N
load net my_uart|my_raw_uart|tx_data[4] -attr @rip tx_data[4] -attr @name tx_data[4] -hierPin my_uart|my_raw_uart tx_data[4] -pin my_uart|my_raw_uart|tx_inst tx_data[4]
load net hrdata[21] -attr @rip O[21] -pin hrdata_i O[21] -pin my_cpu hrdata[21]
load net hrdata1_i_n_0 -attr @rip O[31] -pin hrdata0_i I1[31] -pin hrdata1_i O[31]
load net hrdata_spi[19] -attr @rip hrdata[19] -pin hrdata0_i I0[19] -pin my_spi hrdata[19]
load net my_uart|prdata_i_n_17 -attr @rip(#000000) O[14] -attr @name prdata_i_n_17 -pin my_uart|prdata_i O[14] -pin my_uart|prdata_i__0 I0[14]
load net my_uart|tx_start1_i__0_n_0 -attr @name tx_start1_i__0_n_0 -pin my_uart|tx_start0_i I1 -pin my_uart|tx_start1_i__0 O
netloc my_uart|tx_start1_i__0_n_0 1 2 1 NJ
load net hrdata1_i_n_1 -attr @rip O[30] -pin hrdata0_i I1[30] -pin hrdata1_i O[30]
load net hwdata[2] -attr @rip hwdata[2] -pin my_bridge hwdata[2] -pin my_cpu hwdata[2] -pin my_dmem hwdata[2] -pin my_i2c hwdata[2] -pin my_pmu hwdata[2] -pin my_spi hwdata[2]
load net p_1_in -pin hsel_apb_i I1 -pin hsel_i2c_i I1 -pin hsel_pmu_i I1 -pin hsel_ram_i I1 -pin hsel_spi_i I1 -pin htrans_i O
netloc p_1_in 1 1 13 400 1030 NJ 1030 NJ 1030 NJ 1030 1840J 1020 NJ 1020 NJ 1020 NJ 1020 3220 1080 NJ 1080 NJ 1080 4080 860 NJ
load net my_uart|prdata_i_n_18 -attr @rip(#000000) O[13] -attr @name prdata_i_n_18 -pin my_uart|prdata_i O[13] -pin my_uart|prdata_i__0 I0[13]
load net hrdata1_i_n_2 -attr @rip O[29] -pin hrdata0_i I1[29] -pin hrdata1_i O[29]
load net hrdata_pmu[23] -attr @rip hrdata[23] -pin hrdata1_i I0[23] -pin my_pmu hrdata[23]
load net my_uart|prdata_i_n_19 -attr @rip(#000000) O[12] -attr @name prdata_i_n_19 -pin my_uart|prdata_i O[12] -pin my_uart|prdata_i__0 I0[12]
load net hrdata1_i_n_3 -attr @rip O[28] -pin hrdata0_i I1[28] -pin hrdata1_i O[28]
load net hrdata1_i_n_4 -attr @rip O[27] -pin hrdata0_i I1[27] -pin hrdata1_i O[27]
load net hrdata_i2c[22] -attr @rip hrdata[22] -pin hrdata2_i I0[22] -pin my_i2c hrdata[22]
load net p_0_in[11] -attr @rip haddr[27] -pin is_apb_i I0[11] -pin is_i2c_i I0[11] -pin is_pmu_i I0[11] -pin is_ram_i I0[11] -pin is_spi_i I0[11] -pin my_bridge haddr[27] -pin my_cpu haddr[27] -pin my_dmem haddr[27] -pin my_i2c haddr[27] -pin my_pmu haddr[27] -pin my_spi haddr[27]
load net pwdata[23] -attr @rip pwdata[23] -pin my_bridge pwdata[23] -pin my_uart pwdata[23]
load net my_uart|tx_data_in[6] -attr @rip(#000000) 6 -attr @name tx_data_in[6] -pin my_uart|my_raw_uart tx_data[6] -pin my_uart|tx_data_in_reg[7:0] Q[6]
load net my_uart|my_raw_uart|rx_data[3] -attr @rip rx_data[3] -attr @name rx_data[3] -hierPin my_uart|my_raw_uart rx_data[3] -pin my_uart|my_raw_uart|rx_inst rx_data[3]
load net hrdata_pmu[0] -attr @rip hrdata[0] -pin hrdata1_i I0[0] -pin my_pmu hrdata[0]
load net hrdata1_i_n_5 -attr @rip O[26] -pin hrdata0_i I1[26] -pin hrdata1_i O[26]
load net paddr[25] -attr @rip paddr[25] -pin my_bridge paddr[25] -pin my_uart paddr[25]
load net my_uart|prdata_i_n_30 -attr @rip(#000000) O[1] -attr @name prdata_i_n_30 -pin my_uart|prdata_i O[1] -pin my_uart|prdata_i__0 I0[1]
load net hrdata_apb[2] -attr @rip hrdata[2] -pin hrdata_i I0[2] -pin my_bridge hrdata[2]
load net hrdata_i2c[10] -attr @rip hrdata[10] -pin hrdata2_i I0[10] -pin my_i2c hrdata[10]
load net hrdata1_i_n_6 -attr @rip O[25] -pin hrdata0_i I1[25] -pin hrdata1_i O[25]
load net hrdata_ram[16] -attr @rip hrdata[16] -pin hrdata2_i I1[16] -pin my_dmem hrdata[16]
load net hrdata_spi[26] -attr @rip hrdata[26] -pin hrdata0_i I0[26] -pin my_spi hrdata[26]
load net hrdata_spi[2] -attr @rip hrdata[2] -pin hrdata0_i I0[2] -pin my_spi hrdata[2]
load net pwdata[11] -attr @rip pwdata[11] -pin my_bridge pwdata[11] -pin my_uart pwdata[11]
load net my_uart|prdata_i_n_31 -attr @rip(#000000) O[0] -attr @name prdata_i_n_31 -pin my_uart|prdata_i O[0] -pin my_uart|prdata_i__0 I0[0]
load net hrdata1_i_n_7 -attr @rip O[24] -pin hrdata0_i I1[24] -pin hrdata1_i O[24]
load net hrdata_spi[31] -attr @rip hrdata[31] -pin hrdata0_i I0[31] -pin my_spi hrdata[31]
load net hrdata1_i_n_8 -attr @rip O[23] -pin hrdata0_i I1[23] -pin hrdata1_i O[23]
load net hrdata1_i_n_9 -attr @rip O[22] -pin hrdata0_i I1[22] -pin hrdata1_i O[22]
load net reset -pin gated_i2c_clk0_i I1 -pin gated_spi_clk0_i I1 -pin gated_uart_clk0_i I1 -pin hresetn0_i I0 -port reset
netloc reset 1 0 13 NJ 110 400 110 NJ 110 NJ 110 NJ 110 NJ 110 NJ 110 NJ 110 NJ 110 NJ 110 NJ 110 3850 110 4080
load net my_uart|prdata[27] -attr @rip(#000000) O[27] -attr @name prdata[27] -hierPin my_uart prdata[27] -pin my_uart|prdata_i__0 O[27]
load net hrdata_apb[30] -attr @rip hrdata[30] -pin hrdata_i I0[30] -pin my_bridge hrdata[30]
load net my_uart|prdata[4] -attr @rip(#000000) O[4] -attr @name prdata[4] -hierPin my_uart prdata[4] -pin my_uart|prdata_i__0 O[4]
load net p_0_in[5] -attr @rip haddr[21] -pin is_apb_i I0[5] -pin is_i2c_i I0[5] -pin is_pmu_i I0[5] -pin is_ram_i I0[5] -pin is_spi_i I0[5] -pin my_bridge haddr[21] -pin my_cpu haddr[21] -pin my_dmem haddr[21] -pin my_i2c haddr[21] -pin my_pmu haddr[21] -pin my_spi haddr[21]
load net hrdata_apb[13] -attr @rip hrdata[13] -pin hrdata_i I0[13] -pin my_bridge hrdata[13]
load net hrdata_apb[29] -attr @rip hrdata[29] -pin hrdata_i I0[29] -pin my_bridge hrdata[29]
load net prdata[29] -attr @rip prdata[29] -pin my_bridge prdata[29] -pin my_uart prdata[29]
load net pwdata[18] -attr @rip pwdata[18] -pin my_bridge pwdata[18] -pin my_uart pwdata[18]
load net hrdata[8] -attr @rip O[8] -pin hrdata_i O[8] -pin my_cpu hrdata[8]
load net hrdata[13] -attr @rip O[13] -pin hrdata_i O[13] -pin my_cpu hrdata[13]
load net hwdata[9] -attr @rip hwdata[9] -pin my_bridge hwdata[9] -pin my_cpu hwdata[9] -pin my_dmem hwdata[9] -pin my_i2c hwdata[9] -pin my_pmu hwdata[9] -pin my_spi hwdata[9]
load net my_uart|pwdata[4] -attr @rip(#000000) pwdata[4] -attr @name pwdata[4] -hierPin my_uart pwdata[4] -pin my_uart|tx_data_in_reg[7:0] D[4]
load net my_uart|rx_data_ready0 -attr @name rx_data_ready0 -pin my_uart|rx_data_ready0_i O -pin my_uart|rx_data_ready_i I1
netloc my_uart|rx_data_ready0 1 5 1 7180
load net hrdata_ram[6] -attr @rip hrdata[6] -pin hrdata2_i I1[6] -pin my_dmem hrdata[6]
load net prdata[11] -attr @rip prdata[11] -pin my_bridge prdata[11] -pin my_uart prdata[11]
load net my_uart|prdata[15] -attr @rip(#000000) O[15] -attr @name prdata[15] -hierPin my_uart prdata[15] -pin my_uart|prdata_i__0 O[15]
load net my_uart|rx_data_ready1 -attr @name rx_data_ready1 -pin my_uart|rx_data_ready0_i I0 -pin my_uart|rx_data_ready1_i O
netloc my_uart|rx_data_ready1 1 4 1 6350
load net my_uart|rx_data_ready2_i_n_0 -attr @name rx_data_ready2_i_n_0 -pin my_uart|prdata1_i I1 -pin my_uart|rx_data_ready1_i I1 -pin my_uart|rx_data_ready2_i O
netloc my_uart|rx_data_ready2_i_n_0 1 3 5 5950 768 6310J 936 7220J 768 NJ 768 7700J
load net my_uart|my_raw_uart|tx_data[3] -attr @rip tx_data[3] -attr @name tx_data[3] -hierPin my_uart|my_raw_uart tx_data[3] -pin my_uart|my_raw_uart|tx_inst tx_data[3]
load net hrdata_ram[1] -attr @rip hrdata[1] -pin hrdata2_i I1[1] -pin my_dmem hrdata[1]
load net hrdata_spi[13] -attr @rip hrdata[13] -pin hrdata0_i I0[13] -pin my_spi hrdata[13]
load net hwdata[27] -attr @rip hwdata[27] -pin my_bridge hwdata[27] -pin my_cpu hwdata[27] -pin my_dmem hwdata[27] -pin my_i2c hwdata[27] -pin my_pmu hwdata[27] -pin my_spi hwdata[27]
load net hwdata[30] -attr @rip hwdata[30] -pin my_bridge hwdata[30] -pin my_cpu hwdata[30] -pin my_dmem hwdata[30] -pin my_i2c hwdata[30] -pin my_pmu hwdata[30] -pin my_spi hwdata[30]
load net my_uart|paddr[4] -attr @rip(#000000) paddr[4] -attr @name paddr[4] -hierPin my_uart paddr[4] -pin my_uart|prdata_i S[4] -pin my_uart|rx_data_ready1_i__0 I0[4] -pin my_uart|tx_start1_i__0 I0[4]
load net hrdata_pmu[22] -attr @rip hrdata[22] -pin hrdata1_i I0[22] -pin my_pmu hrdata[22]
load net hrdata_ram[30] -attr @rip hrdata[30] -pin hrdata2_i I1[30] -pin my_dmem hrdata[30]
load net paddr[22] -attr @rip paddr[22] -pin my_bridge paddr[22] -pin my_uart paddr[22]
load net hrdata[24] -attr @rip O[24] -pin hrdata_i O[24] -pin my_cpu hrdata[24]
load net pwdata[22] -attr @rip pwdata[22] -pin my_bridge pwdata[22] -pin my_uart pwdata[22]
load net my_uart|tx_data_in[0] -attr @rip(#000000) 0 -attr @name tx_data_in[0] -pin my_uart|my_raw_uart tx_data[0] -pin my_uart|tx_data_in_reg[7:0] Q[0]
load net my_uart|my_raw_uart|rx_data[2] -attr @rip rx_data[2] -attr @name rx_data[2] -hierPin my_uart|my_raw_uart rx_data[2] -pin my_uart|my_raw_uart|rx_inst rx_data[2]
load net hrdata_apb[1] -attr @rip hrdata[1] -pin hrdata_i I0[1] -pin my_bridge hrdata[1]
load net hrdata_ram[15] -attr @rip hrdata[15] -pin hrdata2_i I1[15] -pin my_dmem hrdata[15]
load net p_0_in[12] -attr @rip haddr[28] -pin is_apb_i I0[12] -pin is_i2c_i I0[12] -pin is_pmu_i I0[12] -pin is_ram_i I0[12] -pin is_spi_i I0[12] -pin my_bridge haddr[28] -pin my_cpu haddr[28] -pin my_dmem haddr[28] -pin my_i2c haddr[28] -pin my_pmu haddr[28] -pin my_spi haddr[28]
load net pwdata[10] -attr @rip pwdata[10] -pin my_bridge pwdata[10] -pin my_uart pwdata[10]
load net my_uart|prdata[11] -attr @rip(#000000) O[11] -attr @name prdata[11] -hierPin my_uart prdata[11] -pin my_uart|prdata_i__0 O[11]
load net hrdata_pmu[1] -attr @rip hrdata[1] -pin hrdata1_i I0[1] -pin my_pmu hrdata[1]
load net hresetn0 -pin hresetn0_i O -pin my_bridge hresetn -pin my_cpu hresetn -pin my_i2c hresetn -pin my_pmu hresetn -pin my_spi hresetn -pin my_uart presetn
netloc hresetn0 1 2 13 580 160 1070J 270 NJ 270 NJ 270 NJ 270 2520 390 NJ 390 NJ 390 3460 550 NJ 550 NJ 550 4440 480 4950
load net paddr[9] -attr @rip paddr[9] -pin my_bridge paddr[9] -pin my_uart paddr[9]
load net hrdata_spi[27] -attr @rip hrdata[27] -pin hrdata0_i I0[27] -pin my_spi hrdata[27]
load net hrdata_spi[3] -attr @rip hrdata[3] -pin hrdata0_i I0[3] -pin my_spi hrdata[3]
load net my_uart|prdata[21] -attr @rip(#000000) O[21] -attr @name prdata[21] -hierPin my_uart prdata[21] -pin my_uart|prdata_i__0 O[21]
load net my_uart|prdata[26] -attr @rip(#000000) O[26] -attr @name prdata[26] -hierPin my_uart prdata[26] -pin my_uart|prdata_i__0 O[26]
load net hrdata[10] -attr @rip O[10] -pin hrdata_i O[10] -pin my_cpu hrdata[10]
load net hrdata_apb[28] -attr @rip hrdata[28] -pin hrdata_i I0[28] -pin my_bridge hrdata[28]
load net hrdata_i2c[29] -attr @rip hrdata[29] -pin hrdata2_i I0[29] -pin my_i2c hrdata[29]
load net hrdata_apb[31] -attr @rip hrdata[31] -pin hrdata_i I0[31] -pin my_bridge hrdata[31]
load net hrdata_pmu[10] -attr @rip hrdata[10] -pin hrdata1_i I0[10] -pin my_pmu hrdata[10]
load net pwdata[20] -attr @rip pwdata[20] -pin my_bridge pwdata[20] -pin my_uart pwdata[20]
load net my_uart|prdata[5] -attr @rip(#000000) O[5] -attr @name prdata[5] -hierPin my_uart prdata[5] -pin my_uart|prdata_i__0 O[5]
load net my_uart|uart_reset -attr @name uart_reset -pin my_uart|my_raw_uart reset -pin my_uart|uart_reset_i O
netloc my_uart|uart_reset 1 4 1 6430J
load net hrdata[7] -attr @rip O[7] -pin hrdata_i O[7] -pin my_cpu hrdata[7]
load net hwdata[24] -attr @rip hwdata[24] -pin my_bridge hwdata[24] -pin my_cpu hwdata[24] -pin my_dmem hwdata[24] -pin my_i2c hwdata[24] -pin my_pmu hwdata[24] -pin my_spi hwdata[24]
load net hwdata[8] -attr @rip hwdata[8] -pin my_bridge hwdata[8] -pin my_cpu hwdata[8] -pin my_dmem hwdata[8] -pin my_i2c hwdata[8] -pin my_pmu hwdata[8] -pin my_spi hwdata[8]
load net p_0_in[6] -attr @rip haddr[22] -pin is_apb_i I0[6] -pin is_i2c_i I0[6] -pin is_pmu_i I0[6] -pin is_ram_i I0[6] -pin is_spi_i I0[6] -pin my_bridge haddr[22] -pin my_cpu haddr[22] -pin my_dmem haddr[22] -pin my_i2c haddr[22] -pin my_pmu haddr[22] -pin my_spi haddr[22]
load net hrdata_apb[14] -attr @rip hrdata[14] -pin hrdata_i I0[14] -pin my_bridge hrdata[14]
load net pwdata[19] -attr @rip pwdata[19] -pin my_bridge pwdata[19] -pin my_uart pwdata[19]
load net my_uart|my_raw_uart|tx_data[2] -attr @rip tx_data[2] -attr @name tx_data[2] -hierPin my_uart|my_raw_uart tx_data[2] -pin my_uart|my_raw_uart|tx_inst tx_data[2]
load net prdata[30] -attr @rip prdata[30] -pin my_bridge prdata[30] -pin my_uart prdata[30]
load net my_uart|paddr[3] -attr @rip(#000000) paddr[3] -attr @name paddr[3] -hierPin my_uart paddr[3] -pin my_uart|prdata_i S[3] -pin my_uart|rx_data_ready1_i__0 I0[3] -pin my_uart|tx_start1_i__0 I0[3]
load net my_uart|pwdata[5] -attr @rip(#000000) pwdata[5] -attr @name pwdata[5] -hierPin my_uart pwdata[5] -pin my_uart|tx_data_in_reg[7:0] D[5]
load net my_uart|prdata[16] -attr @rip(#000000) O[16] -attr @name prdata[16] -hierPin my_uart prdata[16] -pin my_uart|prdata_i__0 O[16]
load net my_uart|rx_data_out[1] -attr @rip(#000000) rx_data[1] -attr @name rx_data_out[1] -pin my_uart|my_raw_uart rx_data[1] -pin my_uart|prdata_i I0[1]
load net hrdata_spi[14] -attr @rip hrdata[14] -pin hrdata0_i I0[14] -pin my_spi hrdata[14]
load net my_uart|rx_data_ready_i_n_0 -attr @name rx_data_ready_i_n_0 -pin my_uart|rx_data_ready_i O -pin my_uart|rx_data_ready_reg CE
netloc my_uart|rx_data_ready_i_n_0 1 6 1 7440
load net hrdata[23] -attr @rip O[23] -pin hrdata_i O[23] -pin my_cpu hrdata[23]
load net hrdata_ram[26] -attr @rip hrdata[26] -pin hrdata2_i I1[26] -pin my_dmem hrdata[26]
load net i2c_clk_en -pin gated_i2c_clk0_i I0 -pin my_pmu i2c_clk_en
netloc i2c_clk_en 1 11 1 3830
load net my_uart|my_raw_uart|rx_data[1] -attr @rip rx_data[1] -attr @name rx_data[1] -hierPin my_uart|my_raw_uart rx_data[1] -pin my_uart|my_raw_uart|rx_inst rx_data[1]
load net hwdata[19] -attr @rip hwdata[19] -pin my_bridge hwdata[19] -pin my_cpu hwdata[19] -pin my_dmem hwdata[19] -pin my_i2c hwdata[19] -pin my_pmu hwdata[19] -pin my_spi hwdata[19]
load net is_apb -pin hrdata_i S -pin hsel_apb_i I0 -pin is_apb_i O
netloc is_apb 1 1 6 380 670 NJ 670 NJ 670 NJ 670 NJ 670 NJ
load net miso_pin -port miso_pin -pin my_spi miso
netloc miso_pin 1 0 15 NJ 1180 NJ 1180 NJ 1180 NJ 1180 NJ 1180 NJ 1180 NJ 1180 NJ 1180 NJ 1180 3240J 1060 NJ 1060 NJ 1060 NJ 1060 NJ 1060 4730J
load net paddr[23] -attr @rip paddr[23] -pin my_bridge paddr[23] -pin my_uart paddr[23]
load net hrdata_apb[0] -attr @rip hrdata[0] -pin hrdata_i I0[0] -pin my_bridge hrdata[0]
load net hrdata_spi[7] -attr @rip hrdata[7] -pin hrdata0_i I0[7] -pin my_spi hrdata[7]
load net mosi_pin -port mosi_pin -pin my_spi mosi
netloc mosi_pin 1 15 1 8490J
load net paddr[8] -attr @rip paddr[8] -pin my_bridge paddr[8] -pin my_uart paddr[8]
load net p_0_in[13] -attr @rip haddr[29] -pin is_apb_i I0[13] -pin is_i2c_i I0[13] -pin is_pmu_i I0[13] -pin is_ram_i I0[13] -pin is_spi_i I0[13] -pin my_bridge haddr[29] -pin my_cpu haddr[29] -pin my_dmem haddr[29] -pin my_i2c haddr[29] -pin my_pmu haddr[29] -pin my_spi haddr[29]
load net paddr[18] -attr @rip paddr[18] -pin my_bridge paddr[18] -pin my_uart paddr[18]
load net my_uart|prdata[12] -attr @rip(#000000) O[12] -attr @name prdata[12] -hierPin my_uart prdata[12] -pin my_uart|prdata_i__0 O[12]
load net my_uart|prdata[20] -attr @rip(#000000) O[20] -attr @name prdata[20] -hierPin my_uart prdata[20] -pin my_uart|prdata_i__0 O[20]
load net my_uart|prdata[25] -attr @rip(#000000) O[25] -attr @name prdata[25] -hierPin my_uart prdata[25] -pin my_uart|prdata_i__0 O[25]
load net my_uart|prdata[30] -attr @rip(#000000) O[30] -attr @name prdata[30] -hierPin my_uart prdata[30] -pin my_uart|prdata_i__0 O[30]
load net hrdata_pmu[29] -attr @rip hrdata[29] -pin hrdata1_i I0[29] -pin my_pmu hrdata[29]
load net hrdata_ram[18] -attr @rip hrdata[18] -pin hrdata2_i I1[18] -pin my_dmem hrdata[18]
load net hrdata_spi[4] -attr @rip hrdata[4] -pin hrdata0_i I0[4] -pin my_spi hrdata[4]
load net hready0 -pin hready0_i O -pin hready_i I0
netloc hready0 1 6 1 2170
load net hready1 -pin hready0_i I0 -pin hready1_i O
netloc hready1 1 5 1 1900
load net hrdata_apb[27] -attr @rip hrdata[27] -pin hrdata_i I0[27] -pin my_bridge hrdata[27]
load net hrdata_i2c[28] -attr @rip hrdata[28] -pin hrdata2_i I0[28] -pin my_i2c hrdata[28]
load net hready2 -pin hready1_i I0 -pin hready2_i O
netloc hready2 1 4 1 1480
load net prdata[27] -attr @rip prdata[27] -pin my_bridge prdata[27] -pin my_uart prdata[27]
load net pwdata[29] -attr @rip pwdata[29] -pin my_bridge pwdata[29] -pin my_uart pwdata[29]
load net hrdata[11] -attr @rip O[11] -pin hrdata_i O[11] -pin my_cpu hrdata[11]
load net hrdata[6] -attr @rip O[6] -pin hrdata_i O[6] -pin my_cpu hrdata[6]
load net hrdata_pmu[6] -attr @rip hrdata[6] -pin hrdata1_i I0[6] -pin my_pmu hrdata[6]
load net prdata[24] -attr @rip prdata[24] -pin my_bridge prdata[24] -pin my_uart prdata[24]
load net gated_uart_clk -pin gated_uart_clk_i O -pin my_uart pclk
netloc gated_uart_clk 1 14 1 4950
load net pwdata[21] -attr @rip pwdata[21] -pin my_bridge pwdata[21] -pin my_uart pwdata[21]
load net my_uart|prdata[13] -attr @rip(#000000) O[13] -attr @name prdata[13] -hierPin my_uart prdata[13] -pin my_uart|prdata_i__0 O[13]
load net my_uart|my_raw_uart|tx_data[1] -attr @rip tx_data[1] -attr @name tx_data[1] -hierPin my_uart|my_raw_uart tx_data[1] -pin my_uart|my_raw_uart|tx_inst tx_data[1]
load net hrdata_spi[11] -attr @rip hrdata[11] -pin hrdata0_i I0[11] -pin my_spi hrdata[11]
load net hwdata[25] -attr @rip hwdata[25] -pin my_bridge hwdata[25] -pin my_cpu hwdata[25] -pin my_dmem hwdata[25] -pin my_i2c hwdata[25] -pin my_pmu hwdata[25] -pin my_spi hwdata[25]
load net p_0_in[7] -attr @rip haddr[23] -pin is_apb_i I0[7] -pin is_i2c_i I0[7] -pin is_pmu_i I0[7] -pin is_ram_i I0[7] -pin is_spi_i I0[7] -pin my_bridge haddr[23] -pin my_cpu haddr[23] -pin my_dmem haddr[23] -pin my_i2c haddr[23] -pin my_pmu haddr[23] -pin my_spi haddr[23]
load net my_uart|paddr[2] -attr @rip(#000000) paddr[2] -attr @name paddr[2] -hierPin my_uart paddr[2] -pin my_uart|prdata_i S[2] -pin my_uart|rx_data_ready1_i__0 I0[2] -pin my_uart|tx_start1_i__0 I0[2]
load net hrdata_apb[15] -attr @rip hrdata[15] -pin hrdata_i I0[15] -pin my_bridge hrdata[15]
load net pwdata[6] -attr @rip pwdata[6] -pin my_bridge pwdata[6] -pin my_uart pwdata[6]
load net my_uart|rx_data_out[0] -attr @rip(#000000) rx_data[0] -attr @name rx_data_out[0] -pin my_uart|my_raw_uart rx_data[0] -pin my_uart|prdata_i I0[0]
load net my_uart|my_raw_uart|reset -attr @name reset -hierPin my_uart|my_raw_uart reset -pin my_uart|my_raw_uart|rx_inst reset -pin my_uart|my_raw_uart|tx_inst reset
netloc my_uart|my_raw_uart|reset 1 0 1 6640
load net prdata[31] -attr @rip prdata[31] -pin my_bridge prdata[31] -pin my_uart prdata[31]
load net my_uart|pwdata[6] -attr @rip(#000000) pwdata[6] -attr @name pwdata[6] -hierPin my_uart pwdata[6] -pin my_uart|tx_data_in_reg[7:0] D[6]
load net paddr[20] -attr @rip paddr[20] -pin my_bridge paddr[20] -pin my_uart paddr[20]
load net tx_pin -pin my_uart tx_pin -port tx_pin
netloc tx_pin 1 15 1 8550J
load net my_uart|my_raw_uart|rx_data[0] -attr @rip rx_data[0] -attr @name rx_data[0] -hierPin my_uart|my_raw_uart rx_data[0] -pin my_uart|my_raw_uart|rx_inst rx_data[0]
load net hwdata[18] -attr @rip hwdata[18] -pin my_bridge hwdata[18] -pin my_cpu hwdata[18] -pin my_dmem hwdata[18] -pin my_i2c hwdata[18] -pin my_pmu hwdata[18] -pin my_spi hwdata[18]
load net hrdata_ram[27] -attr @rip hrdata[27] -pin hrdata2_i I1[27] -pin my_dmem hrdata[27]
load net pwrite -pin my_bridge pwrite -pin my_uart pwrite
netloc pwrite 1 3 12 1230 230 NJ 230 NJ 230 NJ 230 NJ 230 NJ 230 NJ 230 NJ 230 NJ 230 NJ 230 NJ 230 4970J
load net hrdata_i2c[6] -attr @rip hrdata[6] -pin hrdata2_i I0[6] -pin my_i2c hrdata[6]
load net hrdata_spi[6] -attr @rip hrdata[6] -pin hrdata0_i I0[6] -pin my_spi hrdata[6]
load net paddr[7] -attr @rip paddr[7] -pin my_bridge paddr[7] -pin my_uart paddr[7]
load net hrdata[26] -attr @rip O[26] -pin hrdata_i O[26] -pin my_cpu hrdata[26]
load net paddr[17] -attr @rip paddr[17] -pin my_bridge paddr[17] -pin my_uart paddr[17]
load net p_0_in[0] -attr @rip haddr[16] -pin is_apb_i I0[0] -pin is_i2c_i I0[0] -pin is_pmu_i I0[0] -pin is_ram_i I0[0] -pin is_spi_i I0[0] -pin my_bridge haddr[16] -pin my_cpu haddr[16] -pin my_dmem haddr[16] -pin my_i2c haddr[16] -pin my_pmu haddr[16] -pin my_spi haddr[16]
load net my_uart|<const0> -ground -attr @name <const0> -pin my_uart|prdata_i I0[31] -pin my_uart|prdata_i I0[30] -pin my_uart|prdata_i I0[29] -pin my_uart|prdata_i I0[28] -pin my_uart|prdata_i I0[27] -pin my_uart|prdata_i I0[26] -pin my_uart|prdata_i I0[25] -pin my_uart|prdata_i I0[24] -pin my_uart|prdata_i I0[23] -pin my_uart|prdata_i I0[22] -pin my_uart|prdata_i I0[21] -pin my_uart|prdata_i I0[20] -pin my_uart|prdata_i I0[19] -pin my_uart|prdata_i I0[18] -pin my_uart|prdata_i I0[17] -pin my_uart|prdata_i I0[16] -pin my_uart|prdata_i I0[15] -pin my_uart|prdata_i I0[14] -pin my_uart|prdata_i I0[13] -pin my_uart|prdata_i I0[12] -pin my_uart|prdata_i I0[11] -pin my_uart|prdata_i I0[10] -pin my_uart|prdata_i I0[9] -pin my_uart|prdata_i I0[8] -pin my_uart|prdata_i I1[31] -pin my_uart|prdata_i I1[30] -pin my_uart|prdata_i I1[29] -pin my_uart|prdata_i I1[28] -pin my_uart|prdata_i I1[27] -pin my_uart|prdata_i I1[26] -pin my_uart|prdata_i I1[25] -pin my_uart|prdata_i I1[24] -pin my_uart|prdata_i I1[23] -pin my_uart|prdata_i I1[22] -pin my_uart|prdata_i I1[21] -pin my_uart|prdata_i I1[20] -pin my_uart|prdata_i I1[19] -pin my_uart|prdata_i I1[18] -pin my_uart|prdata_i I1[17] -pin my_uart|prdata_i I1[16] -pin my_uart|prdata_i I1[15] -pin my_uart|prdata_i I1[14] -pin my_uart|prdata_i I1[13] -pin my_uart|prdata_i I1[12] -pin my_uart|prdata_i I1[11] -pin my_uart|prdata_i I1[10] -pin my_uart|prdata_i I1[9] -pin my_uart|prdata_i I1[8] -pin my_uart|prdata_i I1[7] -pin my_uart|prdata_i I1[6] -pin my_uart|prdata_i I1[5] -pin my_uart|prdata_i I1[4] -pin my_uart|prdata_i I1[3] -pin my_uart|prdata_i I1[2] -pin my_uart|prdata_i I2[31] -pin my_uart|prdata_i I2[30] -pin my_uart|prdata_i I2[29] -pin my_uart|prdata_i I2[28] -pin my_uart|prdata_i I2[27] -pin my_uart|prdata_i I2[26] -pin my_uart|prdata_i I2[25] -pin my_uart|prdata_i I2[24] -pin my_uart|prdata_i I2[23] -pin my_uart|prdata_i I2[22] -pin my_uart|prdata_i I2[21] -pin my_uart|prdata_i I2[20] -pin my_uart|prdata_i I2[19] -pin my_uart|prdata_i I2[18] -pin my_uart|prdata_i I2[17] -pin my_uart|prdata_i I2[16] -pin my_uart|prdata_i I2[15] -pin my_uart|prdata_i I2[14] -pin my_uart|prdata_i I2[13] -pin my_uart|prdata_i I2[12] -pin my_uart|prdata_i I2[11] -pin my_uart|prdata_i I2[10] -pin my_uart|prdata_i I2[9] -pin my_uart|prdata_i I2[8] -pin my_uart|prdata_i I2[7] -pin my_uart|prdata_i I2[6] -pin my_uart|prdata_i I2[5] -pin my_uart|prdata_i I2[4] -pin my_uart|prdata_i I2[3] -pin my_uart|prdata_i I2[2] -pin my_uart|prdata_i I2[1] -pin my_uart|prdata_i I2[0] -pin my_uart|prdata_i__0 I1[31] -pin my_uart|prdata_i__0 I1[30] -pin my_uart|prdata_i__0 I1[29] -pin my_uart|prdata_i__0 I1[28] -pin my_uart|prdata_i__0 I1[27] -pin my_uart|prdata_i__0 I1[26] -pin my_uart|prdata_i__0 I1[25] -pin my_uart|prdata_i__0 I1[24] -pin my_uart|prdata_i__0 I1[23] -pin my_uart|prdata_i__0 I1[22] -pin my_uart|prdata_i__0 I1[21] -pin my_uart|prdata_i__0 I1[20] -pin my_uart|prdata_i__0 I1[19] -pin my_uart|prdata_i__0 I1[18] -pin my_uart|prdata_i__0 I1[17] -pin my_uart|prdata_i__0 I1[16] -pin my_uart|prdata_i__0 I1[15] -pin my_uart|prdata_i__0 I1[14] -pin my_uart|prdata_i__0 I1[13] -pin my_uart|prdata_i__0 I1[12] -pin my_uart|prdata_i__0 I1[11] -pin my_uart|prdata_i__0 I1[10] -pin my_uart|prdata_i__0 I1[9] -pin my_uart|prdata_i__0 I1[8] -pin my_uart|prdata_i__0 I1[7] -pin my_uart|prdata_i__0 I1[6] -pin my_uart|prdata_i__0 I1[5] -pin my_uart|prdata_i__0 I1[4] -pin my_uart|prdata_i__0 I1[3] -pin my_uart|prdata_i__0 I1[2] -pin my_uart|prdata_i__0 I1[1] -pin my_uart|prdata_i__0 I1[0] -pin my_uart|rx_data_ready1_i__0 I1[7] -pin my_uart|rx_data_ready1_i__0 I1[6] -pin my_uart|rx_data_ready1_i__0 I1[5] -pin my_uart|rx_data_ready1_i__0 I1[4] -pin my_uart|rx_data_ready1_i__0 I1[3] -pin my_uart|rx_data_ready1_i__0 I1[1] -pin my_uart|rx_data_ready1_i__0 I1[0] -pin my_uart|rx_data_ready_i__0 I1 -pin my_uart|tx_data_in_i I1 -pin my_uart|tx_start1_i__0 I1[7] -pin my_uart|tx_start1_i__0 I1[6] -pin my_uart|tx_start1_i__0 I1[5] -pin my_uart|tx_start1_i__0 I1[4] -pin my_uart|tx_start1_i__0 I1[3] -pin my_uart|tx_start1_i__0 I1[2] -pin my_uart|tx_start1_i__0 I1[1] -pin my_uart|tx_start1_i__0 I1[0] -pin my_uart|tx_start_i I1
load net my_uart|prdata[24] -attr @rip(#000000) O[24] -attr @name prdata[24] -hierPin my_uart prdata[24] -pin my_uart|prdata_i__0 O[24]
load net hrdata_pmu[28] -attr @rip hrdata[28] -pin hrdata1_i I0[28] -pin my_pmu hrdata[28]
load net hrdata_ram[17] -attr @rip hrdata[17] -pin hrdata2_i I1[17] -pin my_dmem hrdata[17]
load net p_0_in[14] -attr @rip haddr[30] -pin is_apb_i I0[14] -pin is_i2c_i I0[14] -pin is_pmu_i I0[14] -pin is_ram_i I0[14] -pin is_spi_i I0[14] -pin my_bridge haddr[30] -pin my_cpu haddr[30] -pin my_dmem haddr[30] -pin my_i2c haddr[30] -pin my_pmu haddr[30] -pin my_spi haddr[30]
load net my_uart|rx_data_ready -attr @rip(#000000) 1 -attr @name rx_data_ready -pin my_uart|prdata_i I1[1] -pin my_uart|rx_data_ready_reg Q
load net prdata[4] -attr @rip prdata[4] -pin my_bridge prdata[4] -pin my_uart prdata[4]
load net hrdata_i2c[27] -attr @rip hrdata[27] -pin hrdata2_i I0[27] -pin my_i2c hrdata[27]
load net hrdata_apb[26] -attr @rip hrdata[26] -pin hrdata_i I0[26] -pin my_bridge hrdata[26]
load net hrdata_spi[5] -attr @rip hrdata[5] -pin hrdata0_i I0[5] -pin my_spi hrdata[5]
load net pwdata[28] -attr @rip pwdata[28] -pin my_bridge pwdata[28] -pin my_uart pwdata[28]
load net hrdata[5] -attr @rip O[5] -pin hrdata_i O[5] -pin my_cpu hrdata[5]
load net hrdata_spi[23] -attr @rip hrdata[23] -pin hrdata0_i I0[23] -pin my_spi hrdata[23]
load net hwdata[22] -attr @rip hwdata[22] -pin my_bridge hwdata[22] -pin my_cpu hwdata[22] -pin my_dmem hwdata[22] -pin my_i2c hwdata[22] -pin my_pmu hwdata[22] -pin my_spi hwdata[22]
load net penable -pin my_bridge penable -pin my_uart penable
netloc penable 1 3 12 1150 170 NJ 170 NJ 170 NJ 170 NJ 170 NJ 170 NJ 170 NJ 170 NJ 170 NJ 170 NJ 170 5030J
load net prdata[23] -attr @rip prdata[23] -pin my_bridge prdata[23] -pin my_uart prdata[23]
load net hrdata[30] -attr @rip O[30] -pin hrdata_i O[30] -pin my_cpu hrdata[30]
load net hrdata0_i_n_0 -attr @rip O[31] -pin hrdata0_i O[31] -pin hrdata_i I1[31]
load net prdata[28] -attr @rip prdata[28] -pin my_bridge prdata[28] -pin my_uart prdata[28]
load net my_uart|my_raw_uart|tx_data[0] -attr @rip tx_data[0] -attr @name tx_data[0] -hierPin my_uart|my_raw_uart tx_data[0] -pin my_uart|my_raw_uart|tx_inst tx_data[0]
load net hrdata0_i_n_1 -attr @rip O[30] -pin hrdata0_i O[30] -pin hrdata_i I1[30]
load net hrdata_pmu[30] -attr @rip hrdata[30] -pin hrdata1_i I0[30] -pin my_pmu hrdata[30]
load net hrdata_pmu[7] -attr @rip hrdata[7] -pin hrdata1_i I0[7] -pin my_pmu hrdata[7]
load net hready_apb -pin hready2_i I0 -pin my_bridge hreadyout
netloc hready_apb 1 3 1 1090
load net my_uart|paddr[1] -attr @rip(#000000) paddr[1] -attr @name paddr[1] -hierPin my_uart paddr[1] -pin my_uart|prdata_i S[1] -pin my_uart|rx_data_ready1_i__0 I0[1] -pin my_uart|tx_start1_i__0 I0[1]
load net hrdata0_i_n_2 -attr @rip O[29] -pin hrdata0_i O[29] -pin hrdata_i I1[29]
load net my_cpu_n_80 -attr @rip haddr[15] -pin my_bridge haddr[15] -pin my_cpu haddr[15] -pin my_dmem haddr[15] -pin my_i2c haddr[15] -pin my_pmu haddr[15] -pin my_spi haddr[15]
load net paddr[30] -attr @rip paddr[30] -pin my_bridge paddr[30] -pin my_uart paddr[30]
load net my_uart|prdata[14] -attr @rip(#000000) O[14] -attr @name prdata[14] -hierPin my_uart prdata[14] -pin my_uart|prdata_i__0 O[14]
load net hrdata0_i_n_3 -attr @rip O[28] -pin hrdata0_i O[28] -pin hrdata_i I1[28]
load net cs_pin -port cs_pin -pin my_spi cs
netloc cs_pin 1 15 1 8470J
load net hrdata_i2c[13] -attr @rip hrdata[13] -pin hrdata2_i I0[13] -pin my_i2c hrdata[13]
load net hrdata_spi[12] -attr @rip hrdata[12] -pin hrdata0_i I0[12] -pin my_spi hrdata[12]
load net my_cpu_n_81 -attr @rip haddr[14] -pin my_bridge haddr[14] -pin my_cpu haddr[14] -pin my_dmem haddr[14] -pin my_i2c haddr[14] -pin my_pmu haddr[14] -pin my_spi haddr[14]
load net hrdata0_i_n_4 -attr @rip O[27] -pin hrdata0_i O[27] -pin hrdata_i I1[27]
load net hrdata_i2c[31] -attr @rip hrdata[31] -pin hrdata2_i I0[31] -pin my_i2c hrdata[31]
load net hrdata_apb[16] -attr @rip hrdata[16] -pin hrdata_i I0[16] -pin my_bridge hrdata[16]
load net my_cpu_n_82 -attr @rip haddr[13] -pin my_bridge haddr[13] -pin my_cpu haddr[13] -pin my_dmem haddr[13] -pin my_i2c haddr[13] -pin my_pmu haddr[13] -pin my_spi haddr[13]
load net paddr[29] -attr @rip paddr[29] -pin my_bridge paddr[29] -pin my_uart paddr[29]
load net prdata[0] -attr @rip prdata[0] -pin my_bridge prdata[0] -pin my_uart prdata[0]
load net pwdata[7] -attr @rip pwdata[7] -pin my_bridge pwdata[7] -pin my_uart pwdata[7]
load net hrdata0_i_n_5 -attr @rip O[26] -pin hrdata0_i O[26] -pin hrdata_i I1[26]
load net hrdata[16] -attr @rip O[16] -pin hrdata_i O[16] -pin my_cpu hrdata[16]
load net hrdata_ram[24] -attr @rip hrdata[24] -pin hrdata2_i I1[24] -pin my_dmem hrdata[24]
load net my_cpu_n_83 -attr @rip haddr[12] -pin my_bridge haddr[12] -pin my_cpu haddr[12] -pin my_dmem haddr[12] -pin my_i2c haddr[12] -pin my_pmu haddr[12] -pin my_spi haddr[12]
load net my_uart|prdata1 -attr @name prdata1 -pin my_uart|prdata1_i O -pin my_uart|prdata_i__0 S
netloc my_uart|prdata1 1 8 1 8000
load net hrdata0_i_n_6 -attr @rip O[25] -pin hrdata0_i O[25] -pin hrdata_i I1[25]
load net hrdata1_i_n_20 -attr @rip O[11] -pin hrdata0_i I1[11] -pin hrdata1_i O[11]
load net hwdata[17] -attr @rip hwdata[17] -pin my_bridge hwdata[17] -pin my_cpu hwdata[17] -pin my_dmem hwdata[17] -pin my_i2c hwdata[17] -pin my_pmu hwdata[17] -pin my_spi hwdata[17]
load net my_cpu_n_84 -attr @rip haddr[11] -pin my_bridge haddr[11] -pin my_cpu haddr[11] -pin my_dmem haddr[11] -pin my_i2c haddr[11] -pin my_pmu haddr[11] -pin my_spi haddr[11]
load net paddr[21] -attr @rip paddr[21] -pin my_bridge paddr[21] -pin my_uart paddr[21]
load net my_uart|rx_data_out[3] -attr @rip(#000000) rx_data[3] -attr @name rx_data_out[3] -pin my_uart|my_raw_uart rx_data[3] -pin my_uart|prdata_i I0[3]
load net my_uart|tx_start2_i_n_0 -attr @name tx_start2_i_n_0 -pin my_uart|rx_data_ready1_i I0 -pin my_uart|tx_start1_i I0 -pin my_uart|tx_start2_i O
netloc my_uart|tx_start2_i_n_0 1 1 3 5400 708 NJ 708 NJ
load net hrdata0_i_n_7 -attr @rip O[24] -pin hrdata0_i O[24] -pin hrdata_i I1[24]
load net hrdata1_i_n_21 -attr @rip O[10] -pin hrdata0_i I1[10] -pin hrdata1_i O[10]
load net my_cpu_n_85 -attr @rip haddr[10] -pin my_bridge haddr[10] -pin my_cpu haddr[10] -pin my_dmem haddr[10] -pin my_i2c haddr[10] -pin my_pmu haddr[10] -pin my_spi haddr[10]
load net hrdata0_i_n_8 -attr @rip O[23] -pin hrdata0_i O[23] -pin hrdata_i I1[23]
load net hrdata1_i_n_22 -attr @rip O[9] -pin hrdata0_i I1[9] -pin hrdata1_i O[9]
load net hrdata_ram[31] -attr @rip hrdata[31] -pin hrdata2_i I1[31] -pin my_dmem hrdata[31]
load net my_cpu_n_86 -attr @rip haddr[9] -pin my_bridge haddr[9] -pin my_cpu haddr[9] -pin my_dmem haddr[9] -pin my_i2c haddr[9] -pin my_pmu haddr[9] -pin my_spi haddr[9]
load net paddr[1] -attr @rip paddr[1] -pin my_bridge paddr[1] -pin my_uart paddr[1]
load net paddr[6] -attr @rip paddr[6] -pin my_bridge paddr[6] -pin my_uart paddr[6]
load net spi_clk_en -pin gated_spi_clk0_i I0 -pin my_pmu spi_clk_en
netloc spi_clk_en 1 11 2 NJ 390 N
load net hrdata[25] -attr @rip O[25] -pin hrdata_i O[25] -pin my_cpu hrdata[25]
load net hrdata0_i_n_9 -attr @rip O[22] -pin hrdata0_i O[22] -pin hrdata_i I1[22]
load net hrdata1_i_n_23 -attr @rip O[8] -pin hrdata0_i I1[8] -pin hrdata1_i O[8]
load net hrdata_spi[18] -attr @rip hrdata[18] -pin hrdata0_i I0[18] -pin my_spi hrdata[18]
load net my_cpu_n_87 -attr @rip haddr[8] -pin my_bridge haddr[8] -pin my_cpu haddr[8] -pin my_dmem haddr[8] -pin my_i2c haddr[8] -pin my_pmu haddr[8] -pin my_spi haddr[8]
load net paddr[16] -attr @rip paddr[16] -pin my_bridge paddr[16] -pin my_uart paddr[16]
load net my_uart|prdata[10] -attr @rip(#000000) O[10] -attr @name prdata[10] -hierPin my_uart prdata[10] -pin my_uart|prdata_i__0 O[10]
load net hrdata_i2c[7] -attr @rip hrdata[7] -pin hrdata2_i I0[7] -pin my_i2c hrdata[7]
load net hrdata1_i_n_24 -attr @rip O[7] -pin hrdata0_i I1[7] -pin hrdata1_i O[7]
load net my_cpu_n_88 -attr @rip haddr[7] -pin my_bridge haddr[7] -pin my_cpu haddr[7] -pin my_dmem haddr[7] -pin my_i2c haddr[7] -pin my_pmu haddr[7] -pin my_spi haddr[7]
load net prdata[9] -attr @rip prdata[9] -pin my_bridge prdata[9] -pin my_uart prdata[9]
load net my_uart|prdata[23] -attr @rip(#000000) O[23] -attr @name prdata[23] -hierPin my_uart prdata[23] -pin my_uart|prdata_i__0 O[23]
load net hrdata1_i_n_25 -attr @rip O[6] -pin hrdata0_i I1[6] -pin hrdata1_i O[6]
load net hrdata_pmu[27] -attr @rip hrdata[27] -pin hrdata1_i I0[27] -pin my_pmu hrdata[27]
load net my_cpu_n_89 -attr @rip haddr[6] -pin my_bridge haddr[6] -pin my_cpu haddr[6] -pin my_dmem haddr[6] -pin my_i2c haddr[6] -pin my_pmu haddr[6] -pin my_spi haddr[6]
load net my_uart|tx_data_in[3] -attr @rip(#000000) 3 -attr @name tx_data_in[3] -pin my_uart|my_raw_uart tx_data[3] -pin my_uart|tx_data_in_reg[7:0] Q[3]
load net hrdata1_i_n_26 -attr @rip O[5] -pin hrdata0_i I1[5] -pin hrdata1_i O[5]
load net hrdata_spi[9] -attr @rip hrdata[9] -pin hrdata0_i I0[9] -pin my_spi hrdata[9]
load net p_0_in[1] -attr @rip haddr[17] -pin is_apb_i I0[1] -pin is_i2c_i I0[1] -pin is_pmu_i I0[1] -pin is_ram_i I0[1] -pin is_spi_i I0[1] -pin my_bridge haddr[17] -pin my_cpu haddr[17] -pin my_dmem haddr[17] -pin my_i2c haddr[17] -pin my_pmu haddr[17] -pin my_spi haddr[17]
load net prdata[3] -attr @rip prdata[3] -pin my_bridge prdata[3] -pin my_uart prdata[3]
load net my_uart|<const1> -power -attr @rip(#000000) 2 -attr @name <const1> -hierPin my_uart pready -pin my_uart|rx_data_ready1_i__0 I1[2] -pin my_uart|rx_data_ready_i I0 -pin my_uart|rx_data_ready_i__0 I0 -pin my_uart|tx_data_in_i I0 -pin my_uart|tx_start_i I0
load net hrdata1_i_n_27 -attr @rip O[4] -pin hrdata0_i I1[4] -pin hrdata1_i O[4]
load net hrdata_apb[25] -attr @rip hrdata[25] -pin hrdata_i I0[25] -pin my_bridge hrdata[25]
load net hrdata_i2c[26] -attr @rip hrdata[26] -pin hrdata2_i I0[26] -pin my_i2c hrdata[26]
load net p_0_in[15] -attr @rip haddr[31] -pin is_apb_i I0[15] -pin is_i2c_i I0[15] -pin is_pmu_i I0[15] -pin is_ram_i I0[15] -pin is_spi_i I0[15] -pin my_bridge haddr[31] -pin my_cpu haddr[31] -pin my_dmem haddr[31] -pin my_i2c haddr[31] -pin my_pmu haddr[31] -pin my_spi haddr[31]
load net pwdata[27] -attr @rip pwdata[27] -pin my_bridge pwdata[27] -pin my_uart pwdata[27]
load net hrdata1_i_n_28 -attr @rip O[3] -pin hrdata0_i I1[3] -pin hrdata1_i O[3]
load net hrdata[4] -attr @rip O[4] -pin hrdata_i O[4] -pin my_cpu hrdata[4]
load net hrdata_pmu[4] -attr @rip hrdata[4] -pin hrdata1_i I0[4] -pin my_pmu hrdata[4]
load net hrdata_spi[22] -attr @rip hrdata[22] -pin hrdata0_i I0[22] -pin my_spi hrdata[22]
load net hwdata[5] -attr @rip hwdata[5] -pin my_bridge hwdata[5] -pin my_cpu hwdata[5] -pin my_dmem hwdata[5] -pin my_i2c hwdata[5] -pin my_pmu hwdata[5] -pin my_spi hwdata[5]
load net hrdata1_i_n_29 -attr @rip O[2] -pin hrdata0_i I1[2] -pin hrdata1_i O[2]
load net i2c_scl -port i2c_scl -pin my_i2c scl -pin my_i2c_slave scl
netloc i2c_scl 1 14 2 4770 1568 8530J
load net my_uart|rx_data_ready_i__0_n_0 -attr @name rx_data_ready_i__0_n_0 -pin my_uart|rx_data_ready_i__0 O -pin my_uart|rx_data_ready_reg RST
netloc my_uart|rx_data_ready_i__0_n_0 1 6 1 7460
load net my_uart|my_raw_uart|tx_start -attr @name tx_start -hierPin my_uart|my_raw_uart tx_start -pin my_uart|my_raw_uart|tx_inst tx_start
netloc my_uart|my_raw_uart|tx_start 1 0 1 N
load net hwdata[23] -attr @rip hwdata[23] -pin my_bridge hwdata[23] -pin my_cpu hwdata[23] -pin my_dmem hwdata[23] -pin my_i2c hwdata[23] -pin my_pmu hwdata[23] -pin my_spi hwdata[23]
load net hrdata[31] -attr @rip O[31] -pin hrdata_i O[31] -pin my_cpu hrdata[31]
load net pwdata[4] -attr @rip pwdata[4] -pin my_bridge pwdata[4] -pin my_uart pwdata[4]
load net prdata[26] -attr @rip prdata[26] -pin my_bridge prdata[26] -pin my_uart prdata[26]
load net paddr[28] -attr @rip paddr[28] -pin my_bridge paddr[28] -pin my_uart paddr[28]
load net my_uart|prdata[8] -attr @rip(#000000) O[8] -attr @name prdata[8] -hierPin my_uart prdata[8] -pin my_uart|prdata_i__0 O[8]
load net hrdata_i2c[14] -attr @rip hrdata[14] -pin hrdata2_i I0[14] -pin my_i2c hrdata[14]
load net gated_spi_clk0 -pin gated_spi_clk0_i O -pin gated_spi_clk_i I1
netloc gated_spi_clk0 1 13 1 N
load net hrdata_ram[28] -attr @rip hrdata[28] -pin hrdata2_i I1[28] -pin my_dmem hrdata[28]
load net hrdata_apb[17] -attr @rip hrdata[17] -pin hrdata_i I0[17] -pin my_bridge hrdata[17]
load net hrdata1_i_n_10 -attr @rip O[21] -pin hrdata0_i I1[21] -pin hrdata1_i O[21]
load net i2c_sda -port i2c_sda -pin my_i2c sda -pin my_i2c_slave sda
netloc i2c_sda 1 14 2 4750J 1468 8550
load net my_uart|rx_data_out[2] -attr @rip(#000000) rx_data[2] -attr @name rx_data_out[2] -pin my_uart|my_raw_uart rx_data[2] -pin my_uart|prdata_i I0[2]
load net my_uart|my_raw_uart|rx_pin -attr @name rx_pin -hierPin my_uart|my_raw_uart rx_pin -pin my_uart|my_raw_uart|rx_inst rx
netloc my_uart|my_raw_uart|rx_pin 1 0 1 N
load net hrdata[17] -attr @rip O[17] -pin hrdata_i O[17] -pin my_cpu hrdata[17]
load net hrdata1_i_n_11 -attr @rip O[20] -pin hrdata0_i I1[20] -pin hrdata1_i O[20]
load net hrdata_ram[25] -attr @rip hrdata[25] -pin hrdata2_i I1[25] -pin my_dmem hrdata[25]
load net hrdata1_i_n_12 -attr @rip O[19] -pin hrdata0_i I1[19] -pin hrdata1_i O[19]
load net hrdata_apb[9] -attr @rip hrdata[9] -pin hrdata_i I0[9] -pin my_bridge hrdata[9]
load net hrdata_i2c[4] -attr @rip hrdata[4] -pin hrdata2_i I0[4] -pin my_i2c hrdata[4]
load net hrdata_ram[5] -attr @rip hrdata[5] -pin hrdata2_i I1[5] -pin my_dmem hrdata[5]
load net paddr[0] -attr @rip paddr[0] -pin my_bridge paddr[0] -pin my_uart paddr[0]
load net my_uart|prdata[19] -attr @rip(#000000) O[19] -attr @name prdata[19] -hierPin my_uart prdata[19] -pin my_uart|prdata_i__0 O[19]
load net hrdata1_i_n_13 -attr @rip O[18] -pin hrdata0_i I1[18] -pin hrdata1_i O[18]
load net hrdata_spi[17] -attr @rip hrdata[17] -pin hrdata0_i I0[17] -pin my_spi hrdata[17]
load net is_i2c -pin hrdata2_i S -pin hsel_i2c_i I0 -pin is_i2c_i O
netloc is_i2c 1 3 10 NJ N 1480 750 NJ 750 NJ 750 NJ 750 NJ 750 NJ 750 NJ 750 NJ 750 4060J
load net paddr[10] -attr @rip paddr[10] -pin my_bridge paddr[10] -pin my_uart paddr[10]
load net paddr[15] -attr @rip paddr[15] -pin my_bridge paddr[15] -pin my_uart paddr[15]
load net my_uart|presetn -attr @name presetn -hierPin my_uart presetn -pin my_uart|rx_data_ready_i__0 S -pin my_uart|tx_data_in_i S -pin my_uart|tx_start_i S -pin my_uart|uart_reset_i I0
netloc my_uart|presetn 1 0 6 NJ 388 NJ 388 5630 N 5930 488 6470J 666 7080J
load net hrdata1_i_n_14 -attr @rip O[17] -pin hrdata0_i I1[17] -pin hrdata1_i O[17]
load net my_uart|prdata[22] -attr @rip(#000000) O[22] -attr @name prdata[22] -hierPin my_uart prdata[22] -pin my_uart|prdata_i__0 O[22]
load net hrdata1_i_n_15 -attr @rip O[16] -pin hrdata0_i I1[16] -pin hrdata1_i O[16]
load net hrdata_pmu[21] -attr @rip hrdata[21] -pin hrdata1_i I0[21] -pin my_pmu hrdata[21]
load net hrdata_pmu[26] -attr @rip hrdata[26] -pin hrdata1_i I0[26] -pin my_pmu hrdata[26]
load net hrdata1_i_n_16 -attr @rip O[15] -pin hrdata0_i I1[15] -pin hrdata1_i O[15]
load net hrdata_spi[8] -attr @rip hrdata[8] -pin hrdata0_i I0[8] -pin my_spi hrdata[8]
load net prdata[2] -attr @rip prdata[2] -pin my_bridge prdata[2] -pin my_uart prdata[2]
load net hrdata1_i_n_17 -attr @rip O[14] -pin hrdata0_i I1[14] -pin hrdata1_i O[14]
load net hrdata[28] -attr @rip O[28] -pin hrdata_i O[28] -pin my_cpu hrdata[28]
load net hrdata_apb[24] -attr @rip hrdata[24] -pin hrdata_i I0[24] -pin my_bridge hrdata[24]
load net htrans[0] -attr @rip htrans[0] -pin htrans_i S[0] -pin my_bridge htrans[0] -pin my_cpu htrans[0] -pin my_dmem htrans[0] -pin my_i2c htrans[0] -pin my_pmu htrans[0] -pin my_spi htrans[0]
load net pwdata[26] -attr @rip pwdata[26] -pin my_bridge pwdata[26] -pin my_uart pwdata[26]
load net my_uart|tx_data_in[4] -attr @rip(#000000) 4 -attr @name tx_data_in[4] -pin my_uart|my_raw_uart tx_data[4] -pin my_uart|tx_data_in_reg[7:0] Q[4]
load net hrdata1_i_n_18 -attr @rip O[13] -pin hrdata0_i I1[13] -pin hrdata1_i O[13]
load net hrdata[3] -attr @rip O[3] -pin hrdata_i O[3] -pin my_cpu hrdata[3]
load net hrdata_spi[21] -attr @rip hrdata[21] -pin hrdata0_i I0[21] -pin my_spi hrdata[21]
load net hwdata[20] -attr @rip hwdata[20] -pin my_bridge hwdata[20] -pin my_cpu hwdata[20] -pin my_dmem hwdata[20] -pin my_i2c hwdata[20] -pin my_pmu hwdata[20] -pin my_spi hwdata[20]
load net hwdata[4] -attr @rip hwdata[4] -pin my_bridge hwdata[4] -pin my_cpu hwdata[4] -pin my_dmem hwdata[4] -pin my_i2c hwdata[4] -pin my_pmu hwdata[4] -pin my_spi hwdata[4]
load net p_0_in[2] -attr @rip haddr[18] -pin is_apb_i I0[2] -pin is_i2c_i I0[2] -pin is_pmu_i I0[2] -pin is_ram_i I0[2] -pin is_spi_i I0[2] -pin my_bridge haddr[18] -pin my_cpu haddr[18] -pin my_dmem haddr[18] -pin my_i2c haddr[18] -pin my_pmu haddr[18] -pin my_spi haddr[18]
load net prdata[16] -attr @rip prdata[16] -pin my_bridge prdata[16] -pin my_uart prdata[16]
load net my_uart|pwrite -attr @name pwrite -hierPin my_uart pwrite -pin my_uart|rx_data_ready2_i I0 -pin my_uart|tx_start1_i I1
netloc my_uart|pwrite 1 0 3 NJ 488 5420 748 NJ
load net hrdata1_i_n_19 -attr @rip O[12] -pin hrdata0_i I1[12] -pin hrdata1_i O[12]
load net hrdata_ram[19] -attr @rip hrdata[19] -pin hrdata2_i I1[19] -pin my_dmem hrdata[19]
load net hrdata_pmu[5] -attr @rip hrdata[5] -pin hrdata1_i I0[5] -pin my_pmu hrdata[5]
load net hrdata2_i_n_30 -attr @rip O[1] -pin hrdata1_i I1[1] -pin hrdata2_i O[1]
load net prdata[25] -attr @rip prdata[25] -pin my_bridge prdata[25] -pin my_uart prdata[25]
load net hrdata2_i_n_31 -attr @rip O[0] -pin hrdata1_i I1[0] -pin hrdata2_i O[0]
load net hrdata_spi[28] -attr @rip hrdata[28] -pin hrdata0_i I0[28] -pin my_spi hrdata[28]
load net pwdata[5] -attr @rip pwdata[5] -pin my_bridge pwdata[5] -pin my_uart pwdata[5]
load net my_uart|prdata[2] -attr @rip(#000000) O[2] -attr @name prdata[2] -hierPin my_uart prdata[2] -pin my_uart|prdata_i__0 O[2]
load net hrdata[14] -attr @rip O[14] -pin hrdata_i O[14] -pin my_cpu hrdata[14]
load net hrdata_ram[22] -attr @rip hrdata[22] -pin hrdata2_i I1[22] -pin my_dmem hrdata[22]
load net hsel_apb -pin hsel_apb_i O -pin my_bridge hsel
netloc hsel_apb 1 2 1 580
load net my_uart|prdata[9] -attr @rip(#000000) O[9] -attr @name prdata[9] -hierPin my_uart prdata[9] -pin my_uart|prdata_i__0 O[9]
load net hrdata_i2c[15] -attr @rip hrdata[15] -pin hrdata2_i I0[15] -pin my_i2c hrdata[15]
load net hrdata_ram[29] -attr @rip hrdata[29] -pin hrdata2_i I1[29] -pin my_dmem hrdata[29]
load net my_uart|tx_pin -attr @name tx_pin -hierPin my_uart tx_pin -pin my_uart|my_raw_uart tx_pin
netloc my_uart|tx_pin 1 5 5 7120 438 NJ 438 7680J 408 NJ 408 NJ
load net hrdata_apb[18] -attr @rip hrdata[18] -pin hrdata_i I0[18] -pin my_bridge hrdata[18]
load net hrdata_apb[8] -attr @rip hrdata[8] -pin hrdata_i I0[8] -pin my_bridge hrdata[8]
load net hrdata_ram[4] -attr @rip hrdata[4] -pin hrdata2_i I1[4] -pin my_dmem hrdata[4]
load net hrdata_spi[16] -attr @rip hrdata[16] -pin hrdata0_i I0[16] -pin my_spi hrdata[16]
load net paddr[14] -attr @rip paddr[14] -pin my_bridge paddr[14] -pin my_uart paddr[14]
load net my_uart|paddr[7] -attr @rip(#000000) paddr[7] -attr @name paddr[7] -hierPin my_uart paddr[7] -pin my_uart|prdata_i S[7] -pin my_uart|rx_data_ready1_i__0 I0[7] -pin my_uart|tx_start1_i__0 I0[7]
load net hrdata_i2c[5] -attr @rip hrdata[5] -pin hrdata2_i I0[5] -pin my_i2c hrdata[5]
load net my_uart|pclk -attr @name pclk -hierPin my_uart pclk -pin my_uart|my_raw_uart clk -pin my_uart|rx_data_ready_reg C -pin my_uart|tx_data_in_reg[7:0] C -pin my_uart|tx_start_reg C
netloc my_uart|pclk 1 0 7 NJ 258 NJ 258 NJ 258 5950 408 6410 706 7160J 538 7440J
load net my_uart|penable -attr @name penable -hierPin my_uart penable -pin my_uart|tx_start2_i I1
netloc my_uart|penable 1 0 1 5230
load net my_uart|rx_data_out[5] -attr @rip(#000000) rx_data[5] -attr @name rx_data_out[5] -pin my_uart|my_raw_uart rx_data[5] -pin my_uart|prdata_i I0[5]
load net hrdata_pmu[20] -attr @rip hrdata[20] -pin hrdata1_i I0[20] -pin my_pmu hrdata[20]
load net hrdata_spi[0] -attr @rip hrdata[0] -pin hrdata0_i I0[0] -pin my_spi hrdata[0]
load net uart_clk_en -pin gated_uart_clk0_i I0 -pin my_pmu uart_clk_en
netloc uart_clk_en 1 11 2 NJ 410 4040
load net my_uart|tx_data_in[1] -attr @rip(#000000) 1 -attr @name tx_data_in[1] -pin my_uart|my_raw_uart tx_data[1] -pin my_uart|tx_data_in_reg[7:0] Q[1]
load net my_uart|tx_data_in_i_n_0 -attr @name tx_data_in_i_n_0 -pin my_uart|tx_data_in_i O -pin my_uart|tx_data_in_reg[7:0] RST
netloc my_uart|tx_data_in_i_n_0 1 3 1 5970
load net hrdata_pmu[15] -attr @rip hrdata[15] -pin hrdata1_i I0[15] -pin my_pmu hrdata[15]
load net prdata[1] -attr @rip prdata[1] -pin my_bridge prdata[1] -pin my_uart prdata[1]
load net hrdata[27] -attr @rip O[27] -pin hrdata_i O[27] -pin my_cpu hrdata[27]
load net hrdata_apb[23] -attr @rip hrdata[23] -pin hrdata_i I0[23] -pin my_bridge hrdata[23]
load net hrdata[2] -attr @rip O[2] -pin hrdata_i O[2] -pin my_cpu hrdata[2]
load net hrdata_spi[20] -attr @rip hrdata[20] -pin hrdata0_i I0[20] -pin my_spi hrdata[20]
load net is_spi -pin hrdata0_i S -pin hsel_spi_i I0 -pin is_spi_i O
netloc is_spi 1 5 9 NJ N NJ 960 NJ 960 NJ 960 NJ 960 NJ 960 NJ 960 NJ 960 4400
load net paddr[19] -attr @rip paddr[19] -pin my_bridge paddr[19] -pin my_uart paddr[19]
load net prdata[20] -attr @rip prdata[20] -pin my_bridge prdata[20] -pin my_uart prdata[20]
load net is_pmu -pin hrdata1_i S -pin hsel_pmu_i I0 -pin is_pmu_i O
netloc is_pmu 1 5 5 1880 1060 NJ 1060 NJ 1060 2870J 1040 3200
load net my_uart|my_raw_uart|tx_done -attr @name tx_done -hierPin my_uart|my_raw_uart tx_done -pin my_uart|my_raw_uart|tx_inst tx_done
netloc my_uart|my_raw_uart|tx_done 1 1 1 N
load net hrdata_i2c[1] -attr @rip hrdata[1] -pin hrdata2_i I0[1] -pin my_i2c hrdata[1]
load net hwdata[21] -attr @rip hwdata[21] -pin my_bridge hwdata[21] -pin my_cpu hwdata[21] -pin my_dmem hwdata[21] -pin my_i2c hwdata[21] -pin my_pmu hwdata[21] -pin my_spi hwdata[21]
load net p_0_in[3] -attr @rip haddr[19] -pin is_apb_i I0[3] -pin is_i2c_i I0[3] -pin is_pmu_i I0[3] -pin is_ram_i I0[3] -pin is_spi_i I0[3] -pin my_bridge haddr[19] -pin my_cpu haddr[19] -pin my_dmem haddr[19] -pin my_i2c haddr[19] -pin my_pmu haddr[19] -pin my_spi haddr[19]
load net prdata[17] -attr @rip prdata[17] -pin my_bridge prdata[17] -pin my_uart prdata[17]
load net hrdata2_i_n_20 -attr @rip O[11] -pin hrdata1_i I1[11] -pin hrdata2_i O[11]
load net hwdata[7] -attr @rip hwdata[7] -pin my_bridge hwdata[7] -pin my_cpu hwdata[7] -pin my_dmem hwdata[7] -pin my_i2c hwdata[7] -pin my_pmu hwdata[7] -pin my_spi hwdata[7]
load net my_uart|rx_done -attr @name rx_done -pin my_uart|my_raw_uart rx_done -pin my_uart|rx_data_ready_i S -pin my_uart|rx_data_ready_reg D
netloc my_uart|rx_done 1 5 2 7100 N 7460
load net hrdata2_i_n_21 -attr @rip O[10] -pin hrdata1_i I1[10] -pin hrdata2_i O[10]
load net pwdata[13] -attr @rip pwdata[13] -pin my_bridge pwdata[13] -pin my_uart pwdata[13]
load net hrdata2_i_n_22 -attr @rip O[9] -pin hrdata1_i I1[9] -pin hrdata2_i O[9]
load net pwdata[31] -attr @rip pwdata[31] -pin my_bridge pwdata[31] -pin my_uart pwdata[31]
load net hrdata2_i_n_23 -attr @rip O[8] -pin hrdata1_i I1[8] -pin hrdata2_i O[8]
load net gated_uart_clk0 -pin gated_uart_clk0_i O -pin gated_uart_clk_i I1
netloc gated_uart_clk0 1 13 1 N
load net hrdata_spi[29] -attr @rip hrdata[29] -pin hrdata0_i I0[29] -pin my_spi hrdata[29]
load net my_cpu_n_90 -attr @rip haddr[5] -pin my_bridge haddr[5] -pin my_cpu haddr[5] -pin my_dmem haddr[5] -pin my_i2c haddr[5] -pin my_pmu haddr[5] -pin my_spi haddr[5]
load net paddr[31] -attr @rip paddr[31] -pin my_bridge paddr[31] -pin my_uart paddr[31]
load net my_uart|prdata[3] -attr @rip(#000000) O[3] -attr @name prdata[3] -hierPin my_uart prdata[3] -pin my_uart|prdata_i__0 O[3]
load net hrdata2_i_n_24 -attr @rip O[7] -pin hrdata1_i I1[7] -pin hrdata2_i O[7]
load net hrdata[15] -attr @rip O[15] -pin hrdata_i O[15] -pin my_cpu hrdata[15]
load net hrdata_ram[23] -attr @rip hrdata[23] -pin hrdata2_i I1[23] -pin my_dmem hrdata[23]
load net my_cpu_n_91 -attr @rip haddr[4] -pin my_bridge haddr[4] -pin my_cpu haddr[4] -pin my_dmem haddr[4] -pin my_i2c haddr[4] -pin my_pmu haddr[4] -pin my_spi haddr[4]
load net hrdata_apb[7] -attr @rip hrdata[7] -pin hrdata_i I0[7] -pin my_bridge hrdata[7]
load net hrdata2_i_n_25 -attr @rip O[6] -pin hrdata1_i I1[6] -pin hrdata2_i O[6]
load net hrdata_ram[3] -attr @rip hrdata[3] -pin hrdata2_i I1[3] -pin my_dmem hrdata[3]
load net my_cpu_n_92 -attr @rip haddr[3] -pin my_bridge haddr[3] -pin my_cpu haddr[3] -pin my_dmem haddr[3] -pin my_i2c haddr[3] -pin my_pmu haddr[3] -pin my_spi haddr[3]
load net my_uart|prdata[17] -attr @rip(#000000) O[17] -attr @name prdata[17] -hierPin my_uart prdata[17] -pin my_uart|prdata_i__0 O[17]
load net hrdata2_i_n_26 -attr @rip O[5] -pin hrdata1_i I1[5] -pin hrdata2_i O[5]
load net hrdata_i2c[16] -attr @rip hrdata[16] -pin hrdata2_i I0[16] -pin my_i2c hrdata[16]
load net hrdata_spi[15] -attr @rip hrdata[15] -pin hrdata0_i I0[15] -pin my_spi hrdata[15]
load net my_cpu_n_93 -attr @rip haddr[2] -pin my_bridge haddr[2] -pin my_cpu haddr[2] -pin my_dmem haddr[2] -pin my_i2c haddr[2] -pin my_pmu haddr[2] -pin my_spi haddr[2]
load net paddr[13] -attr @rip paddr[13] -pin my_bridge paddr[13] -pin my_uart paddr[13]
load net my_uart|paddr[6] -attr @rip(#000000) paddr[6] -attr @name paddr[6] -hierPin my_uart paddr[6] -pin my_uart|prdata_i S[6] -pin my_uart|rx_data_ready1_i__0 I0[6] -pin my_uart|tx_start1_i__0 I0[6]
load net hrdata1_i_n_30 -attr @rip O[1] -pin hrdata0_i I1[1] -pin hrdata1_i O[1]
load net hrdata2_i_n_27 -attr @rip O[4] -pin hrdata1_i I1[4] -pin hrdata2_i O[4]
load net hrdata_apb[19] -attr @rip hrdata[19] -pin hrdata_i I0[19] -pin my_bridge hrdata[19]
load net hsel_i2c -pin hsel_i2c_i O -pin my_i2c hsel
netloc hsel_i2c 1 13 1 4300
load net my_cpu_n_94 -attr @rip haddr[1] -pin my_bridge haddr[1] -pin my_cpu haddr[1] -pin my_dmem haddr[1] -pin my_i2c haddr[1] -pin my_pmu haddr[1] -pin my_spi haddr[1]
load net my_uart|rx_data_out[4] -attr @rip(#000000) rx_data[4] -attr @name rx_data_out[4] -pin my_uart|my_raw_uart rx_data[4] -pin my_uart|prdata_i I0[4]
load net hrdata1_i_n_31 -attr @rip O[0] -pin hrdata0_i I1[0] -pin hrdata1_i O[0]
load net hrdata2_i_n_28 -attr @rip O[3] -pin hrdata1_i I1[3] -pin hrdata2_i O[3]
load net my_cpu_n_95 -attr @rip haddr[0] -pin my_bridge haddr[0] -pin my_cpu haddr[0] -pin my_dmem haddr[0] -pin my_i2c haddr[0] -pin my_pmu haddr[0] -pin my_spi haddr[0]
load net p_0_in[8] -attr @rip haddr[24] -pin is_apb_i I0[8] -pin is_i2c_i I0[8] -pin is_pmu_i I0[8] -pin is_ram_i I0[8] -pin is_spi_i I0[8] -pin my_bridge haddr[24] -pin my_cpu haddr[24] -pin my_dmem haddr[24] -pin my_i2c haddr[24] -pin my_pmu haddr[24] -pin my_spi haddr[24]
load net hrdata2_i_n_29 -attr @rip O[2] -pin hrdata1_i I1[2] -pin hrdata2_i O[2]
load net hrdata_pmu[19] -attr @rip hrdata[19] -pin hrdata1_i I0[19] -pin my_pmu hrdata[19]
load net hrdata_apb[22] -attr @rip hrdata[22] -pin hrdata_i I0[22] -pin my_bridge hrdata[22]
load net hrdata_ram[10] -attr @rip hrdata[10] -pin hrdata2_i I1[10] -pin my_dmem hrdata[10]
load net hrdata_spi[1] -attr @rip hrdata[1] -pin hrdata0_i I0[1] -pin my_spi hrdata[1]
load net hready_spi -pin hready1_i I1 -pin my_spi hreadyout
netloc hready_spi 1 4 12 1520 470 1880J 460 2190J 490 NJ 490 NJ 490 NJ 490 NJ 490 NJ 490 NJ 490 4320J 460 4910J 1148 8450
load net hwdata[31] -attr @rip hwdata[31] -pin my_bridge hwdata[31] -pin my_cpu hwdata[31] -pin my_dmem hwdata[31] -pin my_i2c hwdata[31] -pin my_pmu hwdata[31] -pin my_spi hwdata[31]
load net my_uart|tx_data_in[2] -attr @rip(#000000) 2 -attr @name tx_data_in[2] -pin my_uart|my_raw_uart tx_data[2] -pin my_uart|tx_data_in_reg[7:0] Q[2]
load net hrdata[1] -attr @rip O[1] -pin hrdata_i O[1] -pin my_cpu hrdata[1]
load net hrdata_pmu[16] -attr @rip hrdata[16] -pin hrdata1_i I0[16] -pin my_pmu hrdata[16]
load net prdata[14] -attr @rip prdata[14] -pin my_bridge prdata[14] -pin my_uart prdata[14]
load net hrdata_ram[12] -attr @rip hrdata[12] -pin hrdata2_i I1[12] -pin my_dmem hrdata[12]
load net hrdata_i2c[0] -attr @rip hrdata[0] -pin hrdata2_i I0[0] -pin my_i2c hrdata[0]
load net hsel_spi -pin hsel_spi_i O -pin my_spi hsel
netloc hsel_spi 1 14 1 4790
load net hrdata2_i_n_10 -attr @rip O[21] -pin hrdata1_i I1[21] -pin hrdata2_i O[21]
load net hready_ram -pin hready2_i I1 -pin my_dmem hreadyout
netloc hready_ram 1 3 1 N
load net hwdata[6] -attr @rip hwdata[6] -pin my_bridge hwdata[6] -pin my_cpu hwdata[6] -pin my_dmem hwdata[6] -pin my_i2c hwdata[6] -pin my_pmu hwdata[6] -pin my_spi hwdata[6]
load net hrdata2_i_n_11 -attr @rip O[20] -pin hrdata1_i I1[20] -pin hrdata2_i O[20]
load net my_uart|prdata[0] -attr @rip(#000000) O[0] -attr @name prdata[0] -hierPin my_uart prdata[0] -pin my_uart|prdata_i__0 O[0]
load net hrdata2_i_n_12 -attr @rip O[19] -pin hrdata1_i I1[19] -pin hrdata2_i O[19]
load net hrdata_ram[20] -attr @rip hrdata[20] -pin hrdata2_i I1[20] -pin my_dmem hrdata[20]
load net hready_i2c -pin hready_i I1 -pin my_i2c hreadyout
netloc hready_i2c 1 6 9 2210 470 NJ 470 NJ 470 NJ 470 NJ 470 NJ 470 NJ 470 4300J 440 4750
load net prdata[8] -attr @rip prdata[8] -pin my_bridge prdata[8] -pin my_uart prdata[8]
load net hrdata2_i_n_13 -attr @rip O[18] -pin hrdata1_i I1[18] -pin hrdata2_i O[18]
load net pwdata[14] -attr @rip pwdata[14] -pin my_bridge pwdata[14] -pin my_uart pwdata[14]
load net my_uart|my_raw_uart|rx_data[7] -attr @rip rx_data[7] -attr @name rx_data[7] -hierPin my_uart|my_raw_uart rx_data[7] -pin my_uart|my_raw_uart|rx_inst rx_data[7]
load net hrdata2_i_n_14 -attr @rip O[17] -pin hrdata1_i I1[17] -pin hrdata2_i O[17]
load net hsel_ram -pin hsel_ram_i O -pin my_dmem hsel
netloc hsel_ram 1 2 1 560
load net my_uart|pwdata[0] -attr @rip(#000000) pwdata[0] -attr @name pwdata[0] -hierPin my_uart pwdata[0] -pin my_uart|tx_data_in_reg[7:0] D[0]
load net gated_spi_clk -pin gated_spi_clk_i O -pin my_spi hclk
netloc gated_spi_clk 1 14 1 4890
load net hrdata_apb[6] -attr @rip hrdata[6] -pin hrdata_i I0[6] -pin my_bridge hrdata[6]
load net hrdata2_i_n_15 -attr @rip O[16] -pin hrdata1_i I1[16] -pin hrdata2_i O[16]
load net hrdata_ram[2] -attr @rip hrdata[2] -pin hrdata2_i I1[2] -pin my_dmem hrdata[2]
load net hrdata2_i_n_16 -attr @rip O[15] -pin hrdata1_i I1[15] -pin hrdata2_i O[15]
load net paddr[12] -attr @rip paddr[12] -pin my_bridge paddr[12] -pin my_uart paddr[12]
load net my_uart|paddr[0] -attr @rip(#000000) paddr[0] -attr @name paddr[0] -hierPin my_uart paddr[0] -pin my_uart|prdata_i S[0] -pin my_uart|rx_data_ready1_i__0 I0[0] -pin my_uart|tx_start1_i__0 I0[0]
load net my_uart|paddr[5] -attr @rip(#000000) paddr[5] -attr @name paddr[5] -hierPin my_uart paddr[5] -pin my_uart|prdata_i S[5] -pin my_uart|rx_data_ready1_i__0 I0[5] -pin my_uart|tx_start1_i__0 I0[5]
load net hrdata2_i_n_17 -attr @rip O[14] -pin hrdata1_i I1[14] -pin hrdata2_i O[14]
load net my_uart|prdata[18] -attr @rip(#000000) O[18] -attr @name prdata[18] -hierPin my_uart prdata[18] -pin my_uart|prdata_i__0 O[18]
load net my_uart|rx_pin -attr @name rx_pin -hierPin my_uart rx_pin -pin my_uart|my_raw_uart rx_pin
netloc my_uart|rx_pin 1 0 5 NJ 508 NJ 508 NJ 508 NJ 508 6450
load net hrdata_i2c[17] -attr @rip hrdata[17] -pin hrdata2_i I0[17] -pin my_i2c hrdata[17]
load net hrdata2_i_n_18 -attr @rip O[13] -pin hrdata1_i I1[13] -pin hrdata2_i O[13]
load net hrdata_pmu[31] -attr @rip hrdata[31] -pin hrdata1_i I0[31] -pin my_pmu hrdata[31]
load net pwdata[1] -attr @rip pwdata[1] -pin my_bridge pwdata[1] -pin my_uart pwdata[1]
load netBundle @hrdata0_i_n_0,hrdata0_i_n_1 32 hrdata0_i_n_0 hrdata0_i_n_1 hrdata0_i_n_2 hrdata0_i_n_3 hrdata0_i_n_4 hrdata0_i_n_5 hrdata0_i_n_6 hrdata0_i_n_7 hrdata0_i_n_8 hrdata0_i_n_9 hrdata0_i_n_10 hrdata0_i_n_11 hrdata0_i_n_12 hrdata0_i_n_13 hrdata0_i_n_14 hrdata0_i_n_15 hrdata0_i_n_16 hrdata0_i_n_17 hrdata0_i_n_18 hrdata0_i_n_19 hrdata0_i_n_20 hrdata0_i_n_21 hrdata0_i_n_22 hrdata0_i_n_23 hrdata0_i_n_24 hrdata0_i_n_25 hrdata0_i_n_26 hrdata0_i_n_27 hrdata0_i_n_28 hrdata0_i_n_29 hrdata0_i_n_30 hrdata0_i_n_31 -autobundled
netbloc @hrdata0_i_n_0,hrdata0_i_n_1 1 6 1 2190
load netBundle @hrdata_apb 32 hrdata_apb[31] hrdata_apb[30] hrdata_apb[29] hrdata_apb[28] hrdata_apb[27] hrdata_apb[26] hrdata_apb[25] hrdata_apb[24] hrdata_apb[23] hrdata_apb[22] hrdata_apb[21] hrdata_apb[20] hrdata_apb[19] hrdata_apb[18] hrdata_apb[17] hrdata_apb[16] hrdata_apb[15] hrdata_apb[14] hrdata_apb[13] hrdata_apb[12] hrdata_apb[11] hrdata_apb[10] hrdata_apb[9] hrdata_apb[8] hrdata_apb[7] hrdata_apb[6] hrdata_apb[5] hrdata_apb[4] hrdata_apb[3] hrdata_apb[2] hrdata_apb[1] hrdata_apb[0] -autobundled
netbloc @hrdata_apb 1 3 4 1190 460 1500J 580 NJ 580 2210J
load netBundle @hrdata2_i_n_0,hrdata2_i_n_1 32 hrdata2_i_n_0 hrdata2_i_n_1 hrdata2_i_n_2 hrdata2_i_n_3 hrdata2_i_n_4 hrdata2_i_n_5 hrdata2_i_n_6 hrdata2_i_n_7 hrdata2_i_n_8 hrdata2_i_n_9 hrdata2_i_n_10 hrdata2_i_n_11 hrdata2_i_n_12 hrdata2_i_n_13 hrdata2_i_n_14 hrdata2_i_n_15 hrdata2_i_n_16 hrdata2_i_n_17 hrdata2_i_n_18 hrdata2_i_n_19 hrdata2_i_n_20 hrdata2_i_n_21 hrdata2_i_n_22 hrdata2_i_n_23 hrdata2_i_n_24 hrdata2_i_n_25 hrdata2_i_n_26 hrdata2_i_n_27 hrdata2_i_n_28 hrdata2_i_n_29 hrdata2_i_n_30 hrdata2_i_n_31 -autobundled
netbloc @hrdata2_i_n_0,hrdata2_i_n_1 1 4 1 1500
load netBundle @hwdata 32 hwdata[31] hwdata[30] hwdata[29] hwdata[28] hwdata[27] hwdata[26] hwdata[25] hwdata[24] hwdata[23] hwdata[22] hwdata[21] hwdata[20] hwdata[19] hwdata[18] hwdata[17] hwdata[16] hwdata[15] hwdata[14] hwdata[13] hwdata[12] hwdata[11] hwdata[10] hwdata[9] hwdata[8] hwdata[7] hwdata[6] hwdata[5] hwdata[4] hwdata[3] hwdata[2] hwdata[1] hwdata[0] -autobundled
netbloc @hwdata 1 2 13 680 600 NJ 600 NJ 600 NJ 600 2190J 550 2460J 670 2810 430 NJ 430 3500 590 NJ 590 NJ 590 4340 500 4850
load netBundle @hrdata_pmu 32 hrdata_pmu[31] hrdata_pmu[30] hrdata_pmu[29] hrdata_pmu[28] hrdata_pmu[27] hrdata_pmu[26] hrdata_pmu[25] hrdata_pmu[24] hrdata_pmu[23] hrdata_pmu[22] hrdata_pmu[21] hrdata_pmu[20] hrdata_pmu[19] hrdata_pmu[18] hrdata_pmu[17] hrdata_pmu[16] hrdata_pmu[15] hrdata_pmu[14] hrdata_pmu[13] hrdata_pmu[12] hrdata_pmu[11] hrdata_pmu[10] hrdata_pmu[9] hrdata_pmu[8] hrdata_pmu[7] hrdata_pmu[6] hrdata_pmu[5] hrdata_pmu[4] hrdata_pmu[3] hrdata_pmu[2] hrdata_pmu[1] hrdata_pmu[0] -autobundled
netbloc @hrdata_pmu 1 4 8 1520 770 NJ 770 NJ 770 NJ 770 NJ 770 NJ 770 NJ 770 3810
load netBundle @paddr 32 paddr[31] paddr[30] paddr[29] paddr[28] paddr[27] paddr[26] paddr[25] paddr[24] paddr[23] paddr[22] paddr[21] paddr[20] paddr[19] paddr[18] paddr[17] paddr[16] paddr[15] paddr[14] paddr[13] paddr[12] paddr[11] paddr[10] paddr[9] paddr[8] paddr[7] paddr[6] paddr[5] paddr[4] paddr[3] paddr[2] paddr[1] paddr[0] -autobundled
netbloc @paddr 1 3 12 1130 150 NJ 150 NJ 150 NJ 150 NJ 150 NJ 150 NJ 150 NJ 150 NJ 150 NJ 150 NJ 150 5050J
load netBundle @hrdata 32 hrdata[31] hrdata[30] hrdata[29] hrdata[28] hrdata[27] hrdata[26] hrdata[25] hrdata[24] hrdata[23] hrdata[22] hrdata[21] hrdata[20] hrdata[19] hrdata[18] hrdata[17] hrdata[16] hrdata[15] hrdata[14] hrdata[13] hrdata[12] hrdata[11] hrdata[10] hrdata[9] hrdata[8] hrdata[7] hrdata[6] hrdata[5] hrdata[4] hrdata[3] hrdata[2] hrdata[1] hrdata[0] -autobundled
netbloc @hrdata 1 7 1 2480
load netBundle @hrdata_i2c 32 hrdata_i2c[31] hrdata_i2c[30] hrdata_i2c[29] hrdata_i2c[28] hrdata_i2c[27] hrdata_i2c[26] hrdata_i2c[25] hrdata_i2c[24] hrdata_i2c[23] hrdata_i2c[22] hrdata_i2c[21] hrdata_i2c[20] hrdata_i2c[19] hrdata_i2c[18] hrdata_i2c[17] hrdata_i2c[16] hrdata_i2c[15] hrdata_i2c[14] hrdata_i2c[13] hrdata_i2c[12] hrdata_i2c[11] hrdata_i2c[10] hrdata_i2c[9] hrdata_i2c[8] hrdata_i2c[7] hrdata_i2c[6] hrdata_i2c[5] hrdata_i2c[4] hrdata_i2c[3] hrdata_i2c[2] hrdata_i2c[1] hrdata_i2c[0] -autobundled
netbloc @hrdata_i2c 1 3 12 1150 730 NJ 730 NJ 730 NJ 730 NJ 730 NJ 730 NJ 730 NJ 730 NJ 730 NJ 730 4280J 800 4710
load netBundle @my_uart|rx_data_ready 2 my_uart|rx_data_ready my_uart|tx_active -autobundled
netbloc @my_uart|rx_data_ready 1 5 3 7140 478 NJ 478 7680
load netBundle @htrans 2 htrans[1] htrans[0] -autobundled
netbloc @htrans 1 1 14 NJ 650 640 710 NJ 710 NJ 710 NJ 710 NJ 710 NJ 710 2830 410 NJ 410 3480 570 NJ 570 NJ 570 4320 780 4810J
load netBundle @hrdata_ram 32 hrdata_ram[31] hrdata_ram[30] hrdata_ram[29] hrdata_ram[28] hrdata_ram[27] hrdata_ram[26] hrdata_ram[25] hrdata_ram[24] hrdata_ram[23] hrdata_ram[22] hrdata_ram[21] hrdata_ram[20] hrdata_ram[19] hrdata_ram[18] hrdata_ram[17] hrdata_ram[16] hrdata_ram[15] hrdata_ram[14] hrdata_ram[13] hrdata_ram[12] hrdata_ram[11] hrdata_ram[10] hrdata_ram[9] hrdata_ram[8] hrdata_ram[7] hrdata_ram[6] hrdata_ram[5] hrdata_ram[4] hrdata_ram[3] hrdata_ram[2] hrdata_ram[1] hrdata_ram[0] -autobundled
netbloc @hrdata_ram 1 3 1 1070
load netBundle @prdata 32 prdata[31] prdata[30] prdata[29] prdata[28] prdata[27] prdata[26] prdata[25] prdata[24] prdata[23] prdata[22] prdata[21] prdata[20] prdata[19] prdata[18] prdata[17] prdata[16] prdata[15] prdata[14] prdata[13] prdata[12] prdata[11] prdata[10] prdata[9] prdata[8] prdata[7] prdata[6] prdata[5] prdata[4] prdata[3] prdata[2] prdata[1] prdata[0] -autobundled
netbloc @prdata 1 2 14 660 10 NJ 10 NJ 10 NJ 10 NJ 10 NJ 10 NJ 10 NJ 10 NJ 10 NJ 10 NJ 10 NJ 10 NJ 10 8530
load netBundle @my_uart|rx_data_out 8 my_uart|rx_data_out[7] my_uart|rx_data_out[6] my_uart|rx_data_out[5] my_uart|rx_data_out[4] my_uart|rx_data_out[3] my_uart|rx_data_out[2] my_uart|rx_data_out[1] my_uart|rx_data_out[0] -autobundled
netbloc @my_uart|rx_data_out 1 5 3 7060 458 NJ 458 7680J
load netBundle @hrdata1_i_n_0,hrdata1_i_n_1 32 hrdata1_i_n_0 hrdata1_i_n_1 hrdata1_i_n_2 hrdata1_i_n_3 hrdata1_i_n_4 hrdata1_i_n_5 hrdata1_i_n_6 hrdata1_i_n_7 hrdata1_i_n_8 hrdata1_i_n_9 hrdata1_i_n_10 hrdata1_i_n_11 hrdata1_i_n_12 hrdata1_i_n_13 hrdata1_i_n_14 hrdata1_i_n_15 hrdata1_i_n_16 hrdata1_i_n_17 hrdata1_i_n_18 hrdata1_i_n_19 hrdata1_i_n_20 hrdata1_i_n_21 hrdata1_i_n_22 hrdata1_i_n_23 hrdata1_i_n_24 hrdata1_i_n_25 hrdata1_i_n_26 hrdata1_i_n_27 hrdata1_i_n_28 hrdata1_i_n_29 hrdata1_i_n_30 hrdata1_i_n_31 -autobundled
netbloc @hrdata1_i_n_0,hrdata1_i_n_1 1 5 1 1900
load netBundle @my_uart|tx_data_in 8 my_uart|tx_data_in[7] my_uart|tx_data_in[6] my_uart|tx_data_in[5] my_uart|tx_data_in[4] my_uart|tx_data_in[3] my_uart|tx_data_in[2] my_uart|tx_data_in[1] my_uart|tx_data_in[0] -autobundled
netbloc @my_uart|tx_data_in 1 4 1 6490
load netBundle @p_0_in,my_cpu_n_80 32 p_0_in[15] p_0_in[14] p_0_in[13] p_0_in[12] p_0_in[11] p_0_in[10] p_0_in[9] p_0_in[8] p_0_in[7] p_0_in[6] p_0_in[5] p_0_in[4] p_0_in[3] p_0_in[2] p_0_in[1] p_0_in[0] my_cpu_n_80 my_cpu_n_81 my_cpu_n_82 my_cpu_n_83 my_cpu_n_84 my_cpu_n_85 my_cpu_n_86 my_cpu_n_87 my_cpu_n_88 my_cpu_n_89 my_cpu_n_90 my_cpu_n_91 my_cpu_n_92 my_cpu_n_93 my_cpu_n_94 my_cpu_n_95 -autobundled
netbloc @p_0_in,my_cpu_n_80 1 0 15 20 330 NJ 330 620 920 NJ 920 1480 1050 1860J 1040 NJ 1040 NJ 1040 2850 350 NJ 350 3440 530 NJ 530 NJ 530 4360 760 4870J
load netBundle @my_uart|paddr 8 my_uart|paddr[7] my_uart|paddr[6] my_uart|paddr[5] my_uart|paddr[4] my_uart|paddr[3] my_uart|paddr[2] my_uart|paddr[1] my_uart|paddr[0] -autobundled
netbloc @my_uart|paddr 1 0 8 NJ 238 5380 528 NJ 528 5930 528 6390J 686 7060J 518 NJ 518 7700J
load netBundle @my_uart|my_raw_uart|rx_data 8 my_uart|my_raw_uart|rx_data[7] my_uart|my_raw_uart|rx_data[6] my_uart|my_raw_uart|rx_data[5] my_uart|my_raw_uart|rx_data[4] my_uart|my_raw_uart|rx_data[3] my_uart|my_raw_uart|rx_data[2] my_uart|my_raw_uart|rx_data[1] my_uart|my_raw_uart|rx_data[0] -autobundled
netbloc @my_uart|my_raw_uart|rx_data 1 1 1 N
load netBundle @pwdata 32 pwdata[31] pwdata[30] pwdata[29] pwdata[28] pwdata[27] pwdata[26] pwdata[25] pwdata[24] pwdata[23] pwdata[22] pwdata[21] pwdata[20] pwdata[19] pwdata[18] pwdata[17] pwdata[16] pwdata[15] pwdata[14] pwdata[13] pwdata[12] pwdata[11] pwdata[10] pwdata[9] pwdata[8] pwdata[7] pwdata[6] pwdata[5] pwdata[4] pwdata[3] pwdata[2] pwdata[1] pwdata[0] -autobundled
netbloc @pwdata 1 3 12 1210 210 NJ 210 NJ 210 NJ 210 NJ 210 NJ 210 NJ 210 NJ 210 NJ 210 NJ 210 NJ 210 4990J
load netBundle @my_uart|prdata_i_n_0 32 my_uart|prdata_i_n_0 my_uart|prdata_i_n_1 my_uart|prdata_i_n_2 my_uart|prdata_i_n_3 my_uart|prdata_i_n_4 my_uart|prdata_i_n_5 my_uart|prdata_i_n_6 my_uart|prdata_i_n_7 my_uart|prdata_i_n_8 my_uart|prdata_i_n_9 my_uart|prdata_i_n_10 my_uart|prdata_i_n_11 my_uart|prdata_i_n_12 my_uart|prdata_i_n_13 my_uart|prdata_i_n_14 my_uart|prdata_i_n_15 my_uart|prdata_i_n_16 my_uart|prdata_i_n_17 my_uart|prdata_i_n_18 my_uart|prdata_i_n_19 my_uart|prdata_i_n_20 my_uart|prdata_i_n_21 my_uart|prdata_i_n_22 my_uart|prdata_i_n_23 my_uart|prdata_i_n_24 my_uart|prdata_i_n_25 my_uart|prdata_i_n_26 my_uart|prdata_i_n_27 my_uart|prdata_i_n_28 my_uart|prdata_i_n_29 my_uart|prdata_i_n_30 my_uart|prdata_i_n_31 -autobundled
netbloc @my_uart|prdata_i_n_0 1 8 1 N
load netBundle @my_uart|my_raw_uart|tx_data 8 my_uart|my_raw_uart|tx_data[7] my_uart|my_raw_uart|tx_data[6] my_uart|my_raw_uart|tx_data[5] my_uart|my_raw_uart|tx_data[4] my_uart|my_raw_uart|tx_data[3] my_uart|my_raw_uart|tx_data[2] my_uart|my_raw_uart|tx_data[1] my_uart|my_raw_uart|tx_data[0] -autobundled
netbloc @my_uart|my_raw_uart|tx_data 1 0 1 N
load netBundle @hrdata_spi 32 hrdata_spi[31] hrdata_spi[30] hrdata_spi[29] hrdata_spi[28] hrdata_spi[27] hrdata_spi[26] hrdata_spi[25] hrdata_spi[24] hrdata_spi[23] hrdata_spi[22] hrdata_spi[21] hrdata_spi[20] hrdata_spi[19] hrdata_spi[18] hrdata_spi[17] hrdata_spi[16] hrdata_spi[15] hrdata_spi[14] hrdata_spi[13] hrdata_spi[12] hrdata_spi[11] hrdata_spi[10] hrdata_spi[9] hrdata_spi[8] hrdata_spi[7] hrdata_spi[6] hrdata_spi[5] hrdata_spi[4] hrdata_spi[3] hrdata_spi[2] hrdata_spi[1] hrdata_spi[0] -autobundled
netbloc @hrdata_spi 1 5 11 1920 840 NJ 840 NJ 840 NJ 840 NJ 840 NJ 840 NJ 840 4040J 880 4320J 900 4710J 1588 8430
load netBundle @my_uart|pwdata 8 my_uart|pwdata[7] my_uart|pwdata[6] my_uart|pwdata[5] my_uart|pwdata[4] my_uart|pwdata[3] my_uart|pwdata[2] my_uart|pwdata[1] my_uart|pwdata[0] -autobundled
netbloc @my_uart|pwdata 1 0 4 5190J 88 NJ 88 NJ 88 5930
load netBundle @my_uart|prdata 32 my_uart|prdata[31] my_uart|prdata[30] my_uart|prdata[29] my_uart|prdata[28] my_uart|prdata[27] my_uart|prdata[26] my_uart|prdata[25] my_uart|prdata[24] my_uart|prdata[23] my_uart|prdata[22] my_uart|prdata[21] my_uart|prdata[20] my_uart|prdata[19] my_uart|prdata[18] my_uart|prdata[17] my_uart|prdata[16] my_uart|prdata[15] my_uart|prdata[14] my_uart|prdata[13] my_uart|prdata[12] my_uart|prdata[11] my_uart|prdata[10] my_uart|prdata[9] my_uart|prdata[8] my_uart|prdata[7] my_uart|prdata[6] my_uart|prdata[5] my_uart|prdata[4] my_uart|prdata[3] my_uart|prdata[2] my_uart|prdata[1] my_uart|prdata[0] -autobundled
netbloc @my_uart|prdata 1 9 1 8270
levelinfo -pg 1 0 260 450 900 1360 1720 2050 2340 2640 3090 3290 3630 3900 4130 4550 5160 8570 -top 0 -bot 1600
levelinfo -hier my_uart * 5280 5490 5770 6120 6610 7320 7500 7880 8150 *
levelinfo -hier my_uart|my_raw_uart * 6760 *
show
zoom 1.16083
scrollpos 6425 254
#
# initialize ictrl to current module soc_top work:soc_top:NOFILE
ictrl init topinfo |

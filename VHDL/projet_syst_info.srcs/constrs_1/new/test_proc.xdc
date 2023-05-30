# Cheat sheet :

# Switches:
# R2, T1, U1, W2, R3, T2, T3, V2, W13, W14, V15, W15, W17, W16, V16, V17
# Buttons:
# T18, W19, U18, T17, U17
# LEDs:
# L1, P1, N3, P3, U3, W3, V3, V13, V14, U14, U15, W18, V19, U19, E19, U16
#Horloge sur un bouton

set_property -dict {PACKAGE_PIN W5 IOSTANDARD LVCMOS33} [get_ports CLK_STD]
create_clock -period 10.000 -name sysclk_pin -waveform {0.000 5.000} [get_ports CLK_STD]

#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets CLK_PRINT]
#set_property -dict {PACKAGE_PIN W19 IOSTANDARD LVCMOS33} [get_ports CLK_PRINT]

#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets CLK]
#set_property -dict {PACKAGE_PIN T17 IOSTANDARD LVCMOS33} [get_ports CLK]




 #set_property -dicset_property -dict {PACKAGE_PIN W5 IOSTANDARD LVCMOS33} [get_ports CLK]



set_property -dict {PACKAGE_PIN R2 IOSTANDARD LVCMOS33} [get_ports {MEM_ADDR[7]}]
set_property -dict {PACKAGE_PIN T1 IOSTANDARD LVCMOS33} [get_ports {MEM_ADDR[6]}]
set_property -dict {PACKAGE_PIN U1 IOSTANDARD LVCMOS33} [get_ports {MEM_ADDR[5]}]
set_property -dict {PACKAGE_PIN W2 IOSTANDARD LVCMOS33} [get_ports {MEM_ADDR[4]}]
set_property -dict {PACKAGE_PIN R3 IOSTANDARD LVCMOS33} [get_ports {MEM_ADDR[3]}]
set_property -dict {PACKAGE_PIN T2 IOSTANDARD LVCMOS33} [get_ports {MEM_ADDR[2]}]
set_property -dict {PACKAGE_PIN T3 IOSTANDARD LVCMOS33} [get_ports {MEM_ADDR[1]}]
set_property -dict {PACKAGE_PIN V2 IOSTANDARD LVCMOS33} [get_ports {MEM_ADDR[0]}]



set_property -dict {PACKAGE_PIN W13 IOSTANDARD LVCMOS33} [get_ports {REG_ADDR[7]}]
set_property -dict {PACKAGE_PIN W14 IOSTANDARD LVCMOS33} [get_ports {REG_ADDR[6]}]
set_property -dict {PACKAGE_PIN V15 IOSTANDARD LVCMOS33} [get_ports {REG_ADDR[5]}]
set_property -dict {PACKAGE_PIN W15 IOSTANDARD LVCMOS33} [get_ports {REG_ADDR[4]}]
set_property -dict {PACKAGE_PIN W17 IOSTANDARD LVCMOS33} [get_ports {REG_ADDR[3]}]
set_property -dict {PACKAGE_PIN W16 IOSTANDARD LVCMOS33} [get_ports {REG_ADDR[2]}]
set_property -dict {PACKAGE_PIN V16 IOSTANDARD LVCMOS33} [get_ports {REG_ADDR[1]}]
set_property -dict {PACKAGE_PIN V17 IOSTANDARD LVCMOS33} [get_ports {REG_ADDR[0]}]



set_property -dict {PACKAGE_PIN L1 IOSTANDARD LVCMOS33} [get_ports {MEM_VAL[7]}]
set_property -dict {PACKAGE_PIN P1 IOSTANDARD LVCMOS33} [get_ports {MEM_VAL[6]}]
set_property -dict {PACKAGE_PIN N3 IOSTANDARD LVCMOS33} [get_ports {MEM_VAL[5]}]
set_property -dict {PACKAGE_PIN P3 IOSTANDARD LVCMOS33} [get_ports {MEM_VAL[4]}]
set_property -dict {PACKAGE_PIN U3 IOSTANDARD LVCMOS33} [get_ports {MEM_VAL[3]}]
set_property -dict {PACKAGE_PIN W3 IOSTANDARD LVCMOS33} [get_ports {MEM_VAL[2]}]
set_property -dict {PACKAGE_PIN V3 IOSTANDARD LVCMOS33} [get_ports {MEM_VAL[1]}]
set_property -dict {PACKAGE_PIN V13 IOSTANDARD LVCMOS33} [get_ports {MEM_VAL[0]}]



set_property -dict {PACKAGE_PIN V14 IOSTANDARD LVCMOS33} [get_ports {REG_VAL[7]}]
set_property -dict {PACKAGE_PIN U14 IOSTANDARD LVCMOS33} [get_ports {REG_VAL[6]}]
set_property -dict {PACKAGE_PIN U15 IOSTANDARD LVCMOS33} [get_ports {REG_VAL[5]}]
set_property -dict {PACKAGE_PIN W18 IOSTANDARD LVCMOS33} [get_ports {REG_VAL[4]}]
set_property -dict {PACKAGE_PIN V19 IOSTANDARD LVCMOS33} [get_ports {REG_VAL[3]}]
set_property -dict {PACKAGE_PIN U19 IOSTANDARD LVCMOS33} [get_ports {REG_VAL[2]}]
set_property -dict {PACKAGE_PIN E19 IOSTANDARD LVCMOS33} [get_ports {REG_VAL[1]}]
set_property -dict {PACKAGE_PIN U16 IOSTANDARD LVCMOS33} [get_ports {REG_VAL[0]}]



set_property -dict {PACKAGE_PIN W7 IOSTANDARD LVCMOS33} [get_ports {DISPLAY[6]}]
set_property -dict {PACKAGE_PIN W6 IOSTANDARD LVCMOS33} [get_ports {DISPLAY[5]}]
set_property -dict {PACKAGE_PIN U8 IOSTANDARD LVCMOS33} [get_ports {DISPLAY[4]}]
set_property -dict {PACKAGE_PIN V8 IOSTANDARD LVCMOS33} [get_ports {DISPLAY[3]}]
set_property -dict {PACKAGE_PIN U5 IOSTANDARD LVCMOS33} [get_ports {DISPLAY[2]}]
set_property -dict {PACKAGE_PIN V5 IOSTANDARD LVCMOS33} [get_ports {DISPLAY[1]}]
set_property -dict {PACKAGE_PIN U7 IOSTANDARD LVCMOS33} [get_ports {DISPLAY[0]}]

set_property -dict {PACKAGE_PIN U2 IOSTANDARD LVCMOS33} [get_ports {AN[0]}]
set_property -dict {PACKAGE_PIN U4 IOSTANDARD LVCMOS33} [get_ports {AN[1]}]
set_property -dict {PACKAGE_PIN V4 IOSTANDARD LVCMOS33} [get_ports {AN[2]}]
set_property -dict {PACKAGE_PIN W4 IOSTANDARD LVCMOS33} [get_ports {AN[3]}]



#create_clock -period 30.303 -name CLK_PRINT -waveform {0.000 15.152} [get_ports CLK_PRINT]

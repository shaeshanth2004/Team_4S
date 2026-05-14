## BASYS3 constraints for Nano_processor top module
## Top entity: Nano_processor

## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

## Reset button - btnC
set_property PACKAGE_PIN U18 [get_ports Reset]
set_property IOSTANDARD LVCMOS33 [get_ports Reset]

## R7 output LEDs LD0-LD3
set_property PACKAGE_PIN U16 [get_ports {Reg7_led[0]}]
set_property PACKAGE_PIN E19 [get_ports {Reg7_led[1]}]
set_property PACKAGE_PIN U19 [get_ports {Reg7_led[2]}]
set_property PACKAGE_PIN V19 [get_ports {Reg7_led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Reg7_led[*]}]

## Status LEDs
set_property PACKAGE_PIN N3 [get_ports overflow_led]
set_property PACKAGE_PIN P1 [get_ports zero_led]
set_property PACKAGE_PIN L1 [get_ports carry_led]
set_property IOSTANDARD LVCMOS33 [get_ports {overflow_led zero_led carry_led}]

## 7-segment display segments: Reg7_digit(0)=a ... Reg7_digit(6)=g
set_property PACKAGE_PIN W7 [get_ports {Reg7_digit[0]}]
set_property PACKAGE_PIN W6 [get_ports {Reg7_digit[1]}]
set_property PACKAGE_PIN U8 [get_ports {Reg7_digit[2]}]
set_property PACKAGE_PIN V8 [get_ports {Reg7_digit[3]}]
set_property PACKAGE_PIN U5 [get_ports {Reg7_digit[4]}]
set_property PACKAGE_PIN V5 [get_ports {Reg7_digit[5]}]
set_property PACKAGE_PIN U7 [get_ports {Reg7_digit[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Reg7_digit[*]}]

## 7-segment anodes
set_property PACKAGE_PIN U2 [get_ports {Anode[0]}]
set_property PACKAGE_PIN U4 [get_ports {Anode[1]}]
set_property PACKAGE_PIN V4 [get_ports {Anode[2]}]
set_property PACKAGE_PIN W4 [get_ports {Anode[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {Anode[*]}]

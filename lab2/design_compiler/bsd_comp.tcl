set link_library *
#set target_library [list class.db ]
set synthetic_library \
[list dw_foundation.sldb ]
set link_library [concat $link_library \
$synthetic_library $target_library]

#Read in top-level design
read_verilog ./src/gcd_bsd_scan.v
read_verilog ./src/02-TOP.v
set current_design TOP
link

#dont_touch CORE and pads
set_dont_touch [list gcd_bsd GTECH_INBUF GTECH_OUTBUF]

#read pin map for BSR cell order
read_pin_map ./src/03-pin.txt

#define Tap signals
set_dft_signal -view spec -type TCK -port TCK
set_dft_signal -view spec -type TDI -port TDI
set_dft_signal -view spec -type TDO -port TDO
set_dft_signal -view spec -type TMS -port TMS
set_dft_signal -view spec -type TRST -port TRSTN

#the hook up pin connects the TDI chain to the test_si
set_dft_signal -view spec -type tdi -hookup_pin core/test_si
set_dft_signal -view spec -type tdo -hookup_pin core/test_so
set_dft_signal -view spec -type bsd_shift_en -hookup_pin core/test_se
set_dft_signal -view spec -type capture_clk -hookup_pin core/clk
set_scan_path STT_REG -class bsd -view spec -hookup {BSR_SI BSR_SO core/test_si core/test_so core/test_se core/clk} -exact_length 34

#define functional clocks
create_clock CLK -period 100 -waveform {0 50}

#Configure tap
set_bsd_configuration -ir_width 4

#Define standard instructions
#opcodes: extest= 0010, sample & preload=0100, bypass=1111
set_bsd_instruction -view spec [list EXTEST] -code [list 0001] -reg BOUNDARY
set_bsd_instruction -view spec [list SAMPLE] -code [list 0100] -reg BOUNDARY
set_bsd_instruction -view spec [list PRELOAD] -code [list 0100] -reg BOUNDARY
set_bsd_instruction -view spec [list BYPASS] -code [list 1111] -reg BYPASS

#Define instructions for CLAMP [opcode=0010]
set_bsd_instruction -view spec [list CLAMP] -code [list 0010] -reg BYPASS
set_bsd_instruction SCANCH -register [list STT_REG] -code [list 1101]

#Define compliance enable signals for TEST_MODE=1; RESETN=1
#switched these two from 11
set_bsd_compliance -name P1 -pattern {TEST_SE 1 RST 0} 


#sets unique identification code for the chip
set_bsd_instruction IDCODE -register DEVICE_ID -code 0111 -capture_value {32'b00000000000000000000000000000111}

#Enable bsd-insertion
set_dft_configuration -bsd enable -scan disable

#Run preview
preview_dft -bsd all

#insert jtag..includes compile
insert_dft

#OPTIONAL: Generate bsd patterns & bsdl before compliance checking
#create_bsd_patterns -type all
#write_test -format stil_testbench -output bsd_patterns
#write_test -format verilog -output ./src/BSD_tb.v
#write_bsdl -out TOP_bsd.bsdl

#Compliance checking
#set_bsd_instruction -view spec [list EXTEST] -code [list 0001] -reg BOUNDARY
#set_bsd_instruction
check_bsd -verbose

#Generate bsdl file
write_bsdl -out ./src/TOP_bsd.bsdl

#Generate bsd patterns
create_bsd_patterns -type all
write_test -format stil -output ./src/bsd_patterns

# generate verilog TAP testbench
write_test -format verilog -output ./src/BSD_tb

#write out jtag-inserted netlist
write -format ddc -hierarchy -output ./src/TOP_bsd.ddc
change_names -rules verilog -hier
write -format verilog -hierarchy -output ./src/TOP_bsd.v

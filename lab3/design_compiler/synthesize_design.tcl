# Setup GUI, work and build folder
gui_start
sh rm -rf WORK build
sh mkdir WORK
sh mkdir build
define_design_lib WORK -path ./WORK

# Bring in source verilog files
analyze -library WORK -format vhdl {./src/09-GCD.vhdl}
elaborate GCD_BSD -architecture GCD_BSD_ARC -library DEFAULT

# Run the steps detailed in 01-lab2_synopsis_dc.pdf
link
create_clock clk -period 40 -waveform {0 20}
set_clock_latency 0.3 clk
set_input_delay 2.0 -clock clk [all_inputs]
set_output_delay 1.65 -clock clk [all_outputs]
set_load 0.1 [all_outputs]
set_max_fanout 1 [all_inputs]
set_fanout_load 8 [all_outputs]
set_max_area 0
report_port
check_design
uplevel #0 check_design
compile -exact_map
uplevel #0 { report_timing -path full -delay max -nworst 1 -max_paths 1 -significant_digits 2 -sort_by group }
uplevel #0 { report_cell }
uplevel #0 { report_area }
uplevel #0 { report_power -analysis_effort low }

# Save the synthesized file
write -hierarchy -format verilog -output ~/test-power/lab2/design_compiler/build/GCD_syn.v

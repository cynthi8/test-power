# Compile needed files into work
vlib work
vlog -reportprogress 300 -work work ../source_design/*.v 
vcom -reportprogress 300 -work work ../source_design/*.vhdl

# Enter Simulation Mode
vsim work.gcd_tb

# Setup VCD file
vcd file gcd_rtl.vcd
vcd add /gcd_tb/*

# Run Simulation
add wave -position end sim:/gcd_tb/*
run -all
wave zoom full
view wave
quit

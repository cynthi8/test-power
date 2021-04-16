# Compile needed files into work
vlib work
vlog -reportprogress 300 -work work ../source_design/gcd_tb.v
vcom -reportprogress 300 -work work ../source_design/09-GCD.vhdl

# Enter Simulation Mode
vsim work.gcd_tb

# Setup VCD file
vcd file gcd_rtl.vcd
vcd add /gcd_tb/uut/*

# Run Simulation
add wave -position end sim:/gcd_tb/*
run -all
wave zoom full
view wave
quit

# Compile needed files into work
vlib work
vcom -reportprogress 300 -work work *.vhdl
vlog -reportprogress 300 -work work *.v 
vlog -reportprogress 300 -work work ../../saed90nm_typ_ht_verilog/*

# Run Simulation
vsim work.top_tb
add wave -position end sim:/top_tb/*
run -all
wave zoom full
view wave

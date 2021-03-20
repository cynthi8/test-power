# Compile needed files into work
vlib work
vlog -reportprogress 300 -work work *.v 
vlog -reportprogress 300 -work work ../../saed90nm_typ_ht_verilog/*

# Run Simulation
vsim work.top_tb
add wave -position end sim:/top_tb/*
add wave -position end  sim:/top_tb/uut/TOP_DW_tap_inst/instructions
add wave -position end  sim:/top_tb/uut/TOP_bypass_sel

run -all
wave zoom full
view wave

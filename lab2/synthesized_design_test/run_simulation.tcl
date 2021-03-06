# Compile needed files into work
vlib work
vlog -reportprogress 300 -work work *.v 
vlog -reportprogress 300 -work work ../../saed90nm_typ_ht_verilog/*

# Run Simulation
vsim work.gcd_tb
add wave -position end sim:/gcd_tb/*
run -all
wave zoom full
view wave

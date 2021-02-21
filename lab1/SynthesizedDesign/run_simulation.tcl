# Compile needed files into work
vlib work
vlog -reportprogress 300 -work work sqrt_vlsi_syn.v
vlog -reportprogress 300 -work work ../Modelsim/sqrt_all_tb.v
vlog -reportprogress 300 -work work ../../saed90nm_typ_ht_verilog/*

# Run Simulation
vsim work.sqrt_tb
add wave -position end sim:/sqrt_tb/*
run -all

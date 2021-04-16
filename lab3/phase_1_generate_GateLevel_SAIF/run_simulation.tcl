# Compile needed files into work
vlib work
vlog -reportprogress 300 -work work ../source_design/gcd_tb.v
vlog -reportprogress 300 -work work ../phase_1_design_compiler/src/gcd_syn.v
vlog -reportprogress 300 -work work ../../saed90nm_typ_ht_verilog/*

# Enter Simulation Mode
vsim work.gcd_tb

# Setup VCD file
vcd file gcd_gate_level.vcd
vcd add /gcd_tb/uut/*

# Run Simulation
add wave -position end sim:/gcd_tb/*
run -all
wave zoom full
view wave
quit

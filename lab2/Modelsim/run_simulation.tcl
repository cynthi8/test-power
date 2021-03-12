# Compile needed files into work
vlib work
vlog -reportprogress 300 -work work *.v

# Run Simulation
vsim work.sqrt_tb
add wave -position end sim:/sqrt_tb/*
run -all

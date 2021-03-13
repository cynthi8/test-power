# Compile needed files into work
vlib work
vlog -reportprogress 300 -work work *.v 
vcom -reportprogress 300 -work work *.vhdl

# Run Simulation
vsim work.gcd_tb
add wave -position end sim:/gcd_tb/*
#add wave -position end sim:/gcd_tb/uut/TOFSM/*
run -all
wave zoom full

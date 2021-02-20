# Map to the compiled saed90nm library
vmap saed90nm_typ_ht_verilog_lib ../../saed90nm_typ_ht_verilog_lib

# Create work library
vlib work

# Compile synthesized design and testbench to work
vlog -reportprogress 300 -work work sqrt_vlsi_syn.v
vlog -reportprogress 300 -work work ../Modelsim/sqrt_all_tb.v

# Run testbench simulation with the compiled library included
vsim work.sqrt_tb -L saed90nm_typ_ht_verilog_lib



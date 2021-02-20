vmap saed90nm_tup_ht_verilog_lib ../../saed90nm_typ_ht_verilog_lib

vlib work

vlog -reportprogress 300 -work work sqrt_vlsi_syn.v
vlog -reportprogress 300 -work work sqrt_all_tb.v

vsim work.sqrt_tb -L saed90nm_typ_ht_verilog_lib

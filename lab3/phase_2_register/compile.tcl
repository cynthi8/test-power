read_file -format verilog ../source_design/register.v
create_clock clk -period 25
compile_ultra -gate_clock
start_gui


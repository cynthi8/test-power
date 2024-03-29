###################################################################

# Created by write_sdc on Thu Apr 15 23:21:50 2021

###################################################################
set sdc_version 2.1

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current uA
set_max_area 0
set_driving_cell -lib_cell INVX1 -library saed90nm_typ_ht [get_ports rst]
set_driving_cell -lib_cell INVX1 -library saed90nm_typ_ht [get_ports clk]
set_driving_cell -lib_cell INVX1 -library saed90nm_typ_ht [get_ports go_i]
set_driving_cell -lib_cell INVX1 -library saed90nm_typ_ht [get_ports {x_i[3]}]
set_driving_cell -lib_cell INVX1 -library saed90nm_typ_ht [get_ports {x_i[2]}]
set_driving_cell -lib_cell INVX1 -library saed90nm_typ_ht [get_ports {x_i[1]}]
set_driving_cell -lib_cell INVX1 -library saed90nm_typ_ht [get_ports {x_i[0]}]
set_driving_cell -lib_cell INVX1 -library saed90nm_typ_ht [get_ports {y_i[3]}]
set_driving_cell -lib_cell INVX1 -library saed90nm_typ_ht [get_ports {y_i[2]}]
set_driving_cell -lib_cell INVX1 -library saed90nm_typ_ht [get_ports {y_i[1]}]
set_driving_cell -lib_cell INVX1 -library saed90nm_typ_ht [get_ports {y_i[0]}]
set_fanout_load 8 [get_ports {d_o[3]}]
set_fanout_load 8 [get_ports {d_o[2]}]
set_fanout_load 8 [get_ports {d_o[1]}]
set_fanout_load 8 [get_ports {d_o[0]}]
set_load -pin_load 0.1 [get_ports {d_o[3]}]
set_load -pin_load 0.1 [get_ports {d_o[2]}]
set_load -pin_load 0.1 [get_ports {d_o[1]}]
set_load -pin_load 0.1 [get_ports {d_o[0]}]
set_max_fanout 1 [get_ports rst]
set_max_fanout 1 [get_ports clk]
set_max_fanout 1 [get_ports go_i]
set_max_fanout 1 [get_ports {x_i[3]}]
set_max_fanout 1 [get_ports {x_i[2]}]
set_max_fanout 1 [get_ports {x_i[1]}]
set_max_fanout 1 [get_ports {x_i[0]}]
set_max_fanout 1 [get_ports {y_i[3]}]
set_max_fanout 1 [get_ports {y_i[2]}]
set_max_fanout 1 [get_ports {y_i[1]}]
set_max_fanout 1 [get_ports {y_i[0]}]
create_clock [get_ports clk]  -period 25  -waveform {0 12.5}
set_clock_latency 0.3  [get_clocks clk]
set_clock_transition -min -fall 0 [get_clocks clk]
set_clock_transition -min -rise 0 [get_clocks clk]
set_clock_transition -max -fall 0 [get_clocks clk]
set_clock_transition -max -rise 0 [get_clocks clk]
set_input_delay -clock clk  2  [get_ports clk]
set_input_delay -clock clk  2  [get_ports rst]
set_input_delay -clock clk  2  [get_ports go_i]
set_input_delay -clock clk  2  [get_ports {x_i[3]}]
set_input_delay -clock clk  2  [get_ports {x_i[2]}]
set_input_delay -clock clk  2  [get_ports {x_i[1]}]
set_input_delay -clock clk  2  [get_ports {x_i[0]}]
set_input_delay -clock clk  2  [get_ports {y_i[3]}]
set_input_delay -clock clk  2  [get_ports {y_i[2]}]
set_input_delay -clock clk  2  [get_ports {y_i[1]}]
set_input_delay -clock clk  2  [get_ports {y_i[0]}]
set_output_delay -clock clk  1.65  [get_ports {d_o[3]}]
set_output_delay -clock clk  1.65  [get_ports {d_o[2]}]
set_output_delay -clock clk  1.65  [get_ports {d_o[1]}]
set_output_delay -clock clk  1.65  [get_ports {d_o[0]}]
set_clock_gating_check -rise -setup 0 [get_cells                               \
Y_REG_clk_gate_output_reg/main_gate]
set_clock_gating_check -fall -setup 0 [get_cells                               \
Y_REG_clk_gate_output_reg/main_gate]
set_clock_gating_check -rise -hold 0 [get_cells                                \
Y_REG_clk_gate_output_reg/main_gate]
set_clock_gating_check -fall -hold 0 [get_cells                                \
Y_REG_clk_gate_output_reg/main_gate]
set_clock_gating_check -rise -setup 0 [get_cells                               \
X_REG_clk_gate_output_reg/main_gate]
set_clock_gating_check -fall -setup 0 [get_cells                               \
X_REG_clk_gate_output_reg/main_gate]
set_clock_gating_check -rise -hold 0 [get_cells                                \
X_REG_clk_gate_output_reg/main_gate]
set_clock_gating_check -fall -hold 0 [get_cells                                \
X_REG_clk_gate_output_reg/main_gate]
set_clock_gating_check -rise -setup 0 [get_cells                               \
OUT_REG_clk_gate_output_reg/main_gate]
set_clock_gating_check -fall -setup 0 [get_cells                               \
OUT_REG_clk_gate_output_reg/main_gate]
set_clock_gating_check -rise -hold 0 [get_cells                                \
OUT_REG_clk_gate_output_reg/main_gate]
set_clock_gating_check -fall -hold 0 [get_cells                                \
OUT_REG_clk_gate_output_reg/main_gate]

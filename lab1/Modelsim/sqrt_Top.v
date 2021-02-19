
module sqrt_Top(start, clk, clear, num, result, ready);
	 input start, clk, clear;
	 input [6:0] num;
	 output [3:0] result;
	 output ready;
	 
	 wire finish, load_data,incr_delta, find_next_sq;
	 
	 sqrt_controller m1(start, finish, clk, clear, ready, load_data, incr_delta, find_next_sq);
	 sqrt_data_path m2(num, load_data, incr_delta, find_next_sq, clk, finish, result, clear);
    
endmodule
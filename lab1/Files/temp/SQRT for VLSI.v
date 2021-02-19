module sqrt_data_path(num, load_data, incr_delta, find_next_sq, clk, finish, result
    );
  input load_data, incr_delta, find_next_sq, clk;
  input [6:0] num;
  output reg finish;
  output [3:0] result;
  
  reg [6:0] Rn = 1, Rdata;
  reg [4:0] Rdelta = 3;
  
  always @(posedge clk)
  begin
  
    if (load_data) Rdata = num;
    if (incr_delta) Rdelta = Rdelta + 2;
    if (find_next_sq) Rn = Rn + Rdelta;
    if (Rn >= Rdata) finish = 1; else
	             finish = 0;
  end
  
  assign result = (Rdelta >>> 1);

endmodule

//-----------------------------------------------------------

module sqrt_controller(start, finish, clk, clear, ready, load_data,
       incr_delta, find_next_sq
    );
  input start, finish, clk, clear;
  output reg ready, load_data,incr_delta, find_next_sq;
  parameter S0=0, S1=1, S2=2, S3=3;
  reg [1:0] state, next_state;
  
  
  always @(posedge clk, posedge clear)
    if (clear) state = S0; else
	            state = next_state;
  
  always @(state, start, finish)
  begin
    load_data = 0;
	 find_next_sq = 0;
	 incr_delta = 0;
	 ready = 0;
	 case (state)
	   S0: begin
		     ready = 1;
			    if (start) begin
		         next_state = S1;
			      load_data = 1; 
			    end else
			    next_state = S0;
			  end
			  
	   S1: next_state = S2;
		
		S2: if (~finish) begin
		     next_state = S3;
			  find_next_sq = 1;
			 end else
			  next_state = S0;
			  
	   S3: begin
		     next_state = S2;
			  incr_delta = 1;
			 end
	 endcase
  end
endmodule

//----------------


module sqrt_Top(start, clk, clear, num, result, ready
    );
	 input start, clk, clear;
	 input [6:0] num;
	 output [3:0] result;
	 output ready;
	 
	 wire finish, load_data,incr_delta, find_next_sq;
	 
	 sqrt_controller m1(start, finish, clk, clear, ready, load_data,
                      incr_delta, find_next_sq);
	 sqrt_data_path m2(num, load_data, incr_delta, find_next_sq, clk, finish, result);
    
endmodule

//-------------------------------------



module sqrt_controller(start, finish, clk, clear, ready, load_data,
       incr_delta, find_next_sq
    );
  input start, finish, clk, clear;
  output reg ready, load_data,incr_delta, find_next_sq;
  parameter S0=0, S1=1, S2=2, S3=3;
  reg [1:0] state, next_state;
  
  
  always @(posedge clk, posedge clear) begin
    if (clear) begin 	
        state = S0; 
    end else begin	
        state = next_state;
    end
  end

  always @(state, start, finish)
  begin
    load_data = 0;
	find_next_sq = 0;
	incr_delta = 0;
	ready = 0;
	case (state)
	   S0: 	begin
		ready = 1;
		if (start) begin
		    next_state = S1;
			load_data = 1; 
		end else
			next_state = S0;
		end
			  
	   S1: 	next_state = S2;
		
	   S2: 	if (~finish) begin
		    next_state = S3;
			find_next_sq = 1;
		end else
			next_state = S0;
			  
	   S3: 	begin
		    next_state = S2;
			incr_delta = 1;
		end
	endcase
  end
endmodule

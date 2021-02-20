
module sqrt_data_path(num, load_data, incr_delta, find_next_sq, clk, finish, result, clear);
  input load_data, incr_delta, find_next_sq, clk, clear;
  input [6:0] num;
  output reg finish;
  output [3:0] result;
  
  reg [6:0] Rn, Rdata;
  reg [4:0] Rdelta;
  
  always @(posedge clk, posedge clear) begin
    if (clear) begin
      	Rn = 1;
      	Rdelta = 3;
        finish = 0;
    end else begin
        if (load_data)    Rdata = num;
        if (incr_delta)   Rdelta = Rdelta + 2;
        if (find_next_sq) Rn = Rn + Rdelta;
        if (Rn >= Rdata)  begin
            finish = 1;
        end else begin
            finish = 0;
        end
    end
  end
  
  assign result = (Rdelta >>> 1);

endmodule

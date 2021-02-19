module sqrt_tb();
  integer increment;
  reg start, clk, clear;
  reg [6:0] num;
  wire ready;
  wire [3:0] result;

  sqrt_Top a1(start, clk, clear, num, result, ready);

  initial begin
    increment = 0;
    clk = 0;
    start = 0;
    clear = 1;
    num = 1;
    #10; 
    start = 1;
    clear = 0;
  end

  always #1 clk = ~clk;

  always @(posedge ready) begin
    if(increment>=11) begin
	increment = 0;
	num = 1;
	clear = 1; 
	#10 clear = 0;
    end
    increment = increment + 1;
    num = increment*increment;
  end

endmodule

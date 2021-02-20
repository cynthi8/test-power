`timescale 1ns/1ps
module sqrt_tb();
  //integer answer;
  reg [6:0] answer = 0;
  reg start, clk, clear;
  reg [6:0] num = 0;
  wire ready;
  wire [3:0] result = 0;

  sqrt_Top a1(start, clk, clear, num, result, ready);

  initial begin
    // Initialize
    clk = 0;
    start = 0;
    clear = 1;
    #10;
    // Start test for sqrt(1)
    start = 1;
    clear = 0;
    answer = 1;
    num = answer*answer;
  end

  always #1 clk = ~clk;

  always @(posedge ready) begin
    // Check results of last test
    if(result != answer)
        $display("test failed for answer=", answer);
    clear = 1;
    #2;
    // Start test for next sqrt
    clear = 0;
    answer = answer + 1;
    num = answer*answer;
    
    if(answer>11) begin
        $display("Simulation Complete");
        $stop;
    end
  end

endmodule

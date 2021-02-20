`timescale 1ns/1ps
module sqrt_tb();
  integer answer;
  reg start, clk, clear;
  reg [6:0] num;
  wire ready;
  wire [3:0] result;

  sqrt_Top a1(start, clk, clear, num, result, ready);

  parameter period = 40;

  initial begin
    // Initialize
    clk = 0;
    start = 0;
    clear = 1;
    // Setup sqrt(1) test
    answer = 1;
    num = answer*answer;
    #(10 * period);
    // Start test
    start = 1;
    clear = 0;
    #(2 * period);
    start = 0;
  end

  always #(period/2) clk = ~clk;

  always @(negedge clk) begin
    if(ready) begin
        // Check results of last test
        if(result != answer)
            $display("%0t test failed for answer=", $time,  answer);
        #(2 * period);
        // Clean and setup test for next sqrt
        clear = 1;
        answer = answer + 1;
        num = answer*answer;
        if(answer>11) begin
            $display("Simulation Complete");
            $stop;
        end
        #(2 * period);
        // Start test
        start = 1;
        clear = 0;
        #(2 * period);
        start = 0;
    end
  end

endmodule

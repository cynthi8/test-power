module register ( rst, clk, load, d, q);
  input [3:0] d;
  input rst, clk, load;
  output reg [3:0] q;

  always @(posedge clk)
     if (rst) begin
        q <= 4'b0000;
     end else if (load) begin
        q <= d;
     end else begin
        q <= q;
     end

endmodule

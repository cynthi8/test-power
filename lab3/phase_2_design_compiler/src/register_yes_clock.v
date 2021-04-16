/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Thu Apr 15 22:01:19 2021
/////////////////////////////////////////////////////////////


module SNPS_CLOCK_GATE_HIGH_register ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   net303, n1;

  AND2X1 main_gate ( .IN1(net303), .IN2(CLK), .Q(ENCLK) );
  LATCHX1 latch ( .CLK(n1), .D(EN), .Q(net303) );
  INVX0 U2 ( .INP(CLK), .ZN(n1) );
endmodule


module register ( rst, clk, load, d, q );
  input [3:0] d;
  output [3:0] q;
  input rst, clk, load;
  wire   N1, net309, n3, n4, n5, n6, n7;

  SNPS_CLOCK_GATE_HIGH_register clk_gate_q_reg ( .CLK(clk), .EN(N1), .ENCLK(
        net309) );
  DFFX1 q_reg_3_ ( .D(n7), .CLK(net309), .Q(q[3]) );
  DFFX1 q_reg_2_ ( .D(n6), .CLK(net309), .Q(q[2]) );
  DFFX1 q_reg_1_ ( .D(n5), .CLK(net309), .Q(q[1]) );
  DFFX1 q_reg_0_ ( .D(n4), .CLK(net309), .Q(q[0]) );
  INVX0 U9 ( .INP(rst), .ZN(n3) );
  AND2X1 U10 ( .IN1(d[3]), .IN2(n3), .Q(n7) );
  AND2X1 U11 ( .IN1(d[2]), .IN2(n3), .Q(n6) );
  AND2X1 U12 ( .IN1(d[1]), .IN2(n3), .Q(n5) );
  AND2X1 U13 ( .IN1(d[0]), .IN2(n3), .Q(n4) );
  OR2X1 U14 ( .IN1(rst), .IN2(load), .Q(N1) );
endmodule


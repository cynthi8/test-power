/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Thu Feb 18 21:19:54 2021
/////////////////////////////////////////////////////////////


module sqrt_controller ( start, finish, clk, clear, ready, load_data, 
        incr_delta, find_next_sq );
  input start, finish, clk, clear;
  output ready, load_data, incr_delta, find_next_sq;
  wire   n2, n4, n6, n7, n8, n3, n5;
  wire   [1:0] state;
  wire   [1:0] next_state;

  DFFARX1 \state_reg[0]  ( .D(next_state[0]), .CLK(clk), .RSTB(n5), .Q(
        state[0]), .QN(n4) );
  DFFARX1 \state_reg[1]  ( .D(next_state[1]), .CLK(clk), .RSTB(n5), .Q(
        state[1]), .QN(n2) );
  AO21X1 U9 ( .IN1(state[1]), .IN2(n3), .IN3(state[0]), .Q(next_state[1]) );
  NAND3X0 U10 ( .IN1(n4), .IN2(n2), .IN3(start), .QN(n7) );
  AND2X1 U11 ( .IN1(start), .IN2(ready), .Q(load_data) );
  XOR2X1 U12 ( .IN1(state[1]), .IN2(state[0]), .Q(n8) );
  NAND3X0 U13 ( .IN1(n3), .IN2(n4), .IN3(state[1]), .QN(n6) );
  INVX0 U3 ( .INP(n6), .ZN(find_next_sq) );
  NOR2X0 U4 ( .IN1(n4), .IN2(n8), .QN(incr_delta) );
  NOR2X0 U5 ( .IN1(n8), .IN2(state[0]), .QN(ready) );
  NAND2X1 U6 ( .IN1(n6), .IN2(n7), .QN(next_state[0]) );
  INVX0 U7 ( .INP(finish), .ZN(n3) );
  INVX0 U8 ( .INP(clear), .ZN(n5) );
endmodule


module sqrt_data_path_DW01_add_0 ( A, B, CI, SUM, CO );
  input [6:0] A;
  input [6:0] B;
  output [6:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [6:1] carry;

  FADDX1 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  FADDX1 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  FADDX1 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  FADDX1 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  XNOR2X1 U1 ( .IN1(n2), .IN2(A[6]), .Q(SUM[6]) );
  NAND2X1 U2 ( .IN1(carry[5]), .IN2(A[5]), .QN(n2) );
  AND2X1 U3 ( .IN1(B[0]), .IN2(A[0]), .Q(n1) );
  XOR2X1 U4 ( .IN1(carry[5]), .IN2(A[5]), .Q(SUM[5]) );
  XOR2X1 U5 ( .IN1(B[0]), .IN2(A[0]), .Q(SUM[0]) );
endmodule


module sqrt_data_path ( num, load_data, incr_delta, find_next_sq, clk, finish, 
        result );
  input [6:0] num;
  output [3:0] result;
  input load_data, incr_delta, find_next_sq, clk;
  output finish;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N9, N10, N11, N12, N13, N14, N15, N16,
         N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29, N30,
         N31, \add_15_S2/carry[4] , \add_15_S2/carry[3] , n1, n2, n3, n4, n5,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19;
  wire   [6:0] Rdata;
  wire   [6:0] Rn;

  DFFX1 \Rdelta_reg[0]  ( .D(N16), .CLK(clk), .Q(N7) );
  DFFX1 \Rdelta_reg[1]  ( .D(N15), .CLK(clk), .Q(result[0]), .QN(n1) );
  DFFX1 \Rdelta_reg[2]  ( .D(N14), .CLK(clk), .Q(result[1]) );
  DFFX1 \Rdelta_reg[3]  ( .D(N13), .CLK(clk), .Q(result[2]) );
  DFFX1 \Rdelta_reg[4]  ( .D(N12), .CLK(clk), .Q(result[3]) );
  DFFX1 \Rn_reg[0]  ( .D(N30), .CLK(clk), .Q(Rn[0]) );
  DFFX1 \Rn_reg[1]  ( .D(N29), .CLK(clk), .Q(Rn[1]) );
  DFFX1 \Rn_reg[2]  ( .D(N28), .CLK(clk), .Q(Rn[2]) );
  DFFX1 \Rn_reg[3]  ( .D(N27), .CLK(clk), .Q(Rn[3]) );
  DFFX1 \Rn_reg[4]  ( .D(N26), .CLK(clk), .Q(Rn[4]) );
  DFFX1 \Rn_reg[5]  ( .D(N25), .CLK(clk), .Q(Rn[5]) );
  DFFX1 \Rn_reg[6]  ( .D(N24), .CLK(clk), .Q(Rn[6]) );
  DFFX1 \Rdata_reg[6]  ( .D(N0), .CLK(clk), .Q(Rdata[6]) );
  DFFX1 \Rdata_reg[5]  ( .D(N1), .CLK(clk), .Q(Rdata[5]) );
  DFFX1 \Rdata_reg[4]  ( .D(N2), .CLK(clk), .Q(Rdata[4]) );
  DFFX1 \Rdata_reg[3]  ( .D(N3), .CLK(clk), .Q(Rdata[3]) );
  DFFX1 \Rdata_reg[2]  ( .D(N4), .CLK(clk), .Q(Rdata[2]) );
  DFFX1 \Rdata_reg[1]  ( .D(N5), .CLK(clk), .Q(Rdata[1]) );
  DFFX1 \Rdata_reg[0]  ( .D(N6), .CLK(clk), .Q(Rdata[0]) );
  DFFX1 finish_reg ( .D(N31), .CLK(clk), .Q(finish) );
  AO22X1 U3 ( .IN1(num[0]), .IN2(load_data), .IN3(n19), .IN4(Rdata[0]), .Q(N6)
         );
  AO22X1 U4 ( .IN1(num[1]), .IN2(load_data), .IN3(n19), .IN4(Rdata[1]), .Q(N5)
         );
  AO22X1 U5 ( .IN1(num[2]), .IN2(load_data), .IN3(n19), .IN4(Rdata[2]), .Q(N4)
         );
  AO22X1 U6 ( .IN1(n17), .IN2(Rn[0]), .IN3(N17), .IN4(find_next_sq), .Q(N30)
         );
  AO22X1 U7 ( .IN1(num[3]), .IN2(load_data), .IN3(n19), .IN4(Rdata[3]), .Q(N3)
         );
  AO22X1 U8 ( .IN1(n17), .IN2(Rn[1]), .IN3(N18), .IN4(find_next_sq), .Q(N29)
         );
  AO22X1 U9 ( .IN1(n17), .IN2(Rn[2]), .IN3(N19), .IN4(find_next_sq), .Q(N28)
         );
  AO22X1 U10 ( .IN1(n17), .IN2(Rn[3]), .IN3(N20), .IN4(find_next_sq), .Q(N27)
         );
  AO22X1 U11 ( .IN1(n17), .IN2(Rn[4]), .IN3(N21), .IN4(find_next_sq), .Q(N26)
         );
  AO22X1 U12 ( .IN1(n17), .IN2(Rn[5]), .IN3(N22), .IN4(find_next_sq), .Q(N25)
         );
  AO22X1 U13 ( .IN1(n17), .IN2(Rn[6]), .IN3(find_next_sq), .IN4(N23), .Q(N24)
         );
  AO22X1 U15 ( .IN1(num[4]), .IN2(load_data), .IN3(n19), .IN4(Rdata[4]), .Q(N2) );
  AO22X1 U16 ( .IN1(n18), .IN2(N7), .IN3(N7), .IN4(incr_delta), .Q(N16) );
  AO22X1 U17 ( .IN1(result[0]), .IN2(n18), .IN3(n1), .IN4(incr_delta), .Q(N15)
         );
  AO22X1 U18 ( .IN1(result[1]), .IN2(n18), .IN3(N9), .IN4(incr_delta), .Q(N14)
         );
  AO22X1 U19 ( .IN1(result[2]), .IN2(n18), .IN3(N10), .IN4(incr_delta), .Q(N13) );
  AO22X1 U20 ( .IN1(result[3]), .IN2(n18), .IN3(incr_delta), .IN4(N11), .Q(N12) );
  AO22X1 U22 ( .IN1(num[5]), .IN2(load_data), .IN3(n19), .IN4(Rdata[5]), .Q(N1) );
  AO22X1 U23 ( .IN1(num[6]), .IN2(load_data), .IN3(n19), .IN4(Rdata[6]), .Q(N0) );
  sqrt_data_path_DW01_add_0 add_16_S2 ( .A(Rn), .B({1'b0, 1'b0, N12, N13, N14, 
        N15, N16}), .CI(1'b0), .SUM({N23, N22, N21, N20, N19, N18, N17}) );
  INVX0 U14 ( .INP(find_next_sq), .ZN(n17) );
  INVX0 U21 ( .INP(load_data), .ZN(n19) );
  INVX0 U24 ( .INP(N28), .ZN(n16) );
  INVX0 U25 ( .INP(incr_delta), .ZN(n18) );
  INVX0 U26 ( .INP(N3), .ZN(n11) );
  INVX0 U28 ( .INP(N4), .ZN(n10) );
  INVX0 U29 ( .INP(N29), .ZN(n15) );
  INVX0 U30 ( .INP(N0), .ZN(n14) );
  INVX0 U31 ( .INP(N1), .ZN(n13) );
  INVX0 U32 ( .INP(N2), .ZN(n12) );
  XOR2X1 U33 ( .IN1(\add_15_S2/carry[4] ), .IN2(result[3]), .Q(N11) );
  AND2X1 U34 ( .IN1(result[2]), .IN2(\add_15_S2/carry[3] ), .Q(
        \add_15_S2/carry[4] ) );
  XOR2X1 U35 ( .IN1(\add_15_S2/carry[3] ), .IN2(result[2]), .Q(N10) );
  AND2X1 U36 ( .IN1(result[1]), .IN2(result[0]), .Q(\add_15_S2/carry[3] ) );
  XOR2X1 U37 ( .IN1(result[0]), .IN2(result[1]), .Q(N9) );
  NOR2X0 U38 ( .IN1(N5), .IN2(n15), .QN(n2) );
  NOR2X0 U39 ( .IN1(N30), .IN2(n2), .QN(n3) );
  AOI222X1 U40 ( .IN1(N4), .IN2(n16), .IN3(n3), .IN4(N6), .IN5(N5), .IN6(n15), 
        .QN(n4) );
  AO221X1 U41 ( .IN1(N28), .IN2(n10), .IN3(N27), .IN4(n11), .IN5(n4), .Q(n5)
         );
  OA221X1 U42 ( .IN1(N26), .IN2(n12), .IN3(N27), .IN4(n11), .IN5(n5), .Q(n7)
         );
  AO221X1 U43 ( .IN1(N26), .IN2(n12), .IN3(N25), .IN4(n13), .IN5(n7), .Q(n8)
         );
  OA221X1 U44 ( .IN1(N24), .IN2(n14), .IN3(N25), .IN4(n13), .IN5(n8), .Q(n9)
         );
  AO21X1 U45 ( .IN1(N24), .IN2(n14), .IN3(n9), .Q(N31) );
endmodule


module sqrt_Top ( start, clk, clear, num, result, ready );
  input [6:0] num;
  output [3:0] result;
  input start, clk, clear;
  output ready;
  wire   finish, load_data, incr_delta, find_next_sq;

  sqrt_controller m1 ( .start(start), .finish(finish), .clk(clk), .clear(clear), .ready(ready), .load_data(load_data), .incr_delta(incr_delta), 
        .find_next_sq(find_next_sq) );
  sqrt_data_path m2 ( .num(num), .load_data(load_data), .incr_delta(incr_delta), .find_next_sq(find_next_sq), .clk(clk), .finish(finish), .result(result) );
endmodule


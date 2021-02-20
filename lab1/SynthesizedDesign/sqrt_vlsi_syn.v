/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Sat Feb 20 15:25:02 2021
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


module sqrt_data_path ( num, load_data, incr_delta, find_next_sq, clk, finish, result, clear );
  input [6:0] num;
  output [3:0] result;
  input load_data, incr_delta, find_next_sq, clk, clear;
  output finish;
  wire   N6, N7, N8, N9, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21,
         N22, N23, N24, N25, N26, N27, N28, N29, N30, N31, N32, N33, n1, n21,
         n22, n23, n24, n25, n26, n27, \add_18_S2/carry[4] ,
         \add_18_S2/carry[3] , n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n28, n29, n31, n32, n33, n34,
         n35, n36;
  wire   [6:0] Rn;

  DFFX1 \Rdata_reg[6]  ( .D(n27), .CLK(clk), .Q(n5) );
  DFFX1 \Rdata_reg[5]  ( .D(n26), .CLK(clk), .Q(n10) );
  DFFX1 \Rdata_reg[4]  ( .D(n25), .CLK(clk), .Q(n11) );
  DFFX1 \Rdata_reg[3]  ( .D(n24), .CLK(clk), .Q(n6) );
  DFFX1 \Rdata_reg[2]  ( .D(n23), .CLK(clk), .Q(n7) );
  DFFX1 \Rdata_reg[1]  ( .D(n22), .CLK(clk), .Q(n8) );
  DFFX1 \Rdata_reg[0]  ( .D(n21), .CLK(clk), .Q(n9) );
  DFFASX1 \Rdelta_reg[0]  ( .D(N18), .CLK(clk), .SETB(n36), .Q(N9) );
  DFFASX1 \Rdelta_reg[1]  ( .D(N17), .CLK(clk), .SETB(n36), .Q(result[0]), 
        .QN(n4) );
  DFFARX1 \Rdelta_reg[2]  ( .D(N16), .CLK(clk), .RSTB(n36), .Q(result[1]) );
  DFFARX1 \Rdelta_reg[3]  ( .D(N15), .CLK(clk), .RSTB(n36), .Q(result[2]) );
  DFFARX1 \Rdelta_reg[4]  ( .D(N14), .CLK(clk), .RSTB(n36), .Q(result[3]) );
  DFFASX1 \Rn_reg[0]  ( .D(N32), .CLK(clk), .SETB(n36), .Q(Rn[0]) );
  DFFARX1 \Rn_reg[1]  ( .D(N31), .CLK(clk), .RSTB(n36), .Q(Rn[1]) );
  DFFARX1 \Rn_reg[2]  ( .D(N30), .CLK(clk), .RSTB(n36), .Q(Rn[2]) );
  DFFARX1 \Rn_reg[3]  ( .D(N29), .CLK(clk), .RSTB(n36), .Q(Rn[3]) );
  DFFARX1 \Rn_reg[4]  ( .D(N28), .CLK(clk), .RSTB(n36), .Q(Rn[4]) );
  DFFARX1 \Rn_reg[5]  ( .D(N27), .CLK(clk), .RSTB(n36), .Q(Rn[5]) );
  DFFARX1 \Rn_reg[6]  ( .D(N26), .CLK(clk), .RSTB(n36), .Q(Rn[6]) );
  DFFARX1 finish_reg ( .D(N33), .CLK(clk), .RSTB(n36), .Q(finish) );
  AO22X1 U3 ( .IN1(n1), .IN2(n9), .IN3(num[0]), .IN4(n35), .Q(n21) );
  AO22X1 U4 ( .IN1(n1), .IN2(n8), .IN3(num[1]), .IN4(n35), .Q(n22) );
  AO22X1 U5 ( .IN1(n1), .IN2(n7), .IN3(num[2]), .IN4(n35), .Q(n23) );
  AO22X1 U6 ( .IN1(n1), .IN2(n6), .IN3(num[3]), .IN4(n35), .Q(n24) );
  AO22X1 U7 ( .IN1(n1), .IN2(n11), .IN3(num[4]), .IN4(n35), .Q(n25) );
  AO22X1 U8 ( .IN1(n1), .IN2(n10), .IN3(num[5]), .IN4(n35), .Q(n26) );
  AO22X1 U9 ( .IN1(n1), .IN2(n5), .IN3(num[6]), .IN4(n35), .Q(n27) );
  AO22X1 U13 ( .IN1(num[0]), .IN2(load_data), .IN3(n34), .IN4(n9), .Q(N8) );
  AO22X1 U15 ( .IN1(num[1]), .IN2(load_data), .IN3(n34), .IN4(n8), .Q(N7) );
  AO22X1 U17 ( .IN1(num[2]), .IN2(load_data), .IN3(n34), .IN4(n7), .Q(N6) );
  AO22X1 U23 ( .IN1(n32), .IN2(Rn[0]), .IN3(N19), .IN4(find_next_sq), .Q(N32)
         );
  AO22X1 U24 ( .IN1(n32), .IN2(Rn[1]), .IN3(N20), .IN4(find_next_sq), .Q(N31)
         );
  AO22X1 U25 ( .IN1(n32), .IN2(Rn[2]), .IN3(N21), .IN4(find_next_sq), .Q(N30)
         );
  AO22X1 U28 ( .IN1(n32), .IN2(Rn[3]), .IN3(N22), .IN4(find_next_sq), .Q(N29)
         );
  AO22X1 U29 ( .IN1(n32), .IN2(Rn[4]), .IN3(N23), .IN4(find_next_sq), .Q(N28)
         );
  AO22X1 U30 ( .IN1(n32), .IN2(Rn[5]), .IN3(N24), .IN4(find_next_sq), .Q(N27)
         );
  AO22X1 U31 ( .IN1(n32), .IN2(Rn[6]), .IN3(find_next_sq), .IN4(N25), .Q(N26)
         );
  AO22X1 U36 ( .IN1(n33), .IN2(N9), .IN3(N9), .IN4(incr_delta), .Q(N18) );
  AO22X1 U37 ( .IN1(result[0]), .IN2(n33), .IN3(n4), .IN4(incr_delta), .Q(N17)
         );
  AO22X1 U38 ( .IN1(result[1]), .IN2(n33), .IN3(N11), .IN4(incr_delta), .Q(N16) );
  AO22X1 U39 ( .IN1(result[2]), .IN2(n33), .IN3(N12), .IN4(incr_delta), .Q(N15) );
  AO22X1 U40 ( .IN1(result[3]), .IN2(n33), .IN3(incr_delta), .IN4(N13), .Q(N14) );
  sqrt_data_path_DW01_add_0 add_19_S2 ( .A(Rn), .B({1'b0, 1'b0, N14, N15, N16, 
        N17, N18}), .CI(1'b0), .SUM({N25, N24, N23, N22, N21, N20, N19}) );
  AOI22X1 U10 ( .IN1(num[3]), .IN2(load_data), .IN3(n34), .IN4(n6), .QN(n2) );
  AOI22X1 U11 ( .IN1(num[6]), .IN2(load_data), .IN3(n34), .IN4(n5), .QN(n3) );
  INVX0 U12 ( .INP(n1), .ZN(n35) );
  INVX0 U14 ( .INP(find_next_sq), .ZN(n32) );
  NAND2X1 U16 ( .IN1(load_data), .IN2(n36), .QN(n1) );
  INVX0 U18 ( .INP(load_data), .ZN(n34) );
  INVX0 U19 ( .INP(incr_delta), .ZN(n33) );
  INVX0 U20 ( .INP(N6), .ZN(n28) );
  INVX0 U21 ( .INP(N31), .ZN(n29) );
  INVX0 U22 ( .INP(clear), .ZN(n36) );
  INVX0 U26 ( .INP(N30), .ZN(n31) );
  AOI22X1 U27 ( .IN1(num[5]), .IN2(load_data), .IN3(n34), .IN4(n10), .QN(n12)
         );
  AOI22X1 U32 ( .IN1(num[4]), .IN2(load_data), .IN3(n34), .IN4(n11), .QN(n13)
         );
  XOR2X1 U33 ( .IN1(\add_18_S2/carry[4] ), .IN2(result[3]), .Q(N13) );
  AND2X1 U34 ( .IN1(result[2]), .IN2(\add_18_S2/carry[3] ), .Q(
        \add_18_S2/carry[4] ) );
  XOR2X1 U35 ( .IN1(\add_18_S2/carry[3] ), .IN2(result[2]), .Q(N12) );
  AND2X1 U41 ( .IN1(result[1]), .IN2(result[0]), .Q(\add_18_S2/carry[3] ) );
  XOR2X1 U42 ( .IN1(result[0]), .IN2(result[1]), .Q(N11) );
  NOR2X0 U43 ( .IN1(N7), .IN2(n29), .QN(n14) );
  NOR2X0 U45 ( .IN1(N32), .IN2(n14), .QN(n15) );
  AOI222X1 U46 ( .IN1(N6), .IN2(n31), .IN3(n15), .IN4(N8), .IN5(N7), .IN6(n29), 
        .QN(n16) );
  AO221X1 U47 ( .IN1(N30), .IN2(n28), .IN3(N29), .IN4(n2), .IN5(n16), .Q(n17)
         );
  OA221X1 U48 ( .IN1(N28), .IN2(n13), .IN3(N29), .IN4(n2), .IN5(n17), .Q(n18)
         );
  AO221X1 U49 ( .IN1(N28), .IN2(n13), .IN3(N27), .IN4(n12), .IN5(n18), .Q(n19)
         );
  OA221X1 U50 ( .IN1(N26), .IN2(n3), .IN3(N27), .IN4(n12), .IN5(n19), .Q(n20)
         );
  AO21X1 U51 ( .IN1(N26), .IN2(n3), .IN3(n20), .Q(N33) );
endmodule


module sqrt_Top ( start, clk, clear, num, result, ready );
  input [6:0] num;
  output [3:0] result;
  input start, clk, clear;
  output ready;
  wire   finish, load_data, incr_delta, find_next_sq;

  sqrt_controller m1 ( .start(start), .finish(finish), .clk(clk), .clear(clear), .ready(ready), .load_data(load_data), .incr_delta(incr_delta), .find_next_sq(find_next_sq) );
  sqrt_data_path m2 ( .num(num), .load_data(load_data), .incr_delta(incr_delta), .find_next_sq(find_next_sq), .clk(clk), .finish(finish), .result(result), .clear(clear) );
endmodule


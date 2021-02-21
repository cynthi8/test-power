/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Sat Feb 20 19:01:58 2021
/////////////////////////////////////////////////////////////


module sqrt_controller ( start, finish, clk, clear, ready, load_data, 
        incr_delta, find_next_sq );
  input start, finish, clk, clear;
  output ready, load_data, incr_delta, find_next_sq;
  wire   n4, n5, n6, n7, n8, n1, n2;
  wire   [1:0] next_state;
  wire   [1:0] state;

  DFFARX1 state_reg_0_ ( .D(next_state[0]), .CLK(clk), .RSTB(n5), .Q(state[0]), 
        .QN(n1) );
  DFFARX1 state_reg_1_ ( .D(next_state[1]), .CLK(clk), .RSTB(n5), .Q(state[1]), 
        .QN(n2) );
  AO21X1 U9 ( .IN1(state[1]), .IN2(n4), .IN3(state[0]), .Q(next_state[1]) );
  NAND3X0 U10 ( .IN1(n1), .IN2(n2), .IN3(start), .QN(n7) );
  AND2X1 U11 ( .IN1(start), .IN2(ready), .Q(load_data) );
  XOR2X1 U12 ( .IN1(state[1]), .IN2(state[0]), .Q(n8) );
  NAND3X0 U13 ( .IN1(n4), .IN2(n1), .IN3(state[1]), .QN(n6) );
  NOR2X0 U1 ( .IN1(n1), .IN2(n8), .QN(incr_delta) );
  INVX0 U2 ( .INP(n6), .ZN(find_next_sq) );
  NOR2X0 U3 ( .IN1(n8), .IN2(state[0]), .QN(ready) );
  NAND2X1 U4 ( .IN1(n6), .IN2(n7), .QN(next_state[0]) );
  INVX0 U5 ( .INP(finish), .ZN(n4) );
  INVX0 U6 ( .INP(clear), .ZN(n5) );
endmodule


module sqrt_data_path_DW01_add_0 ( A, B, CI, SUM, CO );
  input [6:0] A;
  input [6:0] B;
  output [6:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;

  XOR2X1 U3 ( .IN1(A[6]), .IN2(n2), .Q(SUM[6]) );
  XOR2X1 U4 ( .IN1(n1), .IN2(n3), .Q(SUM[5]) );
  AOI22X1 U5 ( .IN1(A[4]), .IN2(n4), .IN3(B[4]), .IN4(n5), .QN(n3) );
  OR2X1 U6 ( .IN1(n4), .IN2(A[4]), .Q(n5) );
  XOR3X1 U7 ( .IN1(B[4]), .IN2(A[4]), .IN3(n4), .Q(SUM[4]) );
  AO22X1 U8 ( .IN1(A[3]), .IN2(n6), .IN3(B[3]), .IN4(n7), .Q(n4) );
  OR2X1 U9 ( .IN1(n6), .IN2(A[3]), .Q(n7) );
  XOR3X1 U10 ( .IN1(B[3]), .IN2(A[3]), .IN3(n6), .Q(SUM[3]) );
  AO22X1 U11 ( .IN1(A[2]), .IN2(n8), .IN3(B[2]), .IN4(n9), .Q(n6) );
  OR2X1 U12 ( .IN1(n8), .IN2(A[2]), .Q(n9) );
  XOR3X1 U13 ( .IN1(B[2]), .IN2(A[2]), .IN3(n8), .Q(SUM[2]) );
  AO22X1 U14 ( .IN1(A[1]), .IN2(n10), .IN3(B[1]), .IN4(n11), .Q(n8) );
  OR2X1 U15 ( .IN1(A[1]), .IN2(n10), .Q(n11) );
  XOR3X1 U16 ( .IN1(B[1]), .IN2(A[1]), .IN3(n10), .Q(SUM[1]) );
  AND2X1 U17 ( .IN1(B[0]), .IN2(A[0]), .Q(n10) );
  XOR2X1 U18 ( .IN1(B[0]), .IN2(A[0]), .Q(SUM[0]) );
  NOR2X0 U1 ( .IN1(n3), .IN2(n1), .QN(n2) );
  INVX0 U2 ( .INP(A[5]), .ZN(n1) );
endmodule


module sqrt_data_path ( num, load_data, incr_delta, find_next_sq, clk, finish, 
        result, clear );
  input [6:0] num;
  output [3:0] result;
  input load_data, incr_delta, find_next_sq, clk, clear;
  output finish;
  wire   n27, n26, n25, n24, n23, n22, n21, N17, N16, N15, N14, N32, N31, N30,
         N29, N28, N27, N26, N33, N19, N20, N21, N22, N23, N24, N25, n1, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n44,
         n45, n46, n47, n48, n2, n3, n4, n5;
  wire   [6:0] Rn;

  DFFX1 Rdata_reg_6_ ( .D(n27), .CLK(clk), .QN(n45) );
  DFFX1 Rdata_reg_5_ ( .D(n26), .CLK(clk), .QN(n46) );
  DFFX1 Rdata_reg_4_ ( .D(n25), .CLK(clk), .QN(n47) );
  DFFX1 Rdata_reg_3_ ( .D(n24), .CLK(clk), .QN(n44) );
  DFFX1 Rdata_reg_2_ ( .D(n23), .CLK(clk), .Q(n5) );
  DFFX1 Rdata_reg_1_ ( .D(n22), .CLK(clk), .Q(n4) );
  DFFX1 Rdata_reg_0_ ( .D(n21), .CLK(clk), .Q(n3) );
  DFFASX1 Rdelta_reg_1_ ( .D(N17), .CLK(clk), .SETB(n16), .Q(result[0]) );
  DFFARX1 Rdelta_reg_2_ ( .D(N16), .CLK(clk), .RSTB(n16), .Q(result[1]), .QN(
        n2) );
  DFFARX1 Rdelta_reg_3_ ( .D(N15), .CLK(clk), .RSTB(n16), .Q(result[2]) );
  DFFARX1 Rdelta_reg_4_ ( .D(N14), .CLK(clk), .RSTB(n16), .Q(result[3]), .QN(
        n48) );
  DFFASX1 Rn_reg_0_ ( .D(N32), .CLK(clk), .SETB(n16), .Q(Rn[0]) );
  DFFARX1 Rn_reg_1_ ( .D(N31), .CLK(clk), .RSTB(n16), .Q(Rn[1]) );
  DFFARX1 Rn_reg_2_ ( .D(N30), .CLK(clk), .RSTB(n16), .Q(Rn[2]) );
  DFFARX1 Rn_reg_3_ ( .D(N29), .CLK(clk), .RSTB(n16), .Q(Rn[3]) );
  DFFARX1 Rn_reg_4_ ( .D(N28), .CLK(clk), .RSTB(n16), .Q(Rn[4]) );
  DFFARX1 Rn_reg_5_ ( .D(N27), .CLK(clk), .RSTB(n16), .Q(Rn[5]) );
  DFFARX1 Rn_reg_6_ ( .D(N26), .CLK(clk), .RSTB(n16), .Q(Rn[6]) );
  DFFARX1 finish_reg ( .D(N33), .CLK(clk), .RSTB(n16), .Q(finish) );
  sqrt_data_path_DW01_add_0 add_19_S2 ( .A(Rn), .B({1'b0, 1'b0, N14, N15, N16, 
        N17, 1'b1}), .CI(1'b0), .SUM({N25, N24, N23, N22, N21, N20, N19}) );
  OAI22X1 U22 ( .IN1(n17), .IN2(n45), .IN3(n9), .IN4(n13), .QN(n27) );
  OAI22X1 U23 ( .IN1(n17), .IN2(n46), .IN3(n10), .IN4(n13), .QN(n26) );
  OAI22X1 U24 ( .IN1(n17), .IN2(n47), .IN3(n11), .IN4(n13), .QN(n25) );
  OAI22X1 U25 ( .IN1(n17), .IN2(n44), .IN3(n12), .IN4(n13), .QN(n24) );
  AO22X1 U26 ( .IN1(n13), .IN2(n5), .IN3(num[2]), .IN4(n17), .Q(n23) );
  AO22X1 U27 ( .IN1(n13), .IN2(n4), .IN3(num[1]), .IN4(n17), .Q(n22) );
  AO22X1 U28 ( .IN1(n13), .IN2(n3), .IN3(num[0]), .IN4(n17), .Q(n21) );
  AO21X1 U29 ( .IN1(n18), .IN2(N26), .IN3(n19), .Q(N33) );
  OA221X1 U30 ( .IN1(N27), .IN2(n20), .IN3(N26), .IN4(n18), .IN5(n28), .Q(n19)
         );
  AO221X1 U31 ( .IN1(n29), .IN2(N28), .IN3(n20), .IN4(N27), .IN5(n30), .Q(n28)
         );
  OA221X1 U32 ( .IN1(N29), .IN2(n31), .IN3(N28), .IN4(n29), .IN5(n32), .Q(n30)
         );
  AO221X1 U33 ( .IN1(n1), .IN2(N30), .IN3(n31), .IN4(N29), .IN5(n33), .Q(n32)
         );
  AOI222X1 U34 ( .IN1(n34), .IN2(n7), .IN3(n35), .IN4(n36), .IN5(n37), .IN6(n8), .QN(n33) );
  OA21X1 U35 ( .IN1(n7), .IN2(n34), .IN3(n6), .Q(n36) );
  OA22X1 U36 ( .IN1(load_data), .IN2(n3), .IN3(num[0]), .IN4(n14), .Q(n35) );
  AO22X1 U37 ( .IN1(num[1]), .IN2(load_data), .IN3(n14), .IN4(n4), .Q(n34) );
  AO22X1 U38 ( .IN1(num[2]), .IN2(load_data), .IN3(n14), .IN4(n5), .Q(n37) );
  AO22X1 U39 ( .IN1(load_data), .IN2(n12), .IN3(n44), .IN4(n14), .Q(n31) );
  AO22X1 U40 ( .IN1(load_data), .IN2(n11), .IN3(n47), .IN4(n14), .Q(n29) );
  AO22X1 U41 ( .IN1(load_data), .IN2(n10), .IN3(n46), .IN4(n14), .Q(n20) );
  AO22X1 U42 ( .IN1(load_data), .IN2(n9), .IN3(n45), .IN4(n14), .Q(n18) );
  OA22X1 U43 ( .IN1(find_next_sq), .IN2(Rn[0]), .IN3(N19), .IN4(n15), .Q(N32)
         );
  AO22X1 U44 ( .IN1(n15), .IN2(Rn[1]), .IN3(N20), .IN4(find_next_sq), .Q(N31)
         );
  AO22X1 U45 ( .IN1(n15), .IN2(Rn[2]), .IN3(N21), .IN4(find_next_sq), .Q(N30)
         );
  AO22X1 U46 ( .IN1(n15), .IN2(Rn[3]), .IN3(N22), .IN4(find_next_sq), .Q(N29)
         );
  AO22X1 U47 ( .IN1(n15), .IN2(Rn[4]), .IN3(N23), .IN4(find_next_sq), .Q(N28)
         );
  AO22X1 U48 ( .IN1(n15), .IN2(Rn[5]), .IN3(N24), .IN4(find_next_sq), .Q(N27)
         );
  AO22X1 U49 ( .IN1(n15), .IN2(Rn[6]), .IN3(N25), .IN4(find_next_sq), .Q(N26)
         );
  XOR2X1 U50 ( .IN1(result[0]), .IN2(incr_delta), .Q(N17) );
  XNOR2X1 U51 ( .IN1(result[1]), .IN2(n38), .Q(N16) );
  XOR2X1 U52 ( .IN1(result[2]), .IN2(n39), .Q(N15) );
  XOR2X1 U53 ( .IN1(n48), .IN2(n40), .Q(N14) );
  INVX0 U2 ( .INP(find_next_sq), .ZN(n15) );
  INVX0 U3 ( .INP(load_data), .ZN(n14) );
  INVX0 U4 ( .INP(n17), .ZN(n13) );
  INVX0 U5 ( .INP(N31), .ZN(n7) );
  INVX0 U6 ( .INP(N32), .ZN(n6) );
  NOR2X0 U7 ( .IN1(n14), .IN2(clear), .QN(n17) );
  NAND2X1 U8 ( .IN1(incr_delta), .IN2(result[0]), .QN(n38) );
  INVX0 U9 ( .INP(n37), .ZN(n1) );
  INVX0 U10 ( .INP(N30), .ZN(n8) );
  INVX0 U11 ( .INP(num[3]), .ZN(n12) );
  INVX0 U12 ( .INP(num[4]), .ZN(n11) );
  NOR2X0 U13 ( .IN1(n38), .IN2(n2), .QN(n39) );
  NAND2X1 U14 ( .IN1(n39), .IN2(result[2]), .QN(n40) );
  INVX0 U15 ( .INP(num[5]), .ZN(n10) );
  INVX0 U16 ( .INP(num[6]), .ZN(n9) );
  INVX0 U17 ( .INP(clear), .ZN(n16) );
endmodule


module sqrt_Top ( start, clk, clear, num, result, ready );
  input [6:0] num;
  output [3:0] result;
  input start, clk, clear;
  output ready;
  wire   finish, load_data, incr_delta, find_next_sq;

  sqrt_controller m1 ( .start(start), .finish(finish), .clk(clk), .clear(clear), .ready(ready), .load_data(load_data), .incr_delta(incr_delta), 
        .find_next_sq(find_next_sq) );
  sqrt_data_path m2 ( .num(num), .load_data(load_data), .incr_delta(incr_delta), .find_next_sq(find_next_sq), .clk(clk), .finish(finish), .result(result), 
        .clear(clear) );
endmodule


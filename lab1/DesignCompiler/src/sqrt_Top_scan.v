/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Sat Feb 20 19:02:05 2021
/////////////////////////////////////////////////////////////


module sqrt_data_path_DW01_add_0 ( A, B, CI, SUM, CO );
  input [6:0] A;
  input [6:0] B;
  output [6:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;

  XOR2X1 U3 ( .IN1(A[6]), .IN2(n2), .Q(SUM[6]) );
  XNOR2X1 U4 ( .IN1(A[5]), .IN2(n3), .Q(SUM[5]) );
  OAI22X1 U5 ( .IN1(n4), .IN2(A[4]), .IN3(n5), .IN4(B[4]), .QN(n3) );
  AND2X1 U6 ( .IN1(A[4]), .IN2(n4), .Q(n5) );
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


module sqrt_data_path_test_1 ( num, load_data, incr_delta, find_next_sq, clk, 
        finish, result, clear, test_si, test_so, test_se );
  input [6:0] num;
  output [3:0] result;
  input load_data, incr_delta, find_next_sq, clk, clear, test_si, test_se;
  output finish, test_so;
  wire   n27, n26, n25, n24, n23, n22, n21, N17, N16, N15, N14, N32, N31, N30,
         N29, N28, N27, N26, N33, N19, N20, N21, N22, N23, N24, N25, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n28, n29, n30, n31, n32, n33, n34, n35, n36, n40, n41,
         n42, n43, n37, n38, n39, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57;
  wire   [6:0] Rn;

  sqrt_data_path_DW01_add_0 add_19_S2 ( .A(Rn), .B({1'b0, 1'b0, N14, N15, N16, 
        N17, 1'b1}), .CI(1'b0), .SUM({N25, N24, N23, N22, N21, N20, N19}) );
  AO22X1 U17 ( .IN1(num[6]), .IN2(n13), .IN3(n43), .IN4(n9), .Q(n27) );
  AO22X1 U19 ( .IN1(num[5]), .IN2(n13), .IN3(n42), .IN4(n9), .Q(n26) );
  AO22X1 U20 ( .IN1(num[4]), .IN2(n13), .IN3(n41), .IN4(n9), .Q(n25) );
  AO22X1 U21 ( .IN1(num[3]), .IN2(n13), .IN3(n40), .IN4(n9), .Q(n24) );
  AO22X1 U22 ( .IN1(num[2]), .IN2(n13), .IN3(n9), .IN4(n2), .Q(n23) );
  AO22X1 U23 ( .IN1(num[1]), .IN2(n13), .IN3(n9), .IN4(n3), .Q(n22) );
  AO22X1 U24 ( .IN1(num[0]), .IN2(n13), .IN3(n9), .IN4(n4), .Q(n21) );
  AO21X1 U25 ( .IN1(n14), .IN2(N26), .IN3(n15), .Q(N33) );
  OA221X1 U26 ( .IN1(N27), .IN2(n16), .IN3(N26), .IN4(n14), .IN5(n17), .Q(n15)
         );
  AO221X1 U27 ( .IN1(n18), .IN2(N28), .IN3(n16), .IN4(N27), .IN5(n19), .Q(n17)
         );
  OA221X1 U28 ( .IN1(N29), .IN2(n20), .IN3(N28), .IN4(n18), .IN5(n28), .Q(n19)
         );
  AO221X1 U29 ( .IN1(n1), .IN2(N30), .IN3(n20), .IN4(N29), .IN5(n29), .Q(n28)
         );
  AOI222X1 U30 ( .IN1(n30), .IN2(n7), .IN3(n31), .IN4(n32), .IN5(n33), .IN6(n8), .QN(n29) );
  OA21X1 U31 ( .IN1(n7), .IN2(n30), .IN3(n6), .Q(n32) );
  OA22X1 U32 ( .IN1(load_data), .IN2(n4), .IN3(num[0]), .IN4(n10), .Q(n31) );
  AO22X1 U33 ( .IN1(num[1]), .IN2(load_data), .IN3(n10), .IN4(n3), .Q(n30) );
  AO22X1 U34 ( .IN1(num[2]), .IN2(load_data), .IN3(n10), .IN4(n2), .Q(n33) );
  OAI22X1 U35 ( .IN1(n10), .IN2(num[3]), .IN3(load_data), .IN4(n40), .QN(n20)
         );
  OAI22X1 U36 ( .IN1(n10), .IN2(num[4]), .IN3(load_data), .IN4(n41), .QN(n18)
         );
  OAI22X1 U37 ( .IN1(n10), .IN2(num[5]), .IN3(load_data), .IN4(n42), .QN(n16)
         );
  OAI22X1 U38 ( .IN1(n10), .IN2(num[6]), .IN3(load_data), .IN4(n43), .QN(n14)
         );
  AO22X1 U39 ( .IN1(n11), .IN2(Rn[0]), .IN3(find_next_sq), .IN4(N19), .Q(N32)
         );
  AO22X1 U40 ( .IN1(n11), .IN2(Rn[1]), .IN3(N20), .IN4(find_next_sq), .Q(N31)
         );
  AO22X1 U41 ( .IN1(n11), .IN2(Rn[2]), .IN3(N21), .IN4(find_next_sq), .Q(N30)
         );
  AO22X1 U42 ( .IN1(n11), .IN2(Rn[3]), .IN3(N22), .IN4(find_next_sq), .Q(N29)
         );
  AO22X1 U43 ( .IN1(n11), .IN2(Rn[4]), .IN3(N23), .IN4(find_next_sq), .Q(N28)
         );
  AO22X1 U44 ( .IN1(n11), .IN2(Rn[5]), .IN3(N24), .IN4(find_next_sq), .Q(N27)
         );
  AO22X1 U45 ( .IN1(n11), .IN2(Rn[6]), .IN3(N25), .IN4(find_next_sq), .Q(N26)
         );
  XOR2X1 U46 ( .IN1(result[0]), .IN2(incr_delta), .Q(N17) );
  XNOR2X1 U47 ( .IN1(result[1]), .IN2(n34), .Q(N16) );
  XNOR2X1 U48 ( .IN1(result[2]), .IN2(n35), .Q(N15) );
  XOR2X1 U49 ( .IN1(result[3]), .IN2(n36), .Q(N14) );
  NAND3X0 U50 ( .IN1(incr_delta), .IN2(result[0]), .IN3(result[1]), .QN(n35)
         );
  SDFFARX1 Rdata_reg_6_ ( .D(n27), .SI(n52), .SE(test_se), .CLK(clk), .RSTB(
        1'b1), .Q(n43), .QN(n51) );
  SDFFARX1 Rdata_reg_5_ ( .D(n26), .SI(n53), .SE(test_se), .CLK(clk), .RSTB(
        1'b1), .Q(n42), .QN(n52) );
  SDFFARX1 Rdata_reg_4_ ( .D(n25), .SI(n54), .SE(test_se), .CLK(clk), .RSTB(
        1'b1), .Q(n41), .QN(n53) );
  SDFFARX1 Rdata_reg_3_ ( .D(n24), .SI(n55), .SE(test_se), .CLK(clk), .RSTB(
        1'b1), .Q(n40), .QN(n54) );
  SDFFARX1 Rdata_reg_2_ ( .D(n23), .SI(n56), .SE(test_se), .CLK(clk), .RSTB(
        1'b1), .Q(n2), .QN(n55) );
  SDFFARX1 Rdata_reg_1_ ( .D(n22), .SI(n57), .SE(test_se), .CLK(clk), .RSTB(
        1'b1), .Q(n3), .QN(n56) );
  SDFFARX1 Rdata_reg_0_ ( .D(n21), .SI(test_si), .SE(test_se), .CLK(clk), 
        .RSTB(1'b1), .Q(n4), .QN(n57) );
  SDFFASX1 Rdelta_reg_1_ ( .D(N17), .SI(n51), .SE(test_se), .CLK(clk), .SETB(
        n12), .Q(result[0]), .QN(n50) );
  SDFFASX1 Rn_reg_0_ ( .D(N32), .SI(n48), .SE(test_se), .CLK(clk), .SETB(n12), 
        .Q(Rn[0]), .QN(n47) );
  SDFFARX1 Rdelta_reg_2_ ( .D(N16), .SI(n50), .SE(test_se), .CLK(clk), .RSTB(
        n12), .Q(result[1]), .QN(n49) );
  SDFFARX1 Rdelta_reg_3_ ( .D(N15), .SI(n49), .SE(test_se), .CLK(clk), .RSTB(
        n12), .Q(result[2]), .QN(n5) );
  SDFFARX1 Rdelta_reg_4_ ( .D(N14), .SI(n5), .SE(test_se), .CLK(clk), .RSTB(
        n12), .Q(result[3]), .QN(n48) );
  SDFFARX1 Rn_reg_1_ ( .D(N31), .SI(n47), .SE(test_se), .CLK(clk), .RSTB(n12), 
        .Q(Rn[1]), .QN(n46) );
  SDFFARX1 Rn_reg_2_ ( .D(N30), .SI(n46), .SE(test_se), .CLK(clk), .RSTB(n12), 
        .Q(Rn[2]), .QN(n45) );
  SDFFARX1 Rn_reg_3_ ( .D(N29), .SI(n45), .SE(test_se), .CLK(clk), .RSTB(n12), 
        .Q(Rn[3]), .QN(n44) );
  SDFFARX1 Rn_reg_4_ ( .D(N28), .SI(n44), .SE(test_se), .CLK(clk), .RSTB(n12), 
        .Q(Rn[4]), .QN(n39) );
  SDFFARX1 Rn_reg_5_ ( .D(N27), .SI(n39), .SE(test_se), .CLK(clk), .RSTB(n12), 
        .Q(Rn[5]), .QN(n38) );
  SDFFARX1 Rn_reg_6_ ( .D(N26), .SI(n38), .SE(test_se), .CLK(clk), .RSTB(n12), 
        .Q(Rn[6]), .QN(n37) );
  SDFFARX1 finish_reg ( .D(N33), .SI(n37), .SE(test_se), .CLK(clk), .RSTB(n12), 
        .Q(finish), .QN(test_so) );
  INVX0 U12 ( .INP(find_next_sq), .ZN(n11) );
  INVX0 U13 ( .INP(load_data), .ZN(n10) );
  INVX0 U14 ( .INP(n13), .ZN(n9) );
  INVX0 U15 ( .INP(N31), .ZN(n7) );
  INVX0 U16 ( .INP(N32), .ZN(n6) );
  INVX0 U51 ( .INP(n33), .ZN(n1) );
  INVX0 U52 ( .INP(N30), .ZN(n8) );
  NOR2X0 U53 ( .IN1(n10), .IN2(clear), .QN(n13) );
  NAND2X1 U54 ( .IN1(incr_delta), .IN2(result[0]), .QN(n34) );
  NOR2X0 U55 ( .IN1(n5), .IN2(n35), .QN(n36) );
  INVX0 U56 ( .INP(clear), .ZN(n12) );
endmodule


module sqrt_controller_test_1 ( start, finish, clk, clear, ready, load_data, 
        incr_delta, find_next_sq, test_si, test_so, test_se );
  input start, finish, clk, clear, test_si, test_se;
  output ready, load_data, incr_delta, find_next_sq, test_so;
  wire   n2, n4, n5, n6, n7, n8;
  wire   [1:0] next_state;
  wire   [1:0] state;

  AO21X1 U9 ( .IN1(state[1]), .IN2(n4), .IN3(state[0]), .Q(next_state[1]) );
  NAND3X0 U10 ( .IN1(n2), .IN2(test_so), .IN3(start), .QN(n7) );
  AND2X1 U11 ( .IN1(start), .IN2(ready), .Q(load_data) );
  XOR2X1 U12 ( .IN1(state[1]), .IN2(state[0]), .Q(n8) );
  NAND3X0 U13 ( .IN1(n4), .IN2(n2), .IN3(state[1]), .QN(n6) );
  SDFFARX1 state_reg_1_ ( .D(next_state[1]), .SI(n2), .SE(test_se), .CLK(clk), 
        .RSTB(n5), .Q(state[1]), .QN(test_so) );
  SDFFARX1 state_reg_0_ ( .D(next_state[0]), .SI(test_si), .SE(test_se), .CLK(
        clk), .RSTB(n5), .Q(state[0]), .QN(n2) );
  NOR2X0 U3 ( .IN1(n2), .IN2(n8), .QN(incr_delta) );
  INVX0 U4 ( .INP(n6), .ZN(find_next_sq) );
  NOR2X0 U5 ( .IN1(n8), .IN2(state[0]), .QN(ready) );
  NAND2X1 U6 ( .IN1(n6), .IN2(n7), .QN(next_state[0]) );
  INVX0 U7 ( .INP(finish), .ZN(n4) );
  INVX0 U8 ( .INP(clear), .ZN(n5) );
endmodule


module sqrt_Top ( start, clk, clear, num, result, ready, test_si, test_so, 
        test_se );
  input [6:0] num;
  output [3:0] result;
  input start, clk, clear, test_si, test_se;
  output ready, test_so;
  wire   finish, load_data, incr_delta, find_next_sq, n3, n5, n6, n7;

  sqrt_controller_test_1 m1 ( .start(start), .finish(finish), .clk(clk), 
        .clear(clear), .ready(ready), .load_data(load_data), .incr_delta(
        incr_delta), .find_next_sq(find_next_sq), .test_si(test_si), .test_so(
        n3), .test_se(n6) );
  sqrt_data_path_test_1 m2 ( .num(num), .load_data(load_data), .incr_delta(
        incr_delta), .find_next_sq(find_next_sq), .clk(clk), .finish(finish), 
        .result(result), .clear(clear), .test_si(n3), .test_so(test_so), 
        .test_se(n6) );
  INVX0 U1 ( .INP(n7), .ZN(n5) );
  INVX0 U2 ( .INP(n5), .ZN(n6) );
  DELLN2X2 U3 ( .INP(test_se), .Z(n7) );
endmodule


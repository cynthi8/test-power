/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Fri Mar 19 18:45:54 2021
/////////////////////////////////////////////////////////////


module mux_1 ( rst, sLine, load, result, output0 );
  input [3:0] load;
  input [3:0] result;
  output [3:0] output0;
  input rst, sLine;
  wire   n1, n2, n3;

  AO22X1 U5 ( .IN1(result[3]), .IN2(n2), .IN3(load[3]), .IN4(n3), .Q(
        output0[3]) );
  AO22X1 U6 ( .IN1(result[2]), .IN2(n2), .IN3(load[2]), .IN4(n3), .Q(
        output0[2]) );
  AO22X1 U7 ( .IN1(result[1]), .IN2(n2), .IN3(load[1]), .IN4(n3), .Q(
        output0[1]) );
  AO22X1 U8 ( .IN1(result[0]), .IN2(n2), .IN3(load[0]), .IN4(n3), .Q(
        output0[0]) );
  NOR2X0 U2 ( .IN1(n1), .IN2(rst), .QN(n2) );
  INVX0 U3 ( .INP(sLine), .ZN(n1) );
  NOR2X0 U4 ( .IN1(rst), .IN2(sLine), .QN(n3) );
endmodule


module mux_0 ( rst, sLine, load, result, output0 );
  input [3:0] load;
  input [3:0] result;
  output [3:0] output0;
  input rst, sLine;
  wire   n1, n2, n3;

  AO22X1 U5 ( .IN1(result[3]), .IN2(n2), .IN3(load[3]), .IN4(n3), .Q(
        output0[3]) );
  AO22X1 U6 ( .IN1(result[2]), .IN2(n2), .IN3(load[2]), .IN4(n3), .Q(
        output0[2]) );
  AO22X1 U7 ( .IN1(result[1]), .IN2(n2), .IN3(load[1]), .IN4(n3), .Q(
        output0[1]) );
  AO22X1 U8 ( .IN1(result[0]), .IN2(n2), .IN3(load[0]), .IN4(n3), .Q(
        output0[0]) );
  NOR2X0 U2 ( .IN1(n1), .IN2(rst), .QN(n2) );
  INVX0 U3 ( .INP(sLine), .ZN(n1) );
  NOR2X0 U4 ( .IN1(rst), .IN2(sLine), .QN(n3) );
endmodule


module comparator ( rst, x, y, output0 );
  input [3:0] x;
  input [3:0] y;
  output [1:0] output0;
  input rst;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17;

  OA21X1 U13 ( .IN1(y[3]), .IN2(n1), .IN3(n7), .Q(n6) );
  AO222X1 U14 ( .IN1(y[2]), .IN2(n2), .IN3(n8), .IN4(n9), .IN5(y[3]), .IN6(n1), 
        .Q(n7) );
  NAND3X0 U15 ( .IN1(n12), .IN2(n4), .IN3(y[0]), .QN(n10) );
  OR2X1 U16 ( .IN1(n3), .IN2(y[1]), .Q(n12) );
  AOI22X1 U17 ( .IN1(n14), .IN2(y[3]), .IN3(n1), .IN4(n15), .QN(n13) );
  OR2X1 U18 ( .IN1(n1), .IN2(n15), .Q(n14) );
  AO21X1 U19 ( .IN1(y[2]), .IN2(n2), .IN3(n16), .Q(n15) );
  OA221X1 U20 ( .IN1(y[1]), .IN2(n3), .IN3(n4), .IN4(n17), .IN5(n9), .Q(n16)
         );
  OR2X1 U21 ( .IN1(n2), .IN2(y[2]), .Q(n9) );
  NOR2X0 U3 ( .IN1(rst), .IN2(n6), .QN(output0[1]) );
  NAND2X1 U4 ( .IN1(n10), .IN2(n11), .QN(n8) );
  NOR2X0 U5 ( .IN1(rst), .IN2(n13), .QN(output0[0]) );
  INVX0 U6 ( .INP(x[1]), .ZN(n3) );
  NAND2X1 U7 ( .IN1(y[1]), .IN2(n3), .QN(n11) );
  NAND2X1 U8 ( .IN1(n11), .IN2(n5), .QN(n17) );
  INVX0 U9 ( .INP(y[0]), .ZN(n5) );
  INVX0 U10 ( .INP(x[3]), .ZN(n1) );
  INVX0 U11 ( .INP(x[2]), .ZN(n2) );
  INVX0 U12 ( .INP(x[0]), .ZN(n4) );
endmodule


module subtractor ( rst, cmd, x, y, xout, yout );
  input [1:0] cmd;
  input [3:0] x;
  input [3:0] y;
  output [3:0] xout;
  output [3:0] yout;
  input rst;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43;

  XOR2X1 U34 ( .IN1(n15), .IN2(y[3]), .Q(n13) );
  XOR2X1 U35 ( .IN1(x[3]), .IN2(n17), .Q(n16) );
  OA22X1 U36 ( .IN1(n18), .IN2(n10), .IN3(x[2]), .IN4(n4), .Q(n17) );
  XOR2X1 U37 ( .IN1(n10), .IN2(n21), .Q(n20) );
  XOR2X1 U38 ( .IN1(n19), .IN2(x[2]), .Q(n22) );
  AO22X1 U39 ( .IN1(n23), .IN2(n6), .IN3(y[1]), .IN4(n24), .Q(n19) );
  XOR2X1 U40 ( .IN1(n26), .IN2(y[1]), .Q(n25) );
  XOR2X1 U41 ( .IN1(x[1]), .IN2(n7), .Q(n27) );
  OA221X1 U42 ( .IN1(n12), .IN2(n1), .IN3(cmd[1]), .IN4(n23), .IN5(n29), .Q(
        n28) );
  XOR2X1 U43 ( .IN1(n31), .IN2(x[3]), .Q(n30) );
  XOR2X1 U44 ( .IN1(y[3]), .IN2(n33), .Q(n32) );
  OA22X1 U45 ( .IN1(y[2]), .IN2(n34), .IN3(n5), .IN4(n3), .Q(n33) );
  XOR2X1 U46 ( .IN1(n3), .IN2(n37), .Q(n36) );
  XOR2X1 U47 ( .IN1(n35), .IN2(y[2]), .Q(n38) );
  AO22X1 U48 ( .IN1(x[1]), .IN2(n29), .IN3(n39), .IN4(n11), .Q(n35) );
  XOR2X1 U49 ( .IN1(n41), .IN2(x[1]), .Q(n40) );
  XOR2X1 U50 ( .IN1(y[1]), .IN2(n8), .Q(n42) );
  AO21X1 U51 ( .IN1(n2), .IN2(n1), .IN3(rst), .Q(n14) );
  OA221X1 U52 ( .IN1(n9), .IN2(n2), .IN3(cmd[0]), .IN4(n29), .IN5(n23), .Q(n43) );
  INVX0 U2 ( .INP(cmd[1]), .ZN(n1) );
  INVX0 U3 ( .INP(cmd[0]), .ZN(n2) );
  NOR2X0 U4 ( .IN1(n43), .IN2(n14), .QN(xout[0]) );
  INVX0 U5 ( .INP(n23), .ZN(n7) );
  INVX0 U6 ( .INP(n29), .ZN(n8) );
  NOR2X0 U7 ( .IN1(n19), .IN2(n3), .QN(n18) );
  NOR2X0 U8 ( .IN1(n36), .IN2(n14), .QN(xout[2]) );
  NOR2X0 U9 ( .IN1(cmd[0]), .IN2(n38), .QN(n37) );
  NOR2X0 U10 ( .IN1(n40), .IN2(n14), .QN(xout[1]) );
  NAND2X1 U11 ( .IN1(n42), .IN2(n2), .QN(n41) );
  NOR2X0 U12 ( .IN1(n30), .IN2(n14), .QN(xout[3]) );
  NAND2X1 U13 ( .IN1(n32), .IN2(n2), .QN(n31) );
  NOR2X0 U14 ( .IN1(cmd[1]), .IN2(n22), .QN(n21) );
  NAND2X1 U15 ( .IN1(n27), .IN2(n1), .QN(n26) );
  NAND2X1 U16 ( .IN1(n16), .IN2(n1), .QN(n15) );
  INVX0 U17 ( .INP(n19), .ZN(n4) );
  NOR2X0 U18 ( .IN1(n25), .IN2(n14), .QN(yout[1]) );
  NOR2X0 U19 ( .IN1(n20), .IN2(n14), .QN(yout[2]) );
  NOR2X0 U20 ( .IN1(n28), .IN2(n14), .QN(yout[0]) );
  NOR2X0 U21 ( .IN1(n13), .IN2(n14), .QN(yout[3]) );
  INVX0 U22 ( .INP(y[1]), .ZN(n11) );
  NAND2X1 U23 ( .IN1(n8), .IN2(n6), .QN(n39) );
  NAND2X1 U24 ( .IN1(x[1]), .IN2(n7), .QN(n24) );
  INVX0 U25 ( .INP(x[2]), .ZN(n3) );
  INVX0 U26 ( .INP(x[1]), .ZN(n6) );
  INVX0 U27 ( .INP(y[0]), .ZN(n12) );
  INVX0 U28 ( .INP(x[0]), .ZN(n9) );
  NAND2X1 U29 ( .IN1(x[0]), .IN2(n12), .QN(n23) );
  NAND2X1 U30 ( .IN1(y[0]), .IN2(n9), .QN(n29) );
  INVX0 U31 ( .INP(y[2]), .ZN(n10) );
  INVX0 U32 ( .INP(n35), .ZN(n5) );
  NOR2X0 U33 ( .IN1(x[2]), .IN2(n35), .QN(n34) );
endmodule


module fsm_test_1 ( rst, clk, proceed, comparison, enable, xsel, ysel, xld, 
        yld, test_si, test_so, test_se );
  input [1:0] comparison;
  input rst, clk, proceed, test_si, test_se;
  output enable, xsel, ysel, xld, yld, test_so;
  wire   n3, n5, n6, n4, n7, n9, n10, n11, n12, n13, n14, n15, n16, n17, n19,
         n20;
  wire   [2:0] nState;

  OAI21X1 U18 ( .IN1(n4), .IN2(n5), .IN3(n12), .QN(yld) );
  NAND3X0 U19 ( .IN1(test_so), .IN2(n4), .IN3(n5), .QN(n12) );
  NAND3X0 U20 ( .IN1(n16), .IN2(n7), .IN3(n3), .QN(n15) );
  NAND3X0 U21 ( .IN1(n10), .IN2(n4), .IN3(n17), .QN(n16) );
  AO21X1 U22 ( .IN1(n3), .IN2(n6), .IN3(n7), .Q(n14) );
  AO21X1 U24 ( .IN1(n6), .IN2(n7), .IN3(xsel), .Q(xld) );
  SDFFARX1 cState_reg_2_ ( .D(nState[2]), .SI(n5), .SE(test_se), .CLK(clk), 
        .RSTB(n9), .Q(test_so), .QN(n3) );
  SDFFARX1 cState_reg_0_ ( .D(nState[0]), .SI(test_si), .SE(test_se), .CLK(clk), .RSTB(n9), .Q(n4), .QN(n6) );
  SDFFARX1 cState_reg_1_ ( .D(nState[1]), .SI(n6), .SE(test_se), .CLK(clk), 
        .RSTB(n9), .Q(n7), .QN(n5) );
  INVX0 U6 ( .INP(n13), .ZN(n10) );
  INVX0 U7 ( .INP(n11), .ZN(enable) );
  NOR2X0 U8 ( .IN1(comparison[1]), .IN2(comparison[0]), .QN(n13) );
  NAND2X1 U9 ( .IN1(comparison[1]), .IN2(comparison[0]), .QN(n17) );
  NAND2X1 U10 ( .IN1(n11), .IN2(n12), .QN(ysel) );
  NAND2X1 U11 ( .IN1(xsel), .IN2(n7), .QN(n11) );
  OR4X1 U12 ( .IN1(test_so), .IN2(n19), .IN3(n20), .IN4(xld), .Q(nState[0]) );
  AND2X1 U13 ( .IN1(proceed), .IN2(n6), .Q(n19) );
  NOR2X0 U14 ( .IN1(comparison[1]), .IN2(n5), .QN(n20) );
  NAND2X1 U15 ( .IN1(n14), .IN2(n15), .QN(nState[1]) );
  NOR4X0 U16 ( .IN1(n6), .IN2(n5), .IN3(n13), .IN4(test_so), .QN(nState[2]) );
  NOR2X0 U17 ( .IN1(n4), .IN2(n3), .QN(xsel) );
  INVX0 U23 ( .INP(rst), .ZN(n9) );
endmodule


module regis_test_0 ( rst, clk, load, input0, output0, test_si, test_so, 
        test_se );
  input [3:0] input0;
  output [3:0] output0;
  input rst, clk, load, test_si, test_se;
  output test_so;
  wire   n2, n3, n4, n6, n1, n5, n7, n8, n9;

  AO22X1 U4 ( .IN1(output0[3]), .IN2(n5), .IN3(load), .IN4(input0[3]), .Q(n6)
         );
  AO22X1 U5 ( .IN1(output0[2]), .IN2(n5), .IN3(input0[2]), .IN4(load), .Q(n4)
         );
  AO22X1 U6 ( .IN1(output0[1]), .IN2(n5), .IN3(input0[1]), .IN4(load), .Q(n3)
         );
  AO22X1 U7 ( .IN1(output0[0]), .IN2(n5), .IN3(input0[0]), .IN4(load), .Q(n2)
         );
  SDFFARX1 output_reg_3_ ( .D(n6), .SI(n7), .SE(test_se), .CLK(clk), .RSTB(n1), 
        .Q(output0[3]), .QN(test_so) );
  SDFFARX1 output_reg_2_ ( .D(n4), .SI(n8), .SE(test_se), .CLK(clk), .RSTB(n1), 
        .Q(output0[2]), .QN(n7) );
  SDFFARX1 output_reg_1_ ( .D(n3), .SI(n9), .SE(test_se), .CLK(clk), .RSTB(n1), 
        .Q(output0[1]), .QN(n8) );
  SDFFARX1 output_reg_0_ ( .D(n2), .SI(test_si), .SE(test_se), .CLK(clk), 
        .RSTB(n1), .Q(output0[0]), .QN(n9) );
  INVX0 U2 ( .INP(load), .ZN(n5) );
  INVX0 U3 ( .INP(rst), .ZN(n1) );
endmodule


module regis_test_1 ( rst, clk, load, input0, output0, test_si, test_so, 
        test_se );
  input [3:0] input0;
  output [3:0] output0;
  input rst, clk, load, test_si, test_se;
  output test_so;
  wire   n7, n9, n10, n11, n1, n2, n3, n4, n5;

  AO22X1 U4 ( .IN1(output0[2]), .IN2(n2), .IN3(load), .IN4(input0[2]), .Q(n9)
         );
  AO22X1 U5 ( .IN1(output0[3]), .IN2(n2), .IN3(input0[3]), .IN4(load), .Q(n7)
         );
  AO22X1 U6 ( .IN1(output0[0]), .IN2(n2), .IN3(input0[0]), .IN4(load), .Q(n11)
         );
  AO22X1 U7 ( .IN1(output0[1]), .IN2(n2), .IN3(input0[1]), .IN4(load), .Q(n10)
         );
  SDFFARX1 output_reg_3_ ( .D(n7), .SI(n3), .SE(test_se), .CLK(clk), .RSTB(n1), 
        .Q(output0[3]), .QN(test_so) );
  SDFFARX1 output_reg_2_ ( .D(n9), .SI(n4), .SE(test_se), .CLK(clk), .RSTB(n1), 
        .Q(output0[2]), .QN(n3) );
  SDFFARX1 output_reg_1_ ( .D(n10), .SI(n5), .SE(test_se), .CLK(clk), .RSTB(n1), .Q(output0[1]), .QN(n4) );
  SDFFARX1 output_reg_0_ ( .D(n11), .SI(test_si), .SE(test_se), .CLK(clk), 
        .RSTB(n1), .Q(output0[0]), .QN(n5) );
  INVX0 U2 ( .INP(load), .ZN(n2) );
  INVX0 U3 ( .INP(rst), .ZN(n1) );
endmodule


module regis_test_2 ( rst, clk, load, input0, output0, test_si, test_so, 
        test_se );
  input [3:0] input0;
  output [3:0] output0;
  input rst, clk, load, test_si, test_se;
  output test_so;
  wire   n7, n9, n10, n11, n21, n22, n1, n2, n3;

  AO22X1 U4 ( .IN1(output0[2]), .IN2(n21), .IN3(load), .IN4(input0[2]), .Q(n9)
         );
  AO22X1 U5 ( .IN1(output0[3]), .IN2(n21), .IN3(input0[3]), .IN4(load), .Q(n7)
         );
  AO22X1 U6 ( .IN1(output0[0]), .IN2(n21), .IN3(input0[0]), .IN4(load), .Q(n11) );
  AO22X1 U7 ( .IN1(output0[1]), .IN2(n21), .IN3(input0[1]), .IN4(load), .Q(n10) );
  SDFFARX1 output_reg_3_ ( .D(n7), .SI(n1), .SE(test_se), .CLK(clk), .RSTB(n22), .Q(output0[3]), .QN(test_so) );
  SDFFARX1 output_reg_2_ ( .D(n9), .SI(n2), .SE(test_se), .CLK(clk), .RSTB(n22), .Q(output0[2]), .QN(n1) );
  SDFFARX1 output_reg_1_ ( .D(n10), .SI(n3), .SE(test_se), .CLK(clk), .RSTB(
        n22), .Q(output0[1]), .QN(n2) );
  SDFFARX1 output_reg_0_ ( .D(n11), .SI(test_si), .SE(test_se), .CLK(clk), 
        .RSTB(n22), .Q(output0[0]), .QN(n3) );
  INVX0 U2 ( .INP(load), .ZN(n21) );
  INVX0 U3 ( .INP(rst), .ZN(n22) );
endmodule


module gcd_test_1 ( rst, clk, go_i, x_i, y_i, d_o, test_si, test_so, test_se
 );
  input [3:0] x_i;
  input [3:0] y_i;
  output [3:0] d_o;
  input rst, clk, go_i, test_si, test_se;
  output test_so;
  wire   enable, xsel, ysel, xld, yld, n3, n4, n5;
  wire   [1:0] comparison;
  wire   [3:0] xsub;
  wire   [3:0] xmux;
  wire   [3:0] ysub;
  wire   [3:0] ymux;
  wire   [3:0] xreg;
  wire   [3:0] yreg;

  fsm_test_1 TOFSM ( .rst(rst), .clk(clk), .proceed(go_i), .comparison(
        comparison), .enable(enable), .xsel(xsel), .ysel(ysel), .xld(xld), 
        .yld(yld), .test_si(n5), .test_so(n4), .test_se(test_se) );
  mux_1 X_MUX ( .rst(rst), .sLine(xsel), .load(x_i), .result(xsub), .output0(
        xmux) );
  mux_0 Y_MUX ( .rst(rst), .sLine(ysel), .load(y_i), .result(ysub), .output0(
        ymux) );
  regis_test_0 X_REG ( .rst(rst), .clk(clk), .load(xld), .input0(xmux), 
        .output0(xreg), .test_si(n4), .test_so(n3), .test_se(test_se) );
  regis_test_1 Y_REG ( .rst(rst), .clk(clk), .load(yld), .input0(ymux), 
        .output0(yreg), .test_si(n3), .test_so(test_so), .test_se(test_se) );
  comparator U_COMP ( .rst(rst), .x(xreg), .y(yreg), .output0(comparison) );
  subtractor X_SUB ( .rst(rst), .cmd(comparison), .x(xreg), .y(yreg), .xout(
        xsub), .yout(ysub) );
  regis_test_2 OUT_REG ( .rst(rst), .clk(clk), .load(enable), .input0(xsub), 
        .output0(d_o), .test_si(test_si), .test_so(n5), .test_se(test_se) );
endmodule


module gcd_bsd ( rst, clk, go_i, x_i, y_i, d_o, test_si, test_so, test_se );
  input [3:0] x_i;
  input [3:0] y_i;
  output [3:0] d_o;
  input rst, clk, go_i, test_si, test_se;
  output test_so;
  wire   n1, n2, n6, n7, n8;

  gcd_test_1 M_GCD ( .rst(n2), .clk(clk), .go_i(go_i), .x_i(x_i), .y_i(y_i), 
        .d_o(d_o), .test_si(test_si), .test_so(test_so), .test_se(n7) );
  INVX0 U1 ( .INP(rst), .ZN(n1) );
  INVX0 U2 ( .INP(n1), .ZN(n2) );
  INVX0 U3 ( .INP(n8), .ZN(n6) );
  INVX0 U4 ( .INP(n6), .ZN(n7) );
  DELLN2X2 U5 ( .INP(test_se), .Z(n8) );
endmodule


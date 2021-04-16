/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Thu Apr 15 23:19:51 2021
/////////////////////////////////////////////////////////////


module fsm ( rst, clk, proceed, comparison, enable, ysel, xld, yld, xsel_BAR
 );
  input [1:0] comparison;
  input rst, clk, proceed;
  output enable, ysel, xld, yld, xsel_BAR;
  wire   nState_2_, n11, n14, n15, n1, n2, n4, n5, n6, n7, n8, n9, n10, n12,
         n13, n16;
  wire   [2:0] cState;

  DFFARX1 cState_reg_0_ ( .D(n15), .CLK(clk), .RSTB(n11), .Q(cState[0]), .QN(
        n13) );
  DFFARX1 cState_reg_1_ ( .D(n14), .CLK(clk), .RSTB(n11), .Q(cState[1]), .QN(
        n12) );
  DFFARX1 cState_reg_2_ ( .D(nState_2_), .CLK(clk), .RSTB(n11), .Q(cState[2]), 
        .QN(n16) );
  NAND2X0 U3 ( .IN1(n2), .IN2(n1), .QN(ysel) );
  NAND2X0 U4 ( .IN1(n6), .IN2(n2), .QN(yld) );
  NAND2X0 U5 ( .IN1(n6), .IN2(xsel_BAR), .QN(xld) );
  NAND2X0 U6 ( .IN1(n13), .IN2(cState[2]), .QN(xsel_BAR) );
  NOR2X0 U7 ( .IN1(n12), .IN2(xsel_BAR), .QN(enable) );
  NAND3X0 U8 ( .IN1(cState[0]), .IN2(cState[2]), .IN3(n12), .QN(n2) );
  INVX0 U9 ( .INP(enable), .ZN(n1) );
  NAND2X0 U10 ( .IN1(cState[1]), .IN2(n13), .QN(n6) );
  OAI21X1 U11 ( .IN1(comparison[1]), .IN2(comparison[0]), .IN3(cState[0]), 
        .QN(n9) );
  NAND2X0 U12 ( .IN1(n16), .IN2(cState[1]), .QN(n7) );
  NOR2X0 U13 ( .IN1(n9), .IN2(n7), .QN(nState_2_) );
  OR2X1 U14 ( .IN1(comparison[1]), .IN2(n12), .Q(n5) );
  NAND2X0 U15 ( .IN1(proceed), .IN2(n13), .QN(n4) );
  NAND4X0 U16 ( .IN1(n16), .IN2(n6), .IN3(n5), .IN4(n4), .QN(n15) );
  INVX0 U17 ( .INP(n7), .ZN(n8) );
  OA221X1 U18 ( .IN1(n9), .IN2(comparison[0]), .IN3(n9), .IN4(comparison[1]), 
        .IN5(n8), .Q(n10) );
  AO221X1 U19 ( .IN1(n12), .IN2(cState[0]), .IN3(n12), .IN4(cState[2]), .IN5(
        n10), .Q(n14) );
  INVX0 U20 ( .INP(rst), .ZN(n11) );
endmodule


module mux_1 ( rst, load, result, output0, sLine_BAR );
  input [3:0] load;
  input [3:0] result;
  output [3:0] output0;
  input rst, sLine_BAR;
  wire   n1, n2, n3;

  INVX0 U2 ( .INP(sLine_BAR), .ZN(n1) );
  NOR2X0 U3 ( .IN1(n1), .IN2(rst), .QN(n3) );
  NOR2X0 U4 ( .IN1(rst), .IN2(sLine_BAR), .QN(n2) );
  AO22X1 U5 ( .IN1(n3), .IN2(load[0]), .IN3(n2), .IN4(result[0]), .Q(
        output0[0]) );
  AO22X1 U6 ( .IN1(n3), .IN2(load[1]), .IN3(n2), .IN4(result[1]), .Q(
        output0[1]) );
  AO22X1 U7 ( .IN1(n3), .IN2(load[2]), .IN3(n2), .IN4(result[2]), .Q(
        output0[2]) );
  AO22X1 U8 ( .IN1(n3), .IN2(load[3]), .IN3(n2), .IN4(result[3]), .Q(
        output0[3]) );
endmodule


module regis_2 ( rst, clk, load, input0, output0 );
  input [3:0] input0;
  output [3:0] output0;
  input rst, clk, load;
  wire   n1, n2, n4, n6, n8;

  DFFARX1 output_reg_3_ ( .D(n8), .CLK(clk), .RSTB(n1), .Q(output0[3]) );
  DFFARX1 output_reg_2_ ( .D(n6), .CLK(clk), .RSTB(n1), .Q(output0[2]) );
  DFFARX1 output_reg_1_ ( .D(n4), .CLK(clk), .RSTB(n1), .Q(output0[1]) );
  DFFARX1 output_reg_0_ ( .D(n2), .CLK(clk), .RSTB(n1), .Q(output0[0]) );
  MUX21X1 U2 ( .IN1(output0[3]), .IN2(input0[3]), .S(load), .Q(n8) );
  MUX21X1 U3 ( .IN1(output0[2]), .IN2(input0[2]), .S(load), .Q(n6) );
  MUX21X1 U4 ( .IN1(output0[1]), .IN2(input0[1]), .S(load), .Q(n4) );
  INVX0 U5 ( .INP(rst), .ZN(n1) );
  MUX21X1 U6 ( .IN1(output0[0]), .IN2(input0[0]), .S(load), .Q(n2) );
endmodule


module comparator ( rst, x, y, output0 );
  input [3:0] x;
  input [3:0] y;
  output [1:0] output0;
  input rst;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20;

  NAND2X0 U3 ( .IN1(x[1]), .IN2(n4), .QN(n15) );
  INVX0 U5 ( .INP(y[3]), .ZN(n1) );
  NAND2X0 U6 ( .IN1(x[3]), .IN2(n1), .QN(n19) );
  NOR2X0 U7 ( .IN1(x[3]), .IN2(n1), .QN(n8) );
  INVX0 U8 ( .INP(y[2]), .ZN(n3) );
  NAND2X0 U9 ( .IN1(x[2]), .IN2(n3), .QN(n14) );
  INVX0 U10 ( .INP(n8), .ZN(n2) );
  OA21X1 U11 ( .IN1(x[2]), .IN2(n3), .IN3(n2), .Q(n17) );
  INVX0 U12 ( .INP(y[1]), .ZN(n4) );
  OR2X1 U13 ( .IN1(n4), .IN2(x[1]), .Q(n12) );
  INVX0 U14 ( .INP(x[0]), .ZN(n5) );
  NAND3X0 U15 ( .IN1(y[0]), .IN2(n15), .IN3(n5), .QN(n6) );
  NAND3X0 U16 ( .IN1(n17), .IN2(n12), .IN3(n6), .QN(n7) );
  OA221X1 U17 ( .IN1(1'b0), .IN2(n19), .IN3(n8), .IN4(n14), .IN5(n7), .Q(n10)
         );
  NOR2X0 U18 ( .IN1(rst), .IN2(n10), .QN(output0[1]) );
  INVX0 U19 ( .INP(y[0]), .ZN(n11) );
  NAND3X0 U20 ( .IN1(x[0]), .IN2(n12), .IN3(n11), .QN(n13) );
  NAND3X0 U21 ( .IN1(n15), .IN2(n14), .IN3(n13), .QN(n16) );
  NAND2X0 U22 ( .IN1(n17), .IN2(n16), .QN(n18) );
  NAND2X0 U23 ( .IN1(n19), .IN2(n18), .QN(n20) );
  NOR2X0 U24 ( .IN1(rst), .IN2(n20), .QN(output0[0]) );
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
         n31, n32, n33, n34, n35, n36, n37, n38;

  NAND2X0 U2 ( .IN1(n1), .IN2(x[0]), .QN(n3) );
  INVX0 U3 ( .INP(y[0]), .ZN(n1) );
  INVX0 U4 ( .INP(cmd[1]), .ZN(n6) );
  NOR2X0 U5 ( .IN1(n1), .IN2(x[0]), .QN(n17) );
  INVX0 U6 ( .INP(n17), .ZN(n21) );
  OA221X1 U7 ( .IN1(cmd[1]), .IN2(n3), .IN3(n6), .IN4(n1), .IN5(n21), .Q(n2)
         );
  INVX0 U8 ( .INP(cmd[0]), .ZN(n24) );
  AO21X1 U9 ( .IN1(n24), .IN2(n6), .IN3(rst), .Q(n38) );
  NOR2X0 U10 ( .IN1(n2), .IN2(n38), .QN(yout[0]) );
  INVX0 U11 ( .INP(y[1]), .ZN(n23) );
  INVX0 U12 ( .INP(n3), .ZN(n15) );
  INVX0 U13 ( .INP(x[1]), .ZN(n19) );
  OA221X1 U14 ( .IN1(x[1]), .IN2(n15), .IN3(n19), .IN4(n3), .IN5(n6), .Q(n4)
         );
  MUX21X1 U15 ( .IN1(n23), .IN2(y[1]), .S(n4), .Q(n5) );
  NOR2X0 U16 ( .IN1(n38), .IN2(n5), .QN(yout[1]) );
  INVX0 U17 ( .INP(y[2]), .ZN(n31) );
  NOR2X0 U18 ( .IN1(y[1]), .IN2(n19), .QN(n22) );
  OA22X1 U19 ( .IN1(x[1]), .IN2(n23), .IN3(n22), .IN4(n15), .Q(n10) );
  INVX0 U20 ( .INP(x[2]), .ZN(n27) );
  INVX0 U21 ( .INP(n10), .ZN(n7) );
  OA221X1 U22 ( .IN1(x[2]), .IN2(n10), .IN3(n27), .IN4(n7), .IN5(n6), .Q(n8)
         );
  MUX21X1 U23 ( .IN1(n31), .IN2(y[2]), .S(n8), .Q(n9) );
  NOR2X0 U24 ( .IN1(n38), .IN2(n9), .QN(yout[2]) );
  INVX0 U25 ( .INP(y[3]), .ZN(n33) );
  INVX0 U26 ( .INP(x[3]), .ZN(n36) );
  NOR2X0 U27 ( .IN1(y[2]), .IN2(n27), .QN(n30) );
  OA22X1 U28 ( .IN1(x[2]), .IN2(n31), .IN3(n30), .IN4(n10), .Q(n11) );
  MUX21X1 U29 ( .IN1(n36), .IN2(x[3]), .S(n11), .Q(n12) );
  NOR2X0 U30 ( .IN1(cmd[1]), .IN2(n12), .QN(n13) );
  MUX21X1 U31 ( .IN1(n33), .IN2(y[3]), .S(n13), .Q(n14) );
  NOR2X0 U32 ( .IN1(n38), .IN2(n14), .QN(yout[3]) );
  AOI221X1 U33 ( .IN1(n24), .IN2(n17), .IN3(cmd[0]), .IN4(x[0]), .IN5(n15), 
        .QN(n16) );
  NOR2X0 U34 ( .IN1(n16), .IN2(n38), .QN(xout[0]) );
  OA221X1 U35 ( .IN1(y[1]), .IN2(n17), .IN3(n23), .IN4(n21), .IN5(n24), .Q(n18) );
  MUX21X1 U36 ( .IN1(n19), .IN2(x[1]), .S(n18), .Q(n20) );
  NOR2X0 U37 ( .IN1(n38), .IN2(n20), .QN(xout[1]) );
  OA22X1 U38 ( .IN1(x[1]), .IN2(n23), .IN3(n22), .IN4(n21), .Q(n29) );
  INVX0 U39 ( .INP(n29), .ZN(n25) );
  OA221X1 U40 ( .IN1(y[2]), .IN2(n25), .IN3(n31), .IN4(n29), .IN5(n24), .Q(n26) );
  MUX21X1 U41 ( .IN1(n27), .IN2(x[2]), .S(n26), .Q(n28) );
  NOR2X0 U42 ( .IN1(n38), .IN2(n28), .QN(xout[2]) );
  OA22X1 U43 ( .IN1(x[2]), .IN2(n31), .IN3(n30), .IN4(n29), .Q(n32) );
  MUX21X1 U44 ( .IN1(y[3]), .IN2(n33), .S(n32), .Q(n34) );
  NOR2X0 U45 ( .IN1(cmd[0]), .IN2(n34), .QN(n35) );
  MUX21X1 U46 ( .IN1(n36), .IN2(x[3]), .S(n35), .Q(n37) );
  NOR2X0 U47 ( .IN1(n38), .IN2(n37), .QN(xout[3]) );
endmodule


module regis_0 ( rst, clk, load, input0, output0 );
  input [3:0] input0;
  output [3:0] output0;
  input rst, clk, load;
  wire   n3, n5, n6, n7, n8;

  DFFARX1 output_reg_3_ ( .D(n3), .CLK(clk), .RSTB(n8), .Q(output0[3]) );
  DFFARX1 output_reg_2_ ( .D(n5), .CLK(clk), .RSTB(n8), .Q(output0[2]) );
  DFFARX1 output_reg_1_ ( .D(n6), .CLK(clk), .RSTB(n8), .Q(output0[1]) );
  DFFARX1 output_reg_0_ ( .D(n7), .CLK(clk), .RSTB(n8), .Q(output0[0]) );
  MUX21X1 U2 ( .IN1(output0[3]), .IN2(input0[3]), .S(load), .Q(n3) );
  MUX21X1 U3 ( .IN1(output0[2]), .IN2(input0[2]), .S(load), .Q(n5) );
  MUX21X1 U4 ( .IN1(output0[1]), .IN2(input0[1]), .S(load), .Q(n6) );
  INVX0 U5 ( .INP(rst), .ZN(n8) );
  MUX21X1 U6 ( .IN1(output0[0]), .IN2(input0[0]), .S(load), .Q(n7) );
endmodule


module regis_1 ( rst, clk, load, input0, output0 );
  input [3:0] input0;
  output [3:0] output0;
  input rst, clk, load;
  wire   n3, n5, n6, n7, n8;

  DFFARX1 output_reg_3_ ( .D(n3), .CLK(clk), .RSTB(n8), .Q(output0[3]) );
  DFFARX1 output_reg_2_ ( .D(n5), .CLK(clk), .RSTB(n8), .Q(output0[2]) );
  DFFARX1 output_reg_1_ ( .D(n6), .CLK(clk), .RSTB(n8), .Q(output0[1]) );
  DFFARX1 output_reg_0_ ( .D(n7), .CLK(clk), .RSTB(n8), .Q(output0[0]) );
  MUX21X1 U2 ( .IN1(output0[3]), .IN2(input0[3]), .S(load), .Q(n3) );
  MUX21X1 U3 ( .IN1(output0[2]), .IN2(input0[2]), .S(load), .Q(n5) );
  MUX21X1 U4 ( .IN1(output0[1]), .IN2(input0[1]), .S(load), .Q(n6) );
  INVX0 U5 ( .INP(rst), .ZN(n8) );
  MUX21X1 U6 ( .IN1(output0[0]), .IN2(input0[0]), .S(load), .Q(n7) );
endmodule


module mux_0 ( rst, sLine, load, result, output0 );
  input [3:0] load;
  input [3:0] result;
  output [3:0] output0;
  input rst, sLine;
  wire   n1, n2, n3;

  NOR2X0 U2 ( .IN1(sLine), .IN2(rst), .QN(n3) );
  INVX0 U3 ( .INP(sLine), .ZN(n1) );
  NOR2X0 U4 ( .IN1(rst), .IN2(n1), .QN(n2) );
  AO22X1 U5 ( .IN1(n3), .IN2(load[0]), .IN3(n2), .IN4(result[0]), .Q(
        output0[0]) );
  AO22X1 U6 ( .IN1(n3), .IN2(load[1]), .IN3(n2), .IN4(result[1]), .Q(
        output0[1]) );
  AO22X1 U7 ( .IN1(n3), .IN2(load[2]), .IN3(n2), .IN4(result[2]), .Q(
        output0[2]) );
  AO22X1 U8 ( .IN1(n3), .IN2(load[3]), .IN3(n2), .IN4(result[3]), .Q(
        output0[3]) );
endmodule


module gcd ( rst, clk, go_i, x_i, y_i, d_o );
  input [3:0] x_i;
  input [3:0] y_i;
  output [3:0] d_o;
  input rst, clk, go_i;
  wire   enable, xsel, ysel, xld, yld, n1, n2;
  wire   [1:0] comparison;
  wire   [3:0] xsub;
  wire   [3:0] xmux;
  wire   [3:0] ysub;
  wire   [3:0] ymux;
  wire   [3:0] xreg;
  wire   [3:0] yreg;

  fsm TOFSM ( .rst(rst), .clk(clk), .proceed(go_i), .comparison(comparison), 
        .enable(enable), .ysel(ysel), .xld(xld), .yld(yld), .xsel_BAR(xsel) );
  mux_1 X_MUX ( .rst(rst), .load(x_i), .result(xsub), .output0(xmux), 
        .sLine_BAR(xsel) );
  mux_0 Y_MUX ( .rst(rst), .sLine(ysel), .load(y_i), .result(ysub), .output0(
        ymux) );
  regis_2 X_REG ( .rst(rst), .clk(clk), .load(xld), .input0(xmux), .output0(
        xreg) );
  regis_1 Y_REG ( .rst(n2), .clk(clk), .load(yld), .input0(ymux), .output0(
        yreg) );
  comparator U_COMP ( .rst(n2), .x(xreg), .y(yreg), .output0(comparison) );
  subtractor X_SUB ( .rst(rst), .cmd(comparison), .x(xreg), .y(yreg), .xout(
        xsub), .yout(ysub) );
  regis_0 OUT_REG ( .rst(rst), .clk(clk), .load(enable), .input0(xsub), 
        .output0(d_o) );
  INVX0 U1 ( .INP(rst), .ZN(n1) );
  INVX0 U2 ( .INP(n1), .ZN(n2) );
endmodule


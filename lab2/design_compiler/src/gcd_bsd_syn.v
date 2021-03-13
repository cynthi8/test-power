/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Fri Mar 12 21:19:38 2021
/////////////////////////////////////////////////////////////


module fsm ( rst, clk, proceed, comparison, enable, xsel, ysel, xld, yld );
  input [1:0] comparison;
  input rst, clk, proceed;
  output enable, xsel, ysel, xld, yld;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18;
  wire   [2:0] cState;
  wire   [2:0] nState;

  DFFARX1 cState_reg_0_ ( .D(nState[0]), .CLK(clk), .RSTB(n1), .Q(cState[0]), 
        .QN(n6) );
  DFFARX1 cState_reg_1_ ( .D(nState[1]), .CLK(clk), .RSTB(n1), .Q(cState[1]), 
        .QN(n5) );
  DFFARX1 cState_reg_2_ ( .D(nState[2]), .CLK(clk), .RSTB(n1), .Q(cState[2]), 
        .QN(n3) );
  INVX0 U3 ( .INP(rst), .ZN(n1) );
  OA21X1 U14 ( .IN1(n8), .IN2(n4), .IN3(cState[2]), .Q(ysel) );
  NAND3X0 U15 ( .IN1(n9), .IN2(n10), .IN3(n11), .QN(yld) );
  AND3X1 U16 ( .IN1(n13), .IN2(n3), .IN3(n14), .Q(nState[2]) );
  OR2X1 U17 ( .IN1(comparison[0]), .IN2(comparison[1]), .Q(n14) );
  NAND4X0 U18 ( .IN1(n15), .IN2(n16), .IN3(n10), .IN4(n12), .QN(nState[1]) );
  NAND3X0 U19 ( .IN1(cState[0]), .IN2(n3), .IN3(n17), .QN(n15) );
  XOR2X1 U20 ( .IN1(comparison[0]), .IN2(n7), .Q(n17) );
  AO221X1 U21 ( .IN1(proceed), .IN2(n6), .IN3(n13), .IN4(n7), .IN5(n18), .Q(
        nState[0]) );
  OR2X1 U22 ( .IN1(xld), .IN2(cState[2]), .Q(n18) );
  NAND3X0 U23 ( .IN1(n6), .IN2(n5), .IN3(cState[2]), .QN(n16) );
  NAND3X0 U24 ( .IN1(n6), .IN2(n3), .IN3(cState[1]), .QN(n10) );
  NAND3X0 U25 ( .IN1(cState[1]), .IN2(n6), .IN3(cState[2]), .QN(n9) );
  INVX0 U4 ( .INP(comparison[1]), .ZN(n7) );
  NAND2X1 U5 ( .IN1(n9), .IN2(n16), .QN(xsel) );
  INVX0 U6 ( .INP(n9), .ZN(enable) );
  NAND2X1 U7 ( .IN1(n10), .IN2(n2), .QN(xld) );
  INVX0 U8 ( .INP(xsel), .ZN(n2) );
  INVX0 U9 ( .INP(n12), .ZN(n4) );
  NAND2X1 U10 ( .IN1(n4), .IN2(cState[2]), .QN(n11) );
  NOR2X0 U11 ( .IN1(cState[0]), .IN2(n5), .QN(n8) );
  NAND2X1 U12 ( .IN1(cState[0]), .IN2(n5), .QN(n12) );
  NOR2X0 U13 ( .IN1(n6), .IN2(n5), .QN(n13) );
endmodule


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


module regis_2 ( rst, clk, load, input0, output0 );
  input [3:0] input0;
  output [3:0] output0;
  input rst, clk, load;
  wire   n1, n2, n3, n4, n5, n6;

  DFFARX1 output_reg_3_ ( .D(n6), .CLK(clk), .RSTB(n5), .Q(output0[3]) );
  DFFARX1 output_reg_2_ ( .D(n4), .CLK(clk), .RSTB(n5), .Q(output0[2]) );
  DFFARX1 output_reg_1_ ( .D(n3), .CLK(clk), .RSTB(n5), .Q(output0[1]) );
  DFFARX1 output_reg_0_ ( .D(n2), .CLK(clk), .RSTB(n5), .Q(output0[0]) );
  AO22X1 U2 ( .IN1(output0[0]), .IN2(n1), .IN3(load), .IN4(input0[0]), .Q(n2)
         );
  AO22X1 U3 ( .IN1(output0[1]), .IN2(n1), .IN3(input0[1]), .IN4(load), .Q(n3)
         );
  AO22X1 U4 ( .IN1(output0[2]), .IN2(n1), .IN3(input0[2]), .IN4(load), .Q(n4)
         );
  INVX0 U5 ( .INP(rst), .ZN(n5) );
  AO22X1 U6 ( .IN1(output0[3]), .IN2(n1), .IN3(input0[3]), .IN4(load), .Q(n6)
         );
  INVX0 U7 ( .INP(load), .ZN(n1) );
endmodule


module comparator ( rst, x, y, output0 );
  input [3:0] x;
  input [3:0] y;
  output [1:0] output0;
  input rst;
  wire   n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23;

  OA21X1 U17 ( .IN1(y[3]), .IN2(n7), .IN3(n13), .Q(n12) );
  NAND3X0 U18 ( .IN1(n14), .IN2(n15), .IN3(n16), .QN(n13) );
  AO21X1 U19 ( .IN1(n9), .IN2(n17), .IN3(n18), .Q(n15) );
  NAND3X0 U20 ( .IN1(n19), .IN2(n10), .IN3(y[0]), .QN(n17) );
  OA221X1 U21 ( .IN1(y[3]), .IN2(n7), .IN3(n6), .IN4(n21), .IN5(n5), .Q(
        output0[0]) );
  AOI21X1 U22 ( .IN1(n16), .IN2(n22), .IN3(n18), .QN(n21) );
  OR3X1 U23 ( .IN1(n10), .IN2(y[0]), .IN3(n20), .Q(n23) );
  INVX0 U3 ( .INP(n20), .ZN(n9) );
  INVX0 U4 ( .INP(n14), .ZN(n6) );
  INVX0 U5 ( .INP(rst), .ZN(n5) );
  NOR2X0 U6 ( .IN1(rst), .IN2(n12), .QN(output0[1]) );
  INVX0 U7 ( .INP(x[2]), .ZN(n8) );
  INVX0 U8 ( .INP(y[1]), .ZN(n11) );
  NOR2X0 U9 ( .IN1(n11), .IN2(x[1]), .QN(n20) );
  INVX0 U10 ( .INP(x[3]), .ZN(n7) );
  NOR2X0 U11 ( .IN1(n8), .IN2(y[2]), .QN(n18) );
  NAND2X1 U12 ( .IN1(x[1]), .IN2(n11), .QN(n19) );
  NAND2X1 U13 ( .IN1(y[3]), .IN2(n7), .QN(n14) );
  INVX0 U14 ( .INP(x[0]), .ZN(n10) );
  NAND2X1 U15 ( .IN1(y[2]), .IN2(n8), .QN(n16) );
  NAND2X1 U16 ( .IN1(n23), .IN2(n19), .QN(n22) );
endmodule


module subtractor ( rst, cmd, x, y, xout, yout );
  input [1:0] cmd;
  input [3:0] x;
  input [3:0] y;
  output [3:0] xout;
  output [3:0] yout;
  input rst;
  wire   n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50;

  NAND3X0 U31 ( .IN1(n5), .IN2(n18), .IN3(y[3]), .QN(n17) );
  NAND3X0 U32 ( .IN1(n19), .IN2(n13), .IN3(n20), .QN(n16) );
  XNOR2X1 U33 ( .IN1(x[3]), .IN2(n21), .Q(n19) );
  OA22X1 U34 ( .IN1(y[2]), .IN2(n22), .IN3(n23), .IN4(n8), .Q(n21) );
  AND2X1 U35 ( .IN1(n23), .IN2(n8), .Q(n22) );
  NAND3X0 U36 ( .IN1(n5), .IN2(n26), .IN3(y[2]), .QN(n25) );
  NAND3X0 U37 ( .IN1(n27), .IN2(n14), .IN3(n20), .QN(n24) );
  XNOR2X1 U38 ( .IN1(n23), .IN2(x[2]), .Q(n27) );
  AO22X1 U39 ( .IN1(n11), .IN2(n9), .IN3(y[1]), .IN4(n28), .Q(n23) );
  NAND3X0 U40 ( .IN1(y[1]), .IN2(n32), .IN3(n5), .QN(n31) );
  NAND3X0 U41 ( .IN1(n33), .IN2(n15), .IN3(n20), .QN(n30) );
  XNOR2X1 U42 ( .IN1(n9), .IN2(n29), .Q(n33) );
  AO22X1 U43 ( .IN1(n20), .IN2(n29), .IN3(n5), .IN4(n34), .Q(yout[0]) );
  AO21X1 U44 ( .IN1(y[0]), .IN2(cmd[1]), .IN3(n10), .Q(n34) );
  XOR2X1 U45 ( .IN1(n37), .IN2(x[3]), .Q(n36) );
  XNOR2X1 U46 ( .IN1(y[3]), .IN2(n39), .Q(n38) );
  OA22X1 U47 ( .IN1(n40), .IN2(n14), .IN3(x[2]), .IN4(n41), .Q(n39) );
  AND2X1 U48 ( .IN1(n41), .IN2(x[2]), .Q(n40) );
  XNOR2X1 U49 ( .IN1(x[2]), .IN2(n43), .Q(n42) );
  XNOR2X1 U50 ( .IN1(n41), .IN2(n14), .Q(n44) );
  AO22X1 U51 ( .IN1(x[1]), .IN2(n45), .IN3(n46), .IN4(n15), .Q(n41) );
  XNOR2X1 U52 ( .IN1(n48), .IN2(n9), .Q(n47) );
  XNOR2X1 U53 ( .IN1(n15), .IN2(n10), .Q(n49) );
  AO21X1 U54 ( .IN1(n7), .IN2(n6), .IN3(rst), .Q(n35) );
  OA221X1 U55 ( .IN1(n12), .IN2(n7), .IN3(cmd[0]), .IN4(n45), .IN5(n11), .Q(
        n50) );
  NAND2X1 U2 ( .IN1(n33), .IN2(n6), .QN(n32) );
  NOR2X0 U3 ( .IN1(n35), .IN2(cmd[1]), .QN(n20) );
  INVX0 U4 ( .INP(cmd[0]), .ZN(n7) );
  INVX0 U5 ( .INP(cmd[1]), .ZN(n6) );
  INVX0 U6 ( .INP(n35), .ZN(n5) );
  NOR2X0 U7 ( .IN1(n50), .IN2(n35), .QN(xout[0]) );
  NAND2X1 U8 ( .IN1(n27), .IN2(n6), .QN(n26) );
  NAND2X1 U9 ( .IN1(n19), .IN2(n6), .QN(n18) );
  NOR2X0 U10 ( .IN1(n47), .IN2(n35), .QN(xout[1]) );
  NAND2X1 U11 ( .IN1(n49), .IN2(n7), .QN(n48) );
  INVX0 U12 ( .INP(n45), .ZN(n10) );
  INVX0 U13 ( .INP(n29), .ZN(n11) );
  INVX0 U14 ( .INP(y[3]), .ZN(n13) );
  NAND2X1 U15 ( .IN1(n24), .IN2(n25), .QN(yout[2]) );
  NAND2X1 U16 ( .IN1(n16), .IN2(n17), .QN(yout[3]) );
  NAND2X1 U17 ( .IN1(n30), .IN2(n31), .QN(yout[1]) );
  NOR2X0 U18 ( .IN1(n42), .IN2(n35), .QN(xout[2]) );
  NOR2X0 U19 ( .IN1(cmd[0]), .IN2(n44), .QN(n43) );
  NOR2X0 U20 ( .IN1(n36), .IN2(n35), .QN(xout[3]) );
  NAND2X1 U21 ( .IN1(n38), .IN2(n7), .QN(n37) );
  NOR2X0 U22 ( .IN1(n12), .IN2(y[0]), .QN(n29) );
  INVX0 U23 ( .INP(x[1]), .ZN(n9) );
  INVX0 U24 ( .INP(x[0]), .ZN(n12) );
  INVX0 U25 ( .INP(x[2]), .ZN(n8) );
  NAND2X1 U26 ( .IN1(n10), .IN2(n9), .QN(n46) );
  NAND2X1 U27 ( .IN1(x[1]), .IN2(n29), .QN(n28) );
  INVX0 U28 ( .INP(y[1]), .ZN(n15) );
  NAND2X1 U29 ( .IN1(y[0]), .IN2(n12), .QN(n45) );
  INVX0 U30 ( .INP(y[2]), .ZN(n14) );
endmodule


module mux_0 ( rst, sLine, load, result, output0 );
  input [3:0] load;
  input [3:0] result;
  output [3:0] output0;
  input rst, sLine;
  wire   n4, n5, n6;

  AO22X1 U5 ( .IN1(result[3]), .IN2(n5), .IN3(load[3]), .IN4(n4), .Q(
        output0[3]) );
  AO22X1 U6 ( .IN1(result[2]), .IN2(n5), .IN3(load[2]), .IN4(n4), .Q(
        output0[2]) );
  AO22X1 U7 ( .IN1(result[1]), .IN2(n5), .IN3(load[1]), .IN4(n4), .Q(
        output0[1]) );
  AO22X1 U8 ( .IN1(result[0]), .IN2(n5), .IN3(load[0]), .IN4(n4), .Q(
        output0[0]) );
  NOR2X0 U2 ( .IN1(n6), .IN2(rst), .QN(n5) );
  INVX0 U3 ( .INP(sLine), .ZN(n6) );
  NOR2X0 U4 ( .IN1(rst), .IN2(sLine), .QN(n4) );
endmodule


module regis_0 ( rst, clk, load, input0, output0 );
  input [3:0] input0;
  output [3:0] output0;
  input rst, clk, load;
  wire   n7, n8, n9, n10, n11, n12;

  DFFARX1 output_reg_3_ ( .D(n7), .CLK(clk), .RSTB(n8), .Q(output0[3]) );
  DFFARX1 output_reg_2_ ( .D(n9), .CLK(clk), .RSTB(n8), .Q(output0[2]) );
  DFFARX1 output_reg_1_ ( .D(n10), .CLK(clk), .RSTB(n8), .Q(output0[1]) );
  DFFARX1 output_reg_0_ ( .D(n11), .CLK(clk), .RSTB(n8), .Q(output0[0]) );
  AO22X1 U2 ( .IN1(output0[0]), .IN2(n12), .IN3(load), .IN4(input0[0]), .Q(n11) );
  AO22X1 U3 ( .IN1(output0[1]), .IN2(n12), .IN3(input0[1]), .IN4(load), .Q(n10) );
  AO22X1 U4 ( .IN1(output0[2]), .IN2(n12), .IN3(input0[2]), .IN4(load), .Q(n9)
         );
  INVX0 U5 ( .INP(rst), .ZN(n8) );
  AO22X1 U6 ( .IN1(output0[3]), .IN2(n12), .IN3(input0[3]), .IN4(load), .Q(n7)
         );
  INVX0 U7 ( .INP(load), .ZN(n12) );
endmodule


module regis_1 ( rst, clk, load, input0, output0 );
  input [3:0] input0;
  output [3:0] output0;
  input rst, clk, load;
  wire   n7, n8, n9, n10, n11, n12;

  DFFARX1 output_reg_3_ ( .D(n7), .CLK(clk), .RSTB(n8), .Q(output0[3]) );
  DFFARX1 output_reg_2_ ( .D(n9), .CLK(clk), .RSTB(n8), .Q(output0[2]) );
  DFFARX1 output_reg_1_ ( .D(n10), .CLK(clk), .RSTB(n8), .Q(output0[1]) );
  DFFARX1 output_reg_0_ ( .D(n11), .CLK(clk), .RSTB(n8), .Q(output0[0]) );
  AO22X1 U2 ( .IN1(output0[0]), .IN2(n12), .IN3(load), .IN4(input0[0]), .Q(n11) );
  AO22X1 U3 ( .IN1(output0[1]), .IN2(n12), .IN3(input0[1]), .IN4(load), .Q(n10) );
  AO22X1 U4 ( .IN1(output0[2]), .IN2(n12), .IN3(input0[2]), .IN4(load), .Q(n9)
         );
  INVX0 U5 ( .INP(rst), .ZN(n8) );
  AO22X1 U6 ( .IN1(output0[3]), .IN2(n12), .IN3(input0[3]), .IN4(load), .Q(n7)
         );
  INVX0 U7 ( .INP(load), .ZN(n12) );
endmodule


module gcd ( rst, clk, go_i, x_i, y_i, d_o );
  input [3:0] x_i;
  input [3:0] y_i;
  output [3:0] d_o;
  input rst, clk, go_i;
  wire   enable, xsel, ysel, xld, yld;
  wire   [1:0] comparison;
  wire   [3:0] xsub;
  wire   [3:0] xmux;
  wire   [3:0] ysub;
  wire   [3:0] ymux;
  wire   [3:0] xreg;
  wire   [3:0] yreg;

  fsm TOFSM ( .rst(rst), .clk(clk), .proceed(go_i), .comparison(comparison), 
        .enable(enable), .xsel(xsel), .ysel(ysel), .xld(xld), .yld(yld) );
  mux_1 X_MUX ( .rst(rst), .sLine(xsel), .load(x_i), .result(xsub), .output0(
        xmux) );
  mux_0 Y_MUX ( .rst(rst), .sLine(ysel), .load(y_i), .result(ysub), .output0(
        ymux) );
  regis_2 X_REG ( .rst(rst), .clk(clk), .load(xld), .input0(xmux), .output0(
        xreg) );
  regis_1 Y_REG ( .rst(rst), .clk(clk), .load(yld), .input0(ymux), .output0(
        yreg) );
  comparator U_COMP ( .rst(rst), .x(xreg), .y(yreg), .output0(comparison) );
  subtractor X_SUB ( .rst(rst), .cmd(comparison), .x(xreg), .y(yreg), .xout(
        xsub), .yout(ysub) );
  regis_0 OUT_REG ( .rst(rst), .clk(clk), .load(enable), .input0(xsub), 
        .output0(d_o) );
endmodule


module gcd_bsd ( rst, clk, go_i, x_i, y_i, d_o );
  input [3:0] x_i;
  input [3:0] y_i;
  output [3:0] d_o;
  input rst, clk, go_i;


  gcd M_GCD ( .rst(rst), .clk(clk), .go_i(go_i), .x_i(x_i), .y_i(y_i), .d_o(
        d_o) );
endmodule


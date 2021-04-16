/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Thu Apr 15 22:31:42 2021
/////////////////////////////////////////////////////////////


module mux_1 ( rst, load, result, output0, sLine_BAR );
  input [3:0] load;
  input [3:0] result;
  output [3:0] output0;
  input rst, sLine_BAR;
  wire   n4, n5, n6;

  NOR2X0 U2 ( .IN1(sLine_BAR), .IN2(rst), .QN(n6) );
  INVX0 U3 ( .INP(sLine_BAR), .ZN(n4) );
  NOR2X0 U4 ( .IN1(rst), .IN2(n4), .QN(n5) );
  AO22X1 U5 ( .IN1(n6), .IN2(result[0]), .IN3(n5), .IN4(load[0]), .Q(
        output0[0]) );
  AO22X1 U6 ( .IN1(n6), .IN2(result[1]), .IN3(n5), .IN4(load[1]), .Q(
        output0[1]) );
  AO22X1 U7 ( .IN1(n6), .IN2(result[2]), .IN3(n5), .IN4(load[2]), .Q(
        output0[2]) );
  AO22X1 U8 ( .IN1(n6), .IN2(result[3]), .IN3(n5), .IN4(load[3]), .Q(
        output0[3]) );
endmodule


module mux_0 ( rst, sLine, load, result, output0 );
  input [3:0] load;
  input [3:0] result;
  output [3:0] output0;
  input rst, sLine;
  wire   n4, n5, n6;

  NOR2X0 U2 ( .IN1(sLine), .IN2(rst), .QN(n6) );
  INVX0 U3 ( .INP(sLine), .ZN(n4) );
  NOR2X0 U4 ( .IN1(rst), .IN2(n4), .QN(n5) );
  AO22X1 U5 ( .IN1(n6), .IN2(load[0]), .IN3(n5), .IN4(result[0]), .Q(
        output0[0]) );
  AO22X1 U6 ( .IN1(n6), .IN2(load[1]), .IN3(n5), .IN4(result[1]), .Q(
        output0[1]) );
  AO22X1 U7 ( .IN1(n6), .IN2(load[2]), .IN3(n5), .IN4(result[2]), .Q(
        output0[2]) );
  AO22X1 U8 ( .IN1(n6), .IN2(load[3]), .IN3(n5), .IN4(result[3]), .Q(
        output0[3]) );
endmodule


module comparator ( rst, x, y, output0 );
  input [3:0] x;
  input [3:0] y;
  output [1:0] output0;
  input rst;
  wire   n22, n23, n24, n25, n26, n27, n28, n29, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41;

  INVX0 U4 ( .INP(y[3]), .ZN(n22) );
  NAND2X0 U5 ( .IN1(x[3]), .IN2(n22), .QN(n40) );
  NOR2X0 U6 ( .IN1(x[3]), .IN2(n22), .QN(n29) );
  INVX0 U7 ( .INP(y[2]), .ZN(n24) );
  NAND2X0 U8 ( .IN1(x[2]), .IN2(n24), .QN(n35) );
  INVX0 U9 ( .INP(n29), .ZN(n23) );
  OA21X1 U10 ( .IN1(x[2]), .IN2(n24), .IN3(n23), .Q(n38) );
  INVX0 U11 ( .INP(x[1]), .ZN(n25) );
  NAND2X0 U12 ( .IN1(y[1]), .IN2(n25), .QN(n33) );
  INVX0 U13 ( .INP(x[0]), .ZN(n26) );
  OR2X1 U14 ( .IN1(n25), .IN2(y[1]), .Q(n36) );
  NAND3X0 U15 ( .IN1(y[0]), .IN2(n26), .IN3(n36), .QN(n27) );
  NAND3X0 U16 ( .IN1(n38), .IN2(n33), .IN3(n27), .QN(n28) );
  OA221X1 U17 ( .IN1(1'b0), .IN2(n40), .IN3(n29), .IN4(n35), .IN5(n28), .Q(n31) );
  NOR2X0 U18 ( .IN1(rst), .IN2(n31), .QN(output0[1]) );
  INVX0 U19 ( .INP(y[0]), .ZN(n32) );
  NAND3X0 U20 ( .IN1(x[0]), .IN2(n33), .IN3(n32), .QN(n34) );
  NAND3X0 U21 ( .IN1(n36), .IN2(n35), .IN3(n34), .QN(n37) );
  NAND2X0 U22 ( .IN1(n38), .IN2(n37), .QN(n39) );
  NAND2X0 U23 ( .IN1(n40), .IN2(n39), .QN(n41) );
  NOR2X0 U24 ( .IN1(rst), .IN2(n41), .QN(output0[0]) );
endmodule


module subtractor ( rst, cmd, x, y, xout, yout );
  input [1:0] cmd;
  input [3:0] x;
  input [3:0] y;
  output [3:0] xout;
  output [3:0] yout;
  input rst;
  wire   n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76;

  INVX0 U2 ( .INP(y[0]), .ZN(n39) );
  NAND2X0 U3 ( .IN1(n39), .IN2(x[0]), .QN(n41) );
  INVX0 U4 ( .INP(cmd[1]), .ZN(n44) );
  NOR2X0 U5 ( .IN1(n39), .IN2(x[0]), .QN(n55) );
  INVX0 U6 ( .INP(n55), .ZN(n59) );
  OA221X1 U7 ( .IN1(cmd[1]), .IN2(n41), .IN3(n44), .IN4(n39), .IN5(n59), .Q(
        n40) );
  INVX0 U8 ( .INP(cmd[0]), .ZN(n62) );
  AO21X1 U9 ( .IN1(n62), .IN2(n44), .IN3(rst), .Q(n76) );
  NOR2X0 U10 ( .IN1(n40), .IN2(n76), .QN(yout[0]) );
  INVX0 U11 ( .INP(y[1]), .ZN(n61) );
  INVX0 U12 ( .INP(n41), .ZN(n53) );
  INVX0 U13 ( .INP(x[1]), .ZN(n57) );
  OA221X1 U14 ( .IN1(x[1]), .IN2(n53), .IN3(n57), .IN4(n41), .IN5(n44), .Q(n42) );
  MUX21X1 U15 ( .IN1(n61), .IN2(y[1]), .S(n42), .Q(n43) );
  NOR2X0 U16 ( .IN1(n76), .IN2(n43), .QN(yout[1]) );
  INVX0 U17 ( .INP(y[2]), .ZN(n69) );
  NOR2X0 U18 ( .IN1(y[1]), .IN2(n57), .QN(n60) );
  OA22X1 U19 ( .IN1(x[1]), .IN2(n61), .IN3(n60), .IN4(n53), .Q(n48) );
  INVX0 U20 ( .INP(x[2]), .ZN(n65) );
  INVX0 U21 ( .INP(n48), .ZN(n45) );
  OA221X1 U22 ( .IN1(x[2]), .IN2(n48), .IN3(n65), .IN4(n45), .IN5(n44), .Q(n46) );
  MUX21X1 U23 ( .IN1(n69), .IN2(y[2]), .S(n46), .Q(n47) );
  NOR2X0 U24 ( .IN1(n76), .IN2(n47), .QN(yout[2]) );
  INVX0 U25 ( .INP(y[3]), .ZN(n71) );
  INVX0 U26 ( .INP(x[3]), .ZN(n74) );
  NOR2X0 U27 ( .IN1(y[2]), .IN2(n65), .QN(n68) );
  OA22X1 U28 ( .IN1(x[2]), .IN2(n69), .IN3(n68), .IN4(n48), .Q(n49) );
  MUX21X1 U29 ( .IN1(n74), .IN2(x[3]), .S(n49), .Q(n50) );
  NOR2X0 U30 ( .IN1(cmd[1]), .IN2(n50), .QN(n51) );
  MUX21X1 U31 ( .IN1(n71), .IN2(y[3]), .S(n51), .Q(n52) );
  NOR2X0 U32 ( .IN1(n76), .IN2(n52), .QN(yout[3]) );
  AOI221X1 U33 ( .IN1(n62), .IN2(n55), .IN3(cmd[0]), .IN4(x[0]), .IN5(n53), 
        .QN(n54) );
  NOR2X0 U34 ( .IN1(n54), .IN2(n76), .QN(xout[0]) );
  OA221X1 U35 ( .IN1(y[1]), .IN2(n55), .IN3(n61), .IN4(n59), .IN5(n62), .Q(n56) );
  MUX21X1 U36 ( .IN1(n57), .IN2(x[1]), .S(n56), .Q(n58) );
  NOR2X0 U37 ( .IN1(n76), .IN2(n58), .QN(xout[1]) );
  OA22X1 U38 ( .IN1(x[1]), .IN2(n61), .IN3(n60), .IN4(n59), .Q(n67) );
  INVX0 U39 ( .INP(n67), .ZN(n63) );
  OA221X1 U40 ( .IN1(y[2]), .IN2(n63), .IN3(n69), .IN4(n67), .IN5(n62), .Q(n64) );
  MUX21X1 U41 ( .IN1(n65), .IN2(x[2]), .S(n64), .Q(n66) );
  NOR2X0 U42 ( .IN1(n76), .IN2(n66), .QN(xout[2]) );
  OA22X1 U43 ( .IN1(x[2]), .IN2(n69), .IN3(n68), .IN4(n67), .Q(n70) );
  MUX21X1 U44 ( .IN1(y[3]), .IN2(n71), .S(n70), .Q(n72) );
  NOR2X0 U45 ( .IN1(cmd[0]), .IN2(n72), .QN(n73) );
  MUX21X1 U46 ( .IN1(n74), .IN2(x[3]), .S(n73), .Q(n75) );
  NOR2X0 U47 ( .IN1(n76), .IN2(n75), .QN(xout[3]) );
endmodule


module fsm ( rst, clk, proceed, comparison, enable, ysel, xld, yld, xsel_BAR
 );
  input [1:0] comparison;
  input rst, clk, proceed;
  output enable, ysel, xld, yld, xsel_BAR;
  wire   nState_2_, n14, n15, n12, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26;
  wire   [2:0] cState;

  DFFARX1 cState_reg_0_ ( .D(n15), .CLK(clk), .RSTB(n16), .Q(cState[0]), .QN(
        n26) );
  DFFARX1 cState_reg_1_ ( .D(n14), .CLK(clk), .RSTB(n16), .QN(n12) );
  DFFARX1 cState_reg_2_ ( .D(nState_2_), .CLK(clk), .RSTB(n16), .Q(cState[2])
         );
  NAND2X0 U3 ( .IN1(cState[2]), .IN2(n26), .QN(xsel_BAR) );
  NOR2X0 U4 ( .IN1(cState[0]), .IN2(n12), .QN(n22) );
  INVX0 U5 ( .INP(n22), .ZN(n17) );
  NAND2X0 U6 ( .IN1(xsel_BAR), .IN2(n17), .QN(xld) );
  NOR2X0 U7 ( .IN1(n12), .IN2(xsel_BAR), .QN(enable) );
  AND3X1 U8 ( .IN1(cState[2]), .IN2(cState[0]), .IN3(n12), .Q(n18) );
  OR2X1 U9 ( .IN1(n18), .IN2(enable), .Q(ysel) );
  OR2X1 U10 ( .IN1(n18), .IN2(n22), .Q(yld) );
  OAI21X1 U11 ( .IN1(comparison[1]), .IN2(comparison[0]), .IN3(cState[0]), 
        .QN(n24) );
  NOR2X0 U12 ( .IN1(cState[2]), .IN2(n12), .QN(n23) );
  INVX0 U13 ( .INP(n23), .ZN(n19) );
  NOR2X0 U14 ( .IN1(n24), .IN2(n19), .QN(nState_2_) );
  NOR2X0 U15 ( .IN1(n12), .IN2(comparison[1]), .QN(n21) );
  AND2X1 U16 ( .IN1(proceed), .IN2(n26), .Q(n20) );
  OR4X1 U17 ( .IN1(cState[2]), .IN2(n22), .IN3(n21), .IN4(n20), .Q(n15) );
  OA221X1 U18 ( .IN1(n24), .IN2(comparison[0]), .IN3(n24), .IN4(comparison[1]), 
        .IN5(n23), .Q(n25) );
  AO221X1 U19 ( .IN1(n12), .IN2(cState[2]), .IN3(n12), .IN4(cState[0]), .IN5(
        n25), .Q(n14) );
  INVX0 U20 ( .INP(rst), .ZN(n16) );
endmodule


module SNPS_CLOCK_GATE_HIGH_regis_2_0 ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   n1, n2;

  AND2X1 main_gate ( .IN1(n2), .IN2(CLK), .Q(ENCLK) );
  LATCHX1 latch ( .CLK(n1), .D(EN), .Q(n2) );
  INVX0 U1 ( .INP(CLK), .ZN(n1) );
endmodule


module regis_2 ( rst, clk, load, input0, output0 );
  input [3:0] input0;
  output [3:0] output0;
  input rst, clk, load;
  wire   n1, n2;

  DFFARX1 output_reg_3_ ( .D(input0[3]), .CLK(n2), .RSTB(n1), .Q(output0[3])
         );
  DFFARX1 output_reg_2_ ( .D(input0[2]), .CLK(n2), .RSTB(n1), .Q(output0[2])
         );
  DFFARX1 output_reg_1_ ( .D(input0[1]), .CLK(n2), .RSTB(n1), .Q(output0[1])
         );
  DFFARX1 output_reg_0_ ( .D(input0[0]), .CLK(n2), .RSTB(n1), .Q(output0[0])
         );
  INVX0 U2 ( .INP(rst), .ZN(n1) );
  SNPS_CLOCK_GATE_HIGH_regis_2_0 clk_gate_output_reg ( .CLK(clk), .EN(load), 
        .ENCLK(n2) );
endmodule


module SNPS_CLOCK_GATE_HIGH_regis_1_0 ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   n1, n2;

  AND2X1 main_gate ( .IN1(n2), .IN2(CLK), .Q(ENCLK) );
  LATCHX1 latch ( .CLK(n1), .D(EN), .Q(n2) );
  INVX0 U1 ( .INP(CLK), .ZN(n1) );
endmodule


module regis_1 ( rst, clk, load, input0, output0 );
  input [3:0] input0;
  output [3:0] output0;
  input rst, clk, load;
  wire   n1, n9;

  DFFARX1 output_reg_3_ ( .D(input0[3]), .CLK(n9), .RSTB(n1), .Q(output0[3])
         );
  DFFARX1 output_reg_2_ ( .D(input0[2]), .CLK(n9), .RSTB(n1), .Q(output0[2])
         );
  DFFARX1 output_reg_1_ ( .D(input0[1]), .CLK(n9), .RSTB(n1), .Q(output0[1])
         );
  DFFARX1 output_reg_0_ ( .D(input0[0]), .CLK(n9), .RSTB(n1), .Q(output0[0])
         );
  INVX0 U2 ( .INP(rst), .ZN(n1) );
  SNPS_CLOCK_GATE_HIGH_regis_1_0 clk_gate_output_reg ( .CLK(clk), .EN(load), 
        .ENCLK(n9) );
endmodule


module SNPS_CLOCK_GATE_HIGH_regis_0_0 ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   n1, n2;

  AND2X1 main_gate ( .IN1(n2), .IN2(CLK), .Q(ENCLK) );
  LATCHX1 latch ( .CLK(n1), .D(EN), .Q(n2) );
  INVX0 U1 ( .INP(CLK), .ZN(n1) );
endmodule


module regis_0 ( rst, clk, load, input0, output0 );
  input [3:0] input0;
  output [3:0] output0;
  input rst, clk, load;
  wire   n1, n9;

  DFFARX1 output_reg_3_ ( .D(input0[3]), .CLK(n9), .RSTB(n1), .Q(output0[3])
         );
  DFFARX1 output_reg_2_ ( .D(input0[2]), .CLK(n9), .RSTB(n1), .Q(output0[2])
         );
  DFFARX1 output_reg_1_ ( .D(input0[1]), .CLK(n9), .RSTB(n1), .Q(output0[1])
         );
  DFFARX1 output_reg_0_ ( .D(input0[0]), .CLK(n9), .RSTB(n1), .Q(output0[0])
         );
  INVX0 U2 ( .INP(rst), .ZN(n1) );
  SNPS_CLOCK_GATE_HIGH_regis_0_0 clk_gate_output_reg ( .CLK(clk), .EN(load), 
        .ENCLK(n9) );
endmodule


module gcd ( rst, clk, go_i, x_i, y_i, d_o );
  input [3:0] x_i;
  input [3:0] y_i;
  output [3:0] d_o;
  input rst, clk, go_i;
  wire   enable, xsel, ysel, xld, yld, n3, n4;
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
  regis_1 Y_REG ( .rst(rst), .clk(clk), .load(yld), .input0(ymux), .output0(
        yreg) );
  comparator U_COMP ( .rst(n4), .x(xreg), .y(yreg), .output0(comparison) );
  subtractor X_SUB ( .rst(rst), .cmd(comparison), .x(xreg), .y(yreg), .xout(
        xsub), .yout(ysub) );
  regis_0 OUT_REG ( .rst(n4), .clk(clk), .load(enable), .input0(xsub), 
        .output0(d_o) );
  INVX0 U1 ( .INP(rst), .ZN(n3) );
  INVX0 U2 ( .INP(n3), .ZN(n4) );
endmodule


/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Thu Apr 15 22:51:00 2021
/////////////////////////////////////////////////////////////


module SNPS_CLOCK_GATE_HIGH_regis_0_0 ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   net4210, n1;

  AND2X1 main_gate ( .IN1(net4210), .IN2(CLK), .Q(ENCLK) );
  LATCHX1 latch ( .CLK(n1), .D(EN), .Q(net4210) );
  INVX0 U2 ( .INP(CLK), .ZN(n1) );
endmodule


module SNPS_CLOCK_GATE_HIGH_regis_0_1 ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   net4210, n2;

  AND2X1 main_gate ( .IN1(net4210), .IN2(CLK), .Q(ENCLK) );
  LATCHX1 latch ( .CLK(n2), .D(EN), .Q(net4210) );
  INVX0 U2 ( .INP(CLK), .ZN(n2) );
endmodule


module SNPS_CLOCK_GATE_HIGH_regis_0_2 ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   net4210, n2;

  AND2X1 main_gate ( .IN1(net4210), .IN2(CLK), .Q(ENCLK) );
  LATCHX1 latch ( .CLK(n2), .D(EN), .Q(net4210) );
  INVX0 U2 ( .INP(CLK), .ZN(n2) );
endmodule


module gcd ( rst, clk, go_i, x_i, y_i, d_o );
  input [3:0] x_i;
  input [3:0] y_i;
  output [3:0] d_o;
  input rst, clk, go_i;
  wire   enable, TOFSM_nState_2_, OUT_REG_net4216, X_REG_net4216,
         Y_REG_net4216, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123;
  wire   [3:0] xsub;
  wire   [3:0] xmux;
  wire   [3:0] ymux;
  wire   [3:0] xreg;
  wire   [3:1] yreg;
  wire   [2:0] TOFSM_cState;

  SNPS_CLOCK_GATE_HIGH_regis_0_0 OUT_REG_clk_gate_output_reg ( .CLK(clk), .EN(
        enable), .ENCLK(OUT_REG_net4216) );
  SNPS_CLOCK_GATE_HIGH_regis_0_2 X_REG_clk_gate_output_reg ( .CLK(clk), .EN(
        n67), .ENCLK(X_REG_net4216) );
  SNPS_CLOCK_GATE_HIGH_regis_0_1 Y_REG_clk_gate_output_reg ( .CLK(clk), .EN(
        n66), .ENCLK(Y_REG_net4216) );
  DFFARX1 Y_REG_output_reg_3_ ( .D(ymux[3]), .CLK(Y_REG_net4216), .RSTB(n63), 
        .Q(yreg[3]), .QN(n123) );
  DFFARX1 TOFSM_cState_reg_1_ ( .D(n64), .CLK(clk), .RSTB(n63), .Q(
        TOFSM_cState[1]), .QN(n118) );
  DFFARX1 Y_REG_output_reg_0_ ( .D(ymux[0]), .CLK(Y_REG_net4216), .RSTB(n63), 
        .QN(n121) );
  DFFARX1 Y_REG_output_reg_2_ ( .D(ymux[2]), .CLK(Y_REG_net4216), .RSTB(n63), 
        .Q(yreg[2]), .QN(n122) );
  DFFARX1 TOFSM_cState_reg_0_ ( .D(n65), .CLK(clk), .RSTB(n63), .Q(
        TOFSM_cState[0]), .QN(n115) );
  DFFARX1 TOFSM_cState_reg_2_ ( .D(TOFSM_nState_2_), .CLK(clk), .RSTB(n63), 
        .Q(TOFSM_cState[2]), .QN(n119) );
  DFFARX1 X_REG_output_reg_0_ ( .D(xmux[0]), .CLK(X_REG_net4216), .RSTB(n63), 
        .Q(xreg[0]) );
  DFFARX1 OUT_REG_output_reg_0_ ( .D(xsub[0]), .CLK(OUT_REG_net4216), .RSTB(
        n63), .Q(d_o[0]) );
  DFFARX1 OUT_REG_output_reg_1_ ( .D(xsub[1]), .CLK(OUT_REG_net4216), .RSTB(
        n63), .Q(d_o[1]) );
  DFFARX1 X_REG_output_reg_1_ ( .D(xmux[1]), .CLK(X_REG_net4216), .RSTB(n63), 
        .Q(xreg[1]), .QN(n120) );
  DFFARX1 Y_REG_output_reg_1_ ( .D(ymux[1]), .CLK(Y_REG_net4216), .RSTB(n63), 
        .Q(yreg[1]), .QN(n116) );
  DFFARX1 OUT_REG_output_reg_2_ ( .D(xsub[2]), .CLK(OUT_REG_net4216), .RSTB(
        n63), .Q(d_o[2]) );
  DFFARX1 X_REG_output_reg_2_ ( .D(xmux[2]), .CLK(X_REG_net4216), .RSTB(n63), 
        .Q(xreg[2]), .QN(n117) );
  DFFARX1 OUT_REG_output_reg_3_ ( .D(xsub[3]), .CLK(OUT_REG_net4216), .RSTB(
        n63), .Q(d_o[3]) );
  DFFARX1 X_REG_output_reg_3_ ( .D(xmux[3]), .CLK(X_REG_net4216), .RSTB(n63), 
        .Q(xreg[3]) );
  NAND2X0 U82 ( .IN1(yreg[2]), .IN2(n68), .QN(n100) );
  NAND2X0 U83 ( .IN1(n81), .IN2(xreg[0]), .QN(n82) );
  NAND2X0 U84 ( .IN1(n108), .IN2(TOFSM_cState[1]), .QN(n109) );
  NAND2X0 U85 ( .IN1(n95), .IN2(n91), .QN(n67) );
  INVX0 U86 ( .INP(rst), .ZN(n63) );
  NAND2X0 U87 ( .IN1(TOFSM_cState[1]), .IN2(n115), .QN(n95) );
  NAND2X0 U88 ( .IN1(n115), .IN2(TOFSM_cState[2]), .QN(n91) );
  OA221X1 U89 ( .IN1(n118), .IN2(n115), .IN3(TOFSM_cState[1]), .IN4(
        TOFSM_cState[0]), .IN5(TOFSM_cState[2]), .Q(n70) );
  AND2X1 U90 ( .IN1(n63), .IN2(n70), .Q(n85) );
  NOR2X0 U91 ( .IN1(xreg[0]), .IN2(n121), .QN(n97) );
  AO222X1 U92 ( .IN1(n97), .IN2(yreg[1]), .IN3(n97), .IN4(n120), .IN5(yreg[1]), 
        .IN6(n120), .Q(n68) );
  NOR2X0 U93 ( .IN1(yreg[2]), .IN2(n68), .QN(n102) );
  OA21X1 U94 ( .IN1(xreg[2]), .IN2(n102), .IN3(n100), .Q(n89) );
  AO222X1 U95 ( .IN1(xreg[3]), .IN2(n89), .IN3(xreg[3]), .IN4(n123), .IN5(n89), 
        .IN6(n123), .Q(n107) );
  NOR2X0 U96 ( .IN1(rst), .IN2(n107), .QN(n81) );
  INVX0 U97 ( .INP(n81), .ZN(n113) );
  NAND2X0 U98 ( .IN1(xreg[0]), .IN2(n121), .QN(n92) );
  NOR2X0 U99 ( .IN1(n120), .IN2(n92), .QN(n76) );
  NAND2X0 U100 ( .IN1(n120), .IN2(n92), .QN(n78) );
  OA21X1 U101 ( .IN1(n76), .IN2(n116), .IN3(n78), .Q(n73) );
  AO222X1 U102 ( .IN1(xreg[2]), .IN2(n73), .IN3(xreg[2]), .IN4(n122), .IN5(n73), .IN6(n122), .Q(n87) );
  NOR2X0 U103 ( .IN1(xreg[3]), .IN2(n87), .QN(n69) );
  OA21X1 U104 ( .IN1(n113), .IN2(n69), .IN3(yreg[3]), .Q(n71) );
  NOR2X0 U105 ( .IN1(rst), .IN2(n70), .QN(n83) );
  AO22X1 U106 ( .IN1(n85), .IN2(n71), .IN3(n83), .IN4(y_i[3]), .Q(ymux[3]) );
  INVX0 U107 ( .INP(n73), .ZN(n72) );
  OA221X1 U108 ( .IN1(xreg[2]), .IN2(n73), .IN3(n117), .IN4(n72), .IN5(n81), 
        .Q(n74) );
  MUX21X1 U109 ( .IN1(yreg[2]), .IN2(n122), .S(n74), .Q(n75) );
  AO22X1 U110 ( .IN1(n85), .IN2(n75), .IN3(n83), .IN4(y_i[2]), .Q(ymux[2]) );
  INVX0 U111 ( .INP(n76), .ZN(n77) );
  NAND3X0 U112 ( .IN1(n81), .IN2(n78), .IN3(n77), .QN(n79) );
  MUX21X1 U113 ( .IN1(n116), .IN2(yreg[1]), .S(n79), .Q(n80) );
  AO22X1 U114 ( .IN1(n85), .IN2(n80), .IN3(n83), .IN4(y_i[1]), .Q(ymux[1]) );
  XOR2X1 U115 ( .IN1(n121), .IN2(n82), .Q(n84) );
  AO22X1 U116 ( .IN1(n85), .IN2(n84), .IN3(n83), .IN4(y_i[0]), .Q(ymux[0]) );
  NAND3X0 U117 ( .IN1(n118), .IN2(TOFSM_cState[0]), .IN3(TOFSM_cState[2]), 
        .QN(n86) );
  NAND2X0 U118 ( .IN1(n86), .IN2(n95), .QN(n66) );
  AO222X1 U119 ( .IN1(xreg[3]), .IN2(n123), .IN3(xreg[3]), .IN4(n87), .IN5(
        n123), .IN6(n87), .Q(n88) );
  NAND2X0 U120 ( .IN1(n88), .IN2(n63), .QN(n112) );
  AO21X1 U121 ( .IN1(n89), .IN2(n123), .IN3(n112), .Q(n90) );
  AND3X1 U122 ( .IN1(xreg[3]), .IN2(n63), .IN3(n90), .Q(xsub[3]) );
  INVX0 U123 ( .INP(n91), .ZN(n106) );
  NOR2X0 U124 ( .IN1(rst), .IN2(n106), .QN(n105) );
  AO22X1 U125 ( .IN1(n106), .IN2(xsub[3]), .IN3(n105), .IN4(x_i[3]), .Q(
        xmux[3]) );
  INVX0 U126 ( .INP(n92), .ZN(n94) );
  MUX21X1 U127 ( .IN1(n97), .IN2(xreg[0]), .S(n112), .Q(n93) );
  OA21X1 U128 ( .IN1(n94), .IN2(n93), .IN3(n63), .Q(xsub[0]) );
  AO22X1 U129 ( .IN1(n106), .IN2(xsub[0]), .IN3(n105), .IN4(x_i[0]), .Q(
        xmux[0]) );
  NOR2X0 U130 ( .IN1(TOFSM_cState[2]), .IN2(n118), .QN(n111) );
  AND3X1 U131 ( .IN1(TOFSM_cState[0]), .IN2(n111), .IN3(n63), .Q(
        TOFSM_nState_2_) );
  NOR2X0 U132 ( .IN1(n119), .IN2(n95), .QN(enable) );
  INVX0 U133 ( .INP(n97), .ZN(n96) );
  AO221X1 U134 ( .IN1(n97), .IN2(yreg[1]), .IN3(n96), .IN4(n116), .IN5(n112), 
        .Q(n98) );
  MUX21X1 U135 ( .IN1(xreg[1]), .IN2(n120), .S(n98), .Q(n99) );
  NOR2X0 U136 ( .IN1(rst), .IN2(n99), .QN(xsub[1]) );
  AO22X1 U137 ( .IN1(n106), .IN2(xsub[1]), .IN3(n105), .IN4(x_i[1]), .Q(
        xmux[1]) );
  INVX0 U138 ( .INP(n100), .ZN(n101) );
  NOR3X0 U139 ( .IN1(n102), .IN2(n101), .IN3(n112), .QN(n103) );
  MUX21X1 U140 ( .IN1(n117), .IN2(xreg[2]), .S(n103), .Q(n104) );
  NOR2X0 U141 ( .IN1(rst), .IN2(n104), .QN(xsub[2]) );
  AO22X1 U142 ( .IN1(n106), .IN2(xsub[2]), .IN3(n105), .IN4(x_i[2]), .Q(
        xmux[2]) );
  NAND2X0 U143 ( .IN1(n115), .IN2(go_i), .QN(n110) );
  NAND3X0 U144 ( .IN1(n63), .IN2(TOFSM_cState[0]), .IN3(n107), .QN(n108) );
  NAND3X0 U145 ( .IN1(n110), .IN2(n119), .IN3(n109), .QN(n65) );
  OA221X1 U146 ( .IN1(n115), .IN2(n113), .IN3(n115), .IN4(n112), .IN5(n111), 
        .Q(n114) );
  AO221X1 U147 ( .IN1(n118), .IN2(TOFSM_cState[2]), .IN3(n118), .IN4(
        TOFSM_cState[0]), .IN5(n114), .Q(n64) );
endmodule


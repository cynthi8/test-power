/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Thu Apr 15 22:50:52 2021
/////////////////////////////////////////////////////////////


module SNPS_CLOCK_GATE_HIGH_gcd_0 ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   n1, n2;

  AND2X1 main_gate ( .IN1(n2), .IN2(CLK), .Q(ENCLK) );
  LATCHX1 latch ( .CLK(n1), .D(EN), .Q(n2) );
  INVX0 U1 ( .INP(CLK), .ZN(n1) );
endmodule


module SNPS_CLOCK_GATE_HIGH_gcd_1 ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   n1, n2;

  AND2X1 main_gate ( .IN1(n2), .IN2(CLK), .Q(ENCLK) );
  LATCHX1 latch ( .CLK(n1), .D(EN), .Q(n2) );
  INVX0 U1 ( .INP(CLK), .ZN(n1) );
endmodule


module gcd ( rst, clk, go_i, x_i, y_i, d_o );
  input [3:0] x_i;
  input [3:0] y_i;
  output [3:0] d_o;
  input rst, clk, go_i;
  wire   TOFSM_n13, TOFSM_n12, TOFSM_n15, TOFSM_n14, TOFSM_nState_2_,
         TOFSM_cState_2_, X_REG_n8, X_REG_n6, X_REG_n4, X_REG_n2, Y_REG_n7,
         Y_REG_n6, Y_REG_n5, Y_REG_n3, n61, n62, n63, n65, n80, n81, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167;
  wire   [3:0] xreg;
  wire   [3:0] yreg;

  DFFARX1 TOFSM_cState_reg_2_ ( .D(TOFSM_nState_2_), .CLK(clk), .RSTB(n80), 
        .Q(TOFSM_cState_2_), .QN(n155) );
  DFFARX1 TOFSM_cState_reg_1_ ( .D(TOFSM_n14), .CLK(clk), .RSTB(n80), .Q(n157), 
        .QN(TOFSM_n12) );
  DFFARX1 TOFSM_cState_reg_0_ ( .D(TOFSM_n15), .CLK(clk), .RSTB(n80), .Q(n158), 
        .QN(TOFSM_n13) );
  DFFARX1 X_REG_output_reg_0_ ( .D(X_REG_n2), .CLK(n164), .RSTB(n80), .Q(
        xreg[0]) );
  DFFARX1 X_REG_output_reg_1_ ( .D(X_REG_n4), .CLK(n164), .RSTB(n80), .Q(
        xreg[1]), .QN(n163) );
  DFFARX1 X_REG_output_reg_2_ ( .D(X_REG_n6), .CLK(n164), .RSTB(n80), .Q(
        xreg[2]), .QN(n160) );
  DFFARX1 X_REG_output_reg_3_ ( .D(X_REG_n8), .CLK(n164), .RSTB(n80), .Q(
        xreg[3]), .QN(n159) );
  DFFARX1 OUT_REG_output_reg_0_ ( .D(n65), .CLK(n166), .RSTB(n80), .Q(d_o[0])
         );
  DFFARX1 OUT_REG_output_reg_1_ ( .D(n63), .CLK(n166), .RSTB(n80), .Q(d_o[1])
         );
  DFFARX1 OUT_REG_output_reg_2_ ( .D(n62), .CLK(n166), .RSTB(n80), .Q(d_o[2])
         );
  DFFARX1 OUT_REG_output_reg_3_ ( .D(n61), .CLK(n166), .RSTB(n80), .Q(d_o[3])
         );
  DFFARX1 Y_REG_output_reg_0_ ( .D(Y_REG_n7), .CLK(n164), .RSTB(n80), .Q(
        yreg[0]), .QN(n162) );
  DFFARX1 Y_REG_output_reg_1_ ( .D(Y_REG_n6), .CLK(n164), .RSTB(n80), .Q(
        yreg[1]), .QN(n161) );
  DFFARX1 Y_REG_output_reg_2_ ( .D(Y_REG_n5), .CLK(n164), .RSTB(n80), .Q(
        yreg[2]), .QN(n156) );
  DFFARX1 Y_REG_output_reg_3_ ( .D(Y_REG_n3), .CLK(n164), .RSTB(n80), .Q(
        yreg[3]) );
  SNPS_CLOCK_GATE_HIGH_gcd_0 clk_gate_OUT_REG_output_reg ( .CLK(clk), .EN(n167), .ENCLK(n166) );
  SNPS_CLOCK_GATE_HIGH_gcd_1 clk_gate_Y_REG_output_reg ( .CLK(clk), .EN(n165), 
        .ENCLK(n164) );
  NAND2X0 U94 ( .IN1(n91), .IN2(yreg[2]), .QN(n92) );
  NAND2X0 U95 ( .IN1(n160), .IN2(yreg[2]), .QN(n113) );
  NAND2X0 U96 ( .IN1(n96), .IN2(n95), .QN(n99) );
  NAND2X0 U97 ( .IN1(xreg[0]), .IN2(n162), .QN(n141) );
  NAND2X0 U98 ( .IN1(yreg[3]), .IN2(n100), .QN(n111) );
  INVX0 U99 ( .INP(rst), .ZN(n80) );
  NAND2X0 U100 ( .IN1(n157), .IN2(TOFSM_n13), .QN(n122) );
  NOR2X0 U101 ( .IN1(n122), .IN2(n155), .QN(n167) );
  NOR2X0 U102 ( .IN1(n157), .IN2(n155), .QN(n88) );
  AND2X1 U103 ( .IN1(n158), .IN2(n88), .Q(n85) );
  OA21X1 U104 ( .IN1(n85), .IN2(n167), .IN3(n80), .Q(n150) );
  NAND2X0 U106 ( .IN1(yreg[3]), .IN2(n159), .QN(n114) );
  INVX0 U107 ( .INP(n114), .ZN(n81) );
  OR2X1 U108 ( .IN1(n159), .IN2(yreg[3]), .Q(n117) );
  INVX0 U109 ( .INP(n113), .ZN(n98) );
  NOR2X0 U110 ( .IN1(xreg[0]), .IN2(n162), .QN(n138) );
  INVX0 U111 ( .INP(n138), .ZN(n126) );
  OA222X1 U112 ( .IN1(n161), .IN2(n126), .IN3(n161), .IN4(xreg[1]), .IN5(n126), 
        .IN6(xreg[1]), .Q(n130) );
  INVX0 U113 ( .INP(n130), .ZN(n129) );
  NAND2X0 U114 ( .IN1(xreg[2]), .IN2(n156), .QN(n112) );
  OA21X1 U115 ( .IN1(n98), .IN2(n129), .IN3(n112), .Q(n134) );
  AO221X1 U116 ( .IN1(1'b1), .IN2(n81), .IN3(n117), .IN4(n134), .IN5(rst), .Q(
        n146) );
  INVX0 U117 ( .INP(n146), .ZN(n139) );
  INVX0 U118 ( .INP(n141), .ZN(n142) );
  OA222X1 U119 ( .IN1(n161), .IN2(xreg[1]), .IN3(n161), .IN4(n142), .IN5(
        xreg[1]), .IN6(n142), .Q(n148) );
  INVX0 U120 ( .INP(n148), .ZN(n147) );
  NOR2X0 U121 ( .IN1(n147), .IN2(n98), .QN(n84) );
  NAND2X0 U122 ( .IN1(n112), .IN2(n159), .QN(n83) );
  NOR2X0 U123 ( .IN1(n84), .IN2(n83), .QN(n86) );
  INVX0 U124 ( .INP(n122), .ZN(n89) );
  NOR2X0 U125 ( .IN1(n89), .IN2(n85), .QN(n152) );
  AO221X1 U126 ( .IN1(n150), .IN2(n139), .IN3(n150), .IN4(n86), .IN5(n152), 
        .Q(n87) );
  NOR2X0 U127 ( .IN1(TOFSM_cState_2_), .IN2(n122), .QN(n102) );
  AND2X1 U128 ( .IN1(n102), .IN2(n80), .Q(n154) );
  AO22X1 U129 ( .IN1(yreg[3]), .IN2(n87), .IN3(n154), .IN4(y_i[3]), .Q(
        Y_REG_n3) );
  NOR2X0 U130 ( .IN1(n89), .IN2(n88), .QN(n108) );
  NOR3X0 U131 ( .IN1(n108), .IN2(xreg[1]), .IN3(yreg[1]), .QN(n90) );
  INVX0 U132 ( .INP(n152), .ZN(n97) );
  NOR2X0 U133 ( .IN1(n158), .IN2(n155), .QN(n136) );
  NOR2X0 U134 ( .IN1(n89), .IN2(n136), .QN(n137) );
  INVX0 U135 ( .INP(n137), .ZN(n94) );
  AO22X1 U136 ( .IN1(yreg[1]), .IN2(n97), .IN3(xreg[1]), .IN4(n94), .Q(n101)
         );
  NOR2X0 U137 ( .IN1(n90), .IN2(n101), .QN(n104) );
  INVX0 U138 ( .INP(n104), .ZN(n91) );
  NAND2X0 U139 ( .IN1(n156), .IN2(n91), .QN(n93) );
  MUX21X1 U140 ( .IN1(n93), .IN2(n92), .S(xreg[2]), .Q(n96) );
  NAND3X0 U141 ( .IN1(n94), .IN2(xreg[2]), .IN3(n156), .QN(n95) );
  AO22X1 U142 ( .IN1(xreg[3]), .IN2(n99), .IN3(n98), .IN4(n97), .Q(n100) );
  NOR2X0 U143 ( .IN1(n102), .IN2(n101), .QN(n103) );
  AO222X1 U144 ( .IN1(n152), .IN2(yreg[3]), .IN3(n152), .IN4(yreg[2]), .IN5(
        n156), .IN6(n103), .Q(n106) );
  AO221X1 U145 ( .IN1(yreg[2]), .IN2(n104), .IN3(n156), .IN4(n137), .IN5(n160), 
        .Q(n105) );
  OA22X1 U146 ( .IN1(xreg[2]), .IN2(n106), .IN3(yreg[3]), .IN4(n105), .Q(n107)
         );
  OA22X1 U147 ( .IN1(n152), .IN2(n114), .IN3(xreg[3]), .IN4(n107), .Q(n110) );
  OA22X1 U148 ( .IN1(n137), .IN2(n117), .IN3(n108), .IN4(n80), .Q(n109) );
  NAND3X0 U149 ( .IN1(n111), .IN2(n110), .IN3(n109), .QN(n165) );
  NAND2X0 U150 ( .IN1(n112), .IN2(n147), .QN(n115) );
  NAND3X0 U151 ( .IN1(n115), .IN2(n114), .IN3(n113), .QN(n116) );
  NAND3X0 U152 ( .IN1(n117), .IN2(n80), .IN3(n116), .QN(n133) );
  AO21X1 U153 ( .IN1(n146), .IN2(n133), .IN3(TOFSM_n13), .Q(n123) );
  INVX0 U154 ( .INP(n123), .ZN(n118) );
  NAND2X0 U155 ( .IN1(n157), .IN2(n155), .QN(n124) );
  AOI221X1 U156 ( .IN1(n118), .IN2(n146), .IN3(n118), .IN4(n133), .IN5(n124), 
        .QN(n119) );
  AO221X1 U157 ( .IN1(TOFSM_n12), .IN2(TOFSM_cState_2_), .IN3(TOFSM_n12), 
        .IN4(n158), .IN5(n119), .Q(TOFSM_n14) );
  NAND2X0 U158 ( .IN1(n157), .IN2(n146), .QN(n121) );
  NAND2X0 U159 ( .IN1(TOFSM_n13), .IN2(go_i), .QN(n120) );
  NAND4X0 U160 ( .IN1(n122), .IN2(n155), .IN3(n121), .IN4(n120), .QN(TOFSM_n15) );
  NOR2X0 U161 ( .IN1(n124), .IN2(n123), .QN(TOFSM_nState_2_) );
  MUX21X1 U162 ( .IN1(xreg[0]), .IN2(n138), .S(n133), .Q(n125) );
  OA21X1 U163 ( .IN1(n142), .IN2(n125), .IN3(n80), .Q(n65) );
  AO222X1 U164 ( .IN1(n136), .IN2(n65), .IN3(xreg[0]), .IN4(n137), .IN5(n154), 
        .IN6(x_i[0]), .Q(X_REG_n2) );
  OA221X1 U165 ( .IN1(n138), .IN2(yreg[1]), .IN3(n126), .IN4(n161), .IN5(n133), 
        .Q(n127) );
  MUX21X1 U166 ( .IN1(n163), .IN2(xreg[1]), .S(n127), .Q(n128) );
  NOR2X0 U167 ( .IN1(rst), .IN2(n128), .QN(n63) );
  AO222X1 U168 ( .IN1(xreg[1]), .IN2(n137), .IN3(n136), .IN4(n63), .IN5(n154), 
        .IN6(x_i[1]), .Q(X_REG_n4) );
  OA221X1 U169 ( .IN1(n130), .IN2(n156), .IN3(n129), .IN4(yreg[2]), .IN5(n133), 
        .Q(n131) );
  MUX21X1 U170 ( .IN1(n160), .IN2(xreg[2]), .S(n131), .Q(n132) );
  NOR2X0 U171 ( .IN1(rst), .IN2(n132), .QN(n62) );
  AO222X1 U172 ( .IN1(xreg[2]), .IN2(n137), .IN3(n136), .IN4(n62), .IN5(n154), 
        .IN6(x_i[2]), .Q(X_REG_n6) );
  OA21X1 U173 ( .IN1(yreg[3]), .IN2(n134), .IN3(n133), .Q(n135) );
  NOR3X0 U174 ( .IN1(rst), .IN2(n135), .IN3(n159), .QN(n61) );
  AO222X1 U175 ( .IN1(xreg[3]), .IN2(n137), .IN3(n136), .IN4(n61), .IN5(n154), 
        .IN6(x_i[3]), .Q(X_REG_n8) );
  AO221X1 U176 ( .IN1(n139), .IN2(yreg[0]), .IN3(n146), .IN4(n142), .IN5(n138), 
        .Q(n140) );
  AO222X1 U177 ( .IN1(n140), .IN2(n150), .IN3(y_i[0]), .IN4(n154), .IN5(n152), 
        .IN6(yreg[0]), .Q(Y_REG_n7) );
  OA221X1 U178 ( .IN1(xreg[1]), .IN2(n142), .IN3(n163), .IN4(n141), .IN5(n146), 
        .Q(n143) );
  XNOR2X1 U179 ( .IN1(n161), .IN2(n143), .Q(n144) );
  AO22X1 U180 ( .IN1(yreg[1]), .IN2(n152), .IN3(n144), .IN4(n150), .Q(n145) );
  AO21X1 U181 ( .IN1(n154), .IN2(y_i[1]), .IN3(n145), .Q(Y_REG_n6) );
  OA221X1 U182 ( .IN1(xreg[2]), .IN2(n148), .IN3(n160), .IN4(n147), .IN5(n146), 
        .Q(n149) );
  XNOR2X1 U183 ( .IN1(n156), .IN2(n149), .Q(n151) );
  AO22X1 U184 ( .IN1(yreg[2]), .IN2(n152), .IN3(n151), .IN4(n150), .Q(n153) );
  AO21X1 U185 ( .IN1(n154), .IN2(y_i[2]), .IN3(n153), .Q(Y_REG_n5) );
endmodule


/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Fri Apr 16 00:54:48 2021
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
  wire   yreg_3_, TOFSM_nState_2_, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n154, n155, n158, n159, n160, n161, n180, n192, n194, n197, n201,
         n229, n230, n231, n232, n233, n234, n235, n236, n237, n238, n239,
         n240, n241, n242, n243, n244, n245, n246, n247, n248, n249, n250,
         n251, n252, n253, n254, n255, n256, n257, n258, n259, n260, n261,
         n262, n263, n264, n265, n266, n267, n268, n269, n270, n271, n272,
         n273, n274, n275, n276, n277, n278, n279, n280, n281, n282, n283,
         n284, n285, n286, n287, n288, n289, n290, n291, n292, n293, n294,
         n295, n296, n297, n298;
  wire   [3:0] xreg;
  wire   [2:0] TOFSM_cState;

  DFFARX1 Y_REG_output_reg_3_ ( .D(n88), .CLK(n296), .RSTB(n229), .Q(yreg_3_), 
        .QN(n295) );
  DFFARX1 Y_REG_output_reg_2_ ( .D(n81), .CLK(n296), .RSTB(n229), .Q(n293), 
        .QN(n160) );
  DFFARX1 TOFSM_cState_reg_1_ ( .D(n89), .CLK(clk), .RSTB(n229), .Q(n287), 
        .QN(n159) );
  DFFARX1 TOFSM_cState_reg_0_ ( .D(n90), .CLK(clk), .RSTB(n229), .Q(
        TOFSM_cState[0]), .QN(n291) );
  DFFARX1 TOFSM_cState_reg_2_ ( .D(TOFSM_nState_2_), .CLK(clk), .RSTB(n229), 
        .Q(TOFSM_cState[2]), .QN(n289) );
  DFFARX1 Y_REG_output_reg_0_ ( .D(n83), .CLK(n296), .RSTB(n229), .QN(n158) );
  DFFARX1 X_REG_output_reg_0_ ( .D(n84), .CLK(n296), .RSTB(n229), .Q(xreg[0])
         );
  DFFARX1 Y_REG_output_reg_1_ ( .D(n82), .CLK(n296), .RSTB(n229), .Q(n294), 
        .QN(n161) );
  DFFARX1 X_REG_output_reg_1_ ( .D(n86), .CLK(n296), .RSTB(n229), .Q(n288), 
        .QN(n154) );
  DFFARX1 X_REG_output_reg_2_ ( .D(n85), .CLK(n296), .RSTB(n229), .Q(n292), 
        .QN(n155) );
  DFFARX1 X_REG_output_reg_3_ ( .D(n87), .CLK(n296), .RSTB(n229), .Q(xreg[3]), 
        .QN(n290) );
  DFFARX1 OUT_REG_output_reg_0_ ( .D(n192), .CLK(n298), .RSTB(n229), .Q(d_o[0]) );
  DFFARX1 OUT_REG_output_reg_1_ ( .D(n197), .CLK(n298), .RSTB(n229), .Q(d_o[1]) );
  DFFARX1 OUT_REG_output_reg_2_ ( .D(n194), .CLK(n298), .RSTB(n229), .Q(d_o[2]) );
  DFFARX1 OUT_REG_output_reg_3_ ( .D(n201), .CLK(n298), .RSTB(n229), .Q(d_o[3]) );
  SNPS_CLOCK_GATE_HIGH_gcd_0 clk_gate_OUT_REG_output_reg ( .CLK(clk), .EN(n180), .ENCLK(n298) );
  SNPS_CLOCK_GATE_HIGH_gcd_1 clk_gate_Y_REG_output_reg ( .CLK(clk), .EN(n297), 
        .ENCLK(n296) );
  NAND2X0 U173 ( .IN1(yreg_3_), .IN2(n290), .QN(n241) );
  NAND2X0 U174 ( .IN1(n262), .IN2(n261), .QN(n263) );
  NAND2X0 U175 ( .IN1(n278), .IN2(y_i[1]), .QN(n275) );
  NAND2X0 U176 ( .IN1(TOFSM_cState[0]), .IN2(n229), .QN(n249) );
  NAND2X0 U177 ( .IN1(n247), .IN2(n246), .QN(n297) );
  NAND2X0 U178 ( .IN1(n239), .IN2(n238), .QN(n83) );
  INVX0 U179 ( .INP(rst), .ZN(n229) );
  NOR2X0 U180 ( .IN1(yreg_3_), .IN2(n290), .QN(n237) );
  NOR2X0 U181 ( .IN1(n160), .IN2(n292), .QN(n231) );
  NOR2X0 U182 ( .IN1(n161), .IN2(n288), .QN(n230) );
  NOR2X0 U183 ( .IN1(n158), .IN2(xreg[0]), .QN(n267) );
  OA22X1 U184 ( .IN1(n230), .IN2(n267), .IN3(n154), .IN4(n294), .Q(n260) );
  OAI22X1 U185 ( .IN1(n155), .IN2(n293), .IN3(n231), .IN4(n260), .QN(n251) );
  OA21X1 U186 ( .IN1(n237), .IN2(n251), .IN3(n241), .Q(n248) );
  INVX0 U187 ( .INP(n248), .ZN(n235) );
  OA21X1 U188 ( .IN1(n235), .IN2(n249), .IN3(n287), .Q(n232) );
  NOR2X0 U189 ( .IN1(TOFSM_cState[2]), .IN2(n232), .QN(n234) );
  NAND2X0 U190 ( .IN1(go_i), .IN2(n291), .QN(n233) );
  NAND2X0 U191 ( .IN1(n234), .IN2(n233), .QN(n90) );
  NAND2X0 U192 ( .IN1(n291), .IN2(TOFSM_cState[2]), .QN(n269) );
  NOR2X0 U193 ( .IN1(n159), .IN2(n269), .QN(n180) );
  NAND2X0 U194 ( .IN1(n291), .IN2(n287), .QN(n247) );
  INVX0 U195 ( .INP(n247), .ZN(n253) );
  NOR3X0 U196 ( .IN1(n291), .IN2(n289), .IN3(n287), .QN(n236) );
  OAI21X1 U197 ( .IN1(n180), .IN2(n236), .IN3(n229), .QN(n281) );
  OA22X1 U198 ( .IN1(n253), .IN2(n236), .IN3(n281), .IN4(n235), .Q(n283) );
  INVX0 U199 ( .INP(n267), .ZN(n256) );
  OA22X1 U200 ( .IN1(n158), .IN2(n283), .IN3(n281), .IN4(n256), .Q(n239) );
  AND2X1 U201 ( .IN1(n158), .IN2(xreg[0]), .Q(n273) );
  AO222X1 U202 ( .IN1(n161), .IN2(n273), .IN3(n161), .IN4(n288), .IN5(n273), 
        .IN6(n288), .Q(n279) );
  AO222X1 U203 ( .IN1(n160), .IN2(n292), .IN3(n160), .IN4(n279), .IN5(n292), 
        .IN6(n279), .Q(n240) );
  OA21X1 U204 ( .IN1(n237), .IN2(n240), .IN3(n241), .Q(n262) );
  NOR2X0 U205 ( .IN1(n262), .IN2(n281), .QN(n280) );
  NOR3X0 U206 ( .IN1(n247), .IN2(rst), .IN3(TOFSM_cState[2]), .QN(n278) );
  AOI22X1 U207 ( .IN1(n273), .IN2(n280), .IN3(n278), .IN4(y_i[0]), .QN(n238)
         );
  NOR3X0 U208 ( .IN1(n241), .IN2(n240), .IN3(n281), .QN(n243) );
  NOR2X0 U209 ( .IN1(n283), .IN2(n295), .QN(n242) );
  NOR2X0 U210 ( .IN1(n243), .IN2(n242), .QN(n245) );
  NAND2X0 U211 ( .IN1(n278), .IN2(y_i[3]), .QN(n244) );
  NAND2X0 U212 ( .IN1(n245), .IN2(n244), .QN(n88) );
  NAND2X0 U213 ( .IN1(TOFSM_cState[2]), .IN2(n159), .QN(n246) );
  NOR3X0 U214 ( .IN1(TOFSM_cState[2]), .IN2(n159), .IN3(n249), .QN(
        TOFSM_nState_2_) );
  INVX0 U215 ( .INP(n262), .ZN(n266) );
  OA221X1 U216 ( .IN1(n249), .IN2(n248), .IN3(n249), .IN4(n266), .IN5(n287), 
        .Q(n250) );
  AO222X1 U217 ( .IN1(n159), .IN2(TOFSM_cState[0]), .IN3(n159), .IN4(
        TOFSM_cState[2]), .IN5(n289), .IN6(n250), .Q(n89) );
  AO21X1 U218 ( .IN1(n295), .IN2(n251), .IN3(n266), .Q(n252) );
  AND3X1 U219 ( .IN1(xreg[3]), .IN2(n229), .IN3(n252), .Q(n201) );
  INVX0 U220 ( .INP(n269), .ZN(n254) );
  NOR2X0 U221 ( .IN1(n254), .IN2(n253), .QN(n272) );
  NOR2X0 U222 ( .IN1(rst), .IN2(n272), .QN(n271) );
  MUX21X1 U223 ( .IN1(n201), .IN2(x_i[3]), .S(n269), .Q(n255) );
  AO22X1 U224 ( .IN1(n272), .IN2(xreg[3]), .IN3(n271), .IN4(n255), .Q(n87) );
  OA221X1 U225 ( .IN1(n161), .IN2(n256), .IN3(n294), .IN4(n267), .IN5(n262), 
        .Q(n257) );
  MUX21X1 U226 ( .IN1(n154), .IN2(n288), .S(n257), .Q(n258) );
  NOR2X0 U227 ( .IN1(rst), .IN2(n258), .QN(n197) );
  MUX21X1 U228 ( .IN1(n197), .IN2(x_i[1]), .S(n269), .Q(n259) );
  AO22X1 U229 ( .IN1(n272), .IN2(n288), .IN3(n271), .IN4(n259), .Q(n86) );
  MUX21X1 U230 ( .IN1(n293), .IN2(n160), .S(n260), .Q(n261) );
  MUX21X1 U231 ( .IN1(n292), .IN2(n155), .S(n263), .Q(n264) );
  NOR2X0 U232 ( .IN1(rst), .IN2(n264), .QN(n194) );
  MUX21X1 U233 ( .IN1(n194), .IN2(x_i[2]), .S(n269), .Q(n265) );
  AO22X1 U234 ( .IN1(n272), .IN2(n292), .IN3(n271), .IN4(n265), .Q(n85) );
  MUX21X1 U235 ( .IN1(n267), .IN2(xreg[0]), .S(n266), .Q(n268) );
  OA21X1 U236 ( .IN1(n273), .IN2(n268), .IN3(n229), .Q(n192) );
  MUX21X1 U237 ( .IN1(n192), .IN2(x_i[0]), .S(n269), .Q(n270) );
  AO22X1 U238 ( .IN1(n272), .IN2(xreg[0]), .IN3(n271), .IN4(n270), .Q(n84) );
  MUX21X1 U239 ( .IN1(n288), .IN2(n154), .S(n273), .Q(n274) );
  NAND3X0 U240 ( .IN1(n280), .IN2(n161), .IN3(n274), .QN(n277) );
  AO221X1 U241 ( .IN1(n283), .IN2(n281), .IN3(n283), .IN4(n274), .IN5(n161), 
        .Q(n276) );
  NAND3X0 U242 ( .IN1(n277), .IN2(n276), .IN3(n275), .QN(n82) );
  NAND2X0 U243 ( .IN1(y_i[2]), .IN2(n278), .QN(n286) );
  MUX21X1 U244 ( .IN1(n292), .IN2(n155), .S(n279), .Q(n282) );
  NAND3X0 U245 ( .IN1(n160), .IN2(n280), .IN3(n282), .QN(n285) );
  AO221X1 U246 ( .IN1(n283), .IN2(n282), .IN3(n283), .IN4(n281), .IN5(n160), 
        .Q(n284) );
  NAND3X0 U247 ( .IN1(n286), .IN2(n285), .IN3(n284), .QN(n81) );
endmodule


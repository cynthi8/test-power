/////////////////////////////////////////////////////////////
// Created by: Synopsys Design Compiler(R)
// Version   : O-2018.06-SP1
// Date      : Fri Mar 19 18:07:01 2021
/////////////////////////////////////////////////////////////


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



    module TOP_DW_tap_uc_width4_id0_idcode_opcode1_version0_part0_man_num0_sync_mode1_tst_mode1 ( 
        tck, trst_n, tms, tdi, so, bypass_sel, sentinel_val, device_id_sel, 
        user_code_sel, user_code_val, ver, ver_sel, part_num, part_num_sel, 
        mnfr_id, mnfr_id_sel, clock_dr, shift_dr, update_dr, tdo, tdo_en, 
        tap_state, instructions, sync_capture_en, sync_update_dr, test );
  input [2:0] sentinel_val;
  input [31:0] user_code_val;
  input [3:0] ver;
  input [15:0] part_num;
  input [10:0] mnfr_id;
  output [15:0] tap_state;
  output [3:0] instructions;
  input tck, trst_n, tms, tdi, so, bypass_sel, device_id_sel, user_code_sel,
         ver_sel, part_num_sel, mnfr_id_sel, test;
  output clock_dr, shift_dr, update_dr, tdo, tdo_en, sync_capture_en,
         sync_update_dr;
  wire   tck_inv, test_n, sel_tck, sel_tck_inv, tck_n, instr_rst, dr_sel_int,
         shift_ir_int, instr_so, byp_so, tdo_ffin, U6_ffin, U5_U1_3_ffin,
         U5_U1_2_ffin, U5_U1_1_ffin, U5_U1_0_ffin, U5_rst_n,
         U5_instruction_shift_1_, U5_instruction_shift_2_,
         U5_instruction_shift_3_, U1_net41, U1_dr_sel_int_next, net450, net449,
         net448, net447, net446, net445, net444, net443, net442, net441,
         net440, net439, net438, net437, net436, net435, net434, net433,
         net432, net431, net430, net429, net428, net427, net426, net425,
         net424, net423, net422, net421, net420, net419, net418, net417,
         net416, net415, net414, net413, net412, net411, net410, net409,
         net408, net407, net406, net405, net404, net403, net402, net401,
         net400, net399, net398, net397, net396, net395, net394, net393,
         net392, net391, net390, net389, net388, net387, net386, net385,
         net384, net383, net382, net381, net380, net379, net378, net377,
         net376, net375, net374, net373, net372, net371, net370, net369,
         net368, net367, net366, net365, net364, net363, net362, net361,
         net360, net359, net358, net357, net356, net355, net354, net353,
         net352, net351, net350, net349, net348, net347, net346, net345,
         net344, net343, net342, net341, net340, net339, net338, net337,
         net336, net335, net334, net333, net332, net331, net330, net329,
         net328, net327, net326, net325, net324, net323, net322, net321,
         net320, net319, net318, net317, net316, net315, net314, net313,
         net312, net311, net310, net309, net308, net307, net306, net305,
         net304, net303, net302, net301, net300, net299, net298, net297,
         net296, net295, net294, net293, net292, net291, net290, net289,
         net288, net287;
  wire   [3:0] U5_ff_d;
  wire   [15:0] U1_next_state;

  NAND2X2 U1_U10 ( .IN1(U1_net41), .IN2(trst_n), .QN(instr_rst) );
  NAND2X2 U_CS_5 ( .IN1(sel_tck), .IN2(sel_tck_inv), .QN(tck_n) );
  NAND2X2 U_CS_4 ( .IN1(tck_inv), .IN2(test_n), .QN(sel_tck_inv) );
  NAND2X2 U_CS_3 ( .IN1(tck), .IN2(test), .QN(sel_tck) );
  INVX1 U_CS_2 ( .INP(test), .ZN(test_n) );
  INVX1 U_CS_1 ( .INP(tck), .ZN(tck_inv) );
  NOR3X0 u_cell_528 ( .IN1(net410), .IN2(tap_state[8]), .IN3(tap_state[6]), 
        .QN(net441) );
  NOR2X2 u_cell_527 ( .IN1(tap_state[9]), .IN2(tap_state[2]), .QN(net442) );
  NOR2X2 u_cell_526 ( .IN1(tap_state[5]), .IN2(tap_state[3]), .QN(net444) );
  NAND2X2 u_cell_523 ( .IN1(net450), .IN2(net404), .QN(net384) );
  NOR2X2 u_cell_522 ( .IN1(tap_state[4]), .IN2(net384), .QN(net445) );
  NOR2X2 u_cell_521 ( .IN1(tap_state[12]), .IN2(tap_state[0]), .QN(net446) );
  NOR2X2 u_cell_520 ( .IN1(tap_state[1]), .IN2(tap_state[15]), .QN(net448) );
  NAND2X2 u_cell_517 ( .IN1(net389), .IN2(net373), .QN(net449) );
  INVX1 u_cell_516 ( .INP(net449), .ZN(net412) );
  NAND2X2 u_cell_515 ( .IN1(net448), .IN2(net412), .QN(net364) );
  INVX1 u_cell_514 ( .INP(net364), .ZN(net447) );
  NAND2X2 u_cell_513 ( .IN1(net446), .IN2(net447), .QN(net403) );
  INVX1 u_cell_512 ( .INP(net403), .ZN(net439) );
  NAND2X2 u_cell_511 ( .IN1(net445), .IN2(net439), .QN(net437) );
  INVX1 u_cell_510 ( .INP(net437), .ZN(net392) );
  NAND2X2 u_cell_509 ( .IN1(net444), .IN2(net392), .QN(net443) );
  INVX1 u_cell_508 ( .INP(net443), .ZN(net358) );
  NAND2X2 u_cell_507 ( .IN1(net442), .IN2(net358), .QN(net408) );
  INVX1 u_cell_506 ( .INP(net408), .ZN(net376) );
  NAND2X2 u_cell_505 ( .IN1(net441), .IN2(net376), .QN(net333) );
  NOR2X2 u_cell_503 ( .IN1(net384), .IN2(net440), .QN(net438) );
  NAND2X2 u_cell_502 ( .IN1(net438), .IN2(net439), .QN(net436) );
  MUX21X1 u_cell_501 ( .IN1(net436), .IN2(net437), .S(tap_state[3]), .Q(net435) );
  INVX1 u_cell_500 ( .INP(net435), .ZN(net428) );
  NOR2X2 u_cell_499 ( .IN1(tap_state[5]), .IN2(tap_state[2]), .QN(net430) );
  NOR2X2 u_cell_498 ( .IN1(tap_state[9]), .IN2(tap_state[6]), .QN(net432) );
  NAND2X2 u_cell_496 ( .IN1(net434), .IN2(net410), .QN(net360) );
  INVX1 u_cell_495 ( .INP(net360), .ZN(net433) );
  NAND2X2 u_cell_494 ( .IN1(net432), .IN2(net433), .QN(net395) );
  INVX1 u_cell_493 ( .INP(net395), .ZN(net431) );
  NAND2X2 u_cell_492 ( .IN1(net430), .IN2(net431), .QN(net429) );
  INVX1 u_cell_491 ( .INP(net429), .ZN(net421) );
  NAND2X2 u_cell_490 ( .IN1(net428), .IN2(net421), .QN(net338) );
  NAND2X2 u_cell_489 ( .IN1(net333), .IN2(net338), .QN(net427) );
  INVX1 u_cell_488 ( .INP(tms), .ZN(net329) );
  NAND2X2 u_cell_487 ( .IN1(net427), .IN2(net329), .QN(net426) );
  INVX1 u_cell_486 ( .INP(net426), .ZN(U1_next_state[4]) );
  NOR2X2 u_cell_484 ( .IN1(net396), .IN2(net395), .QN(net425) );
  NAND2X2 u_cell_483 ( .IN1(net425), .IN2(net358), .QN(net328) );
  INVX1 u_cell_482 ( .INP(net328), .ZN(net424) );
  NAND2X2 u_cell_481 ( .IN1(net424), .IN2(net329), .QN(net423) );
  INVX1 u_cell_480 ( .INP(net423), .ZN(U1_next_state[3]) );
  NOR2X2 u_cell_479 ( .IN1(U1_next_state[4]), .IN2(U1_next_state[3]), .QN(
        U1_dr_sel_int_next) );
  NOR2X2 u_cell_477 ( .IN1(tap_state[0]), .IN2(net422), .QN(net416) );
  NOR2X2 u_cell_476 ( .IN1(tap_state[12]), .IN2(net384), .QN(net418) );
  NOR2X2 u_cell_475 ( .IN1(tap_state[4]), .IN2(tap_state[3]), .QN(net420) );
  NAND2X2 u_cell_474 ( .IN1(net420), .IN2(net421), .QN(net419) );
  INVX1 u_cell_473 ( .INP(net419), .ZN(net381) );
  NAND2X2 u_cell_472 ( .IN1(net418), .IN2(net381), .QN(net417) );
  INVX1 u_cell_471 ( .INP(net417), .ZN(net363) );
  NAND2X2 u_cell_470 ( .IN1(net416), .IN2(net363), .QN(net414) );
  NOR2X2 u_cell_469 ( .IN1(tap_state[15]), .IN2(tap_state[0]), .QN(net415) );
  NAND2X2 u_cell_468 ( .IN1(net415), .IN2(net363), .QN(net388) );
  MUX21X1 u_cell_467 ( .IN1(net414), .IN2(net388), .S(tap_state[1]), .Q(net413) );
  INVX1 u_cell_466 ( .INP(net413), .ZN(net411) );
  NAND2X2 u_cell_465 ( .IN1(net411), .IN2(net412), .QN(net405) );
  NAND3X0 u_cell_463 ( .IN1(net377), .IN2(net410), .IN3(tap_state[8]), .QN(
        net409) );
  NOR2X2 u_cell_462 ( .IN1(net408), .IN2(net409), .QN(net407) );
  INVX1 u_cell_461 ( .INP(net407), .ZN(net406) );
  NAND2X2 u_cell_460 ( .IN1(net405), .IN2(net406), .QN(net343) );
  INVX1 u_cell_459 ( .INP(net338), .ZN(net399) );
  XOR2X1 u_cell_458 ( .IN1(net404), .IN2(tap_state[11]), .Q(net402) );
  NOR2X2 u_cell_457 ( .IN1(net402), .IN2(net403), .QN(net401) );
  NAND2X2 u_cell_456 ( .IN1(net401), .IN2(net381), .QN(net400) );
  INVX1 u_cell_455 ( .INP(net400), .ZN(net351) );
  NOR2X2 u_cell_454 ( .IN1(net399), .IN2(net351), .QN(net398) );
  NAND2X2 u_cell_453 ( .IN1(net398), .IN2(net328), .QN(net390) );
  NAND3X0 u_cell_451 ( .IN1(net396), .IN2(tap_state[5]), .IN3(net397), .QN(
        net394) );
  NOR2X2 u_cell_450 ( .IN1(net394), .IN2(net395), .QN(net393) );
  NAND2X2 u_cell_449 ( .IN1(net392), .IN2(net393), .QN(net337) );
  NAND2X2 u_cell_448 ( .IN1(net333), .IN2(net337), .QN(net391) );
  NOR2X2 u_cell_447 ( .IN1(net390), .IN2(net391), .QN(net367) );
  NOR3X0 u_cell_446 ( .IN1(net389), .IN2(tap_state[1]), .IN3(tap_state[13]), 
        .QN(net387) );
  INVX1 u_cell_445 ( .INP(net388), .ZN(net372) );
  NAND2X2 u_cell_444 ( .IN1(net387), .IN2(net372), .QN(net386) );
  INVX1 u_cell_443 ( .INP(net386), .ZN(net345) );
  NOR2X2 u_cell_441 ( .IN1(tap_state[0]), .IN2(net385), .QN(net383) );
  INVX1 u_cell_440 ( .INP(net384), .ZN(net327) );
  NAND2X2 u_cell_439 ( .IN1(net383), .IN2(net327), .QN(net382) );
  NOR2X2 u_cell_438 ( .IN1(net382), .IN2(net364), .QN(net380) );
  NAND2X2 u_cell_437 ( .IN1(net380), .IN2(net381), .QN(net379) );
  INVX1 u_cell_436 ( .INP(net379), .ZN(net346) );
  NOR2X2 u_cell_435 ( .IN1(net345), .IN2(net346), .QN(net378) );
  INVX1 u_cell_434 ( .INP(net378), .ZN(net369) );
  NOR2X2 u_cell_433 ( .IN1(net360), .IN2(net377), .QN(net375) );
  NAND2X2 u_cell_432 ( .IN1(net375), .IN2(net376), .QN(net374) );
  INVX1 u_cell_431 ( .INP(net374), .ZN(net335) );
  NOR3X0 u_cell_430 ( .IN1(net373), .IN2(tap_state[1]), .IN3(tap_state[14]), 
        .QN(net371) );
  NAND2X2 u_cell_429 ( .IN1(net371), .IN2(net372), .QN(net370) );
  INVX1 u_cell_428 ( .INP(net370), .ZN(net348) );
  NOR3X0 u_cell_427 ( .IN1(net369), .IN2(net335), .IN3(net348), .QN(net368) );
  NAND2X2 u_cell_426 ( .IN1(net367), .IN2(net368), .QN(net366) );
  NOR2X2 u_cell_425 ( .IN1(net343), .IN2(net366), .QN(net354) );
  NOR2X2 u_cell_423 ( .IN1(net364), .IN2(net365), .QN(net362) );
  NAND2X2 u_cell_422 ( .IN1(net362), .IN2(net363), .QN(net342) );
  NOR2X2 u_cell_421 ( .IN1(tap_state[6]), .IN2(tap_state[2]), .QN(net361) );
  NAND2X2 u_cell_420 ( .IN1(net361), .IN2(tap_state[9]), .QN(net359) );
  NOR2X2 u_cell_419 ( .IN1(net359), .IN2(net360), .QN(net357) );
  NAND2X2 u_cell_418 ( .IN1(net357), .IN2(net358), .QN(net353) );
  NAND2X2 u_cell_417 ( .IN1(net342), .IN2(net353), .QN(net356) );
  INVX1 u_cell_416 ( .INP(net356), .ZN(net355) );
  MUX21X1 u_cell_415 ( .IN1(tms), .IN2(net354), .S(net355), .Q(
        U1_next_state[0]) );
  NOR2X2 u_cell_414 ( .IN1(tms), .IN2(net353), .QN(U1_next_state[10]) );
  NOR2X2 u_cell_413 ( .IN1(net351), .IN2(net345), .QN(net352) );
  NOR2X2 u_cell_412 ( .IN1(tms), .IN2(net352), .QN(U1_next_state[11]) );
  NAND2X2 u_cell_411 ( .IN1(net351), .IN2(tms), .QN(net350) );
  INVX1 u_cell_410 ( .INP(net350), .ZN(U1_next_state[12]) );
  NOR2X2 u_cell_409 ( .IN1(net348), .IN2(net346), .QN(net349) );
  NOR2X2 u_cell_408 ( .IN1(tms), .IN2(net349), .QN(U1_next_state[13]) );
  NAND2X2 u_cell_407 ( .IN1(net348), .IN2(tms), .QN(net347) );
  INVX1 u_cell_406 ( .INP(net347), .ZN(U1_next_state[14]) );
  NOR2X2 u_cell_405 ( .IN1(net345), .IN2(net346), .QN(net344) );
  NOR2X2 u_cell_404 ( .IN1(net344), .IN2(net329), .QN(U1_next_state[15]) );
  INVX1 u_cell_403 ( .INP(net343), .ZN(net339) );
  NAND2X2 u_cell_402 ( .IN1(net339), .IN2(net342), .QN(net341) );
  NAND2X2 u_cell_401 ( .IN1(net341), .IN2(net329), .QN(net340) );
  INVX1 u_cell_400 ( .INP(net340), .ZN(U1_next_state[1]) );
  NOR2X2 u_cell_399 ( .IN1(net339), .IN2(net329), .QN(U1_next_state[2]) );
  NOR2X2 u_cell_398 ( .IN1(net329), .IN2(net338), .QN(U1_next_state[5]) );
  INVX1 u_cell_397 ( .INP(net337), .ZN(net332) );
  NOR2X2 u_cell_396 ( .IN1(net335), .IN2(net332), .QN(net336) );
  NOR2X2 u_cell_395 ( .IN1(tms), .IN2(net336), .QN(U1_next_state[6]) );
  NAND2X2 u_cell_394 ( .IN1(net335), .IN2(tms), .QN(net334) );
  INVX1 u_cell_393 ( .INP(net334), .ZN(U1_next_state[7]) );
  INVX1 u_cell_392 ( .INP(net333), .ZN(net331) );
  NOR2X2 u_cell_391 ( .IN1(net331), .IN2(net332), .QN(net330) );
  NOR2X2 u_cell_390 ( .IN1(net330), .IN2(net329), .QN(U1_next_state[8]) );
  NOR2X2 u_cell_389 ( .IN1(net328), .IN2(net329), .QN(U1_next_state[9]) );
  INVX1 u_cell_388 ( .INP(U5_instruction_shift_1_), .ZN(net303) );
  INVX1 u_cell_387 ( .INP(instr_so), .ZN(net305) );
  INVX1 u_cell_386 ( .INP(shift_ir_int), .ZN(net292) );
  NAND2X2 u_cell_385 ( .IN1(net327), .IN2(net292), .QN(net314) );
  INVX1 u_cell_384 ( .INP(net314), .ZN(net326) );
  MUX21X1 u_cell_383 ( .IN1(net303), .IN2(net305), .S(net326), .Q(net325) );
  NAND2X2 u_cell_382 ( .IN1(net314), .IN2(net292), .QN(net309) );
  NAND2X2 u_cell_381 ( .IN1(net325), .IN2(net309), .QN(U5_U1_0_ffin) );
  NOR2X2 u_cell_380 ( .IN1(net314), .IN2(net303), .QN(net324) );
  INVX1 u_cell_379 ( .INP(net324), .ZN(net322) );
  NAND2X2 u_cell_378 ( .IN1(U5_instruction_shift_2_), .IN2(shift_ir_int), .QN(
        net323) );
  NAND2X2 u_cell_377 ( .IN1(net322), .IN2(net323), .QN(U5_U1_1_ffin) );
  INVX1 u_cell_376 ( .INP(U5_instruction_shift_2_), .ZN(net301) );
  NOR2X2 u_cell_375 ( .IN1(net314), .IN2(net301), .QN(net319) );
  NAND2X2 u_cell_374 ( .IN1(U5_instruction_shift_3_), .IN2(shift_ir_int), .QN(
        net321) );
  INVX1 u_cell_373 ( .INP(net321), .ZN(net320) );
  NOR2X2 u_cell_372 ( .IN1(net319), .IN2(net320), .QN(net315) );
  INVX1 u_cell_371 ( .INP(sentinel_val[0]), .ZN(net318) );
  NOR2X2 u_cell_370 ( .IN1(net309), .IN2(net318), .QN(net317) );
  INVX1 u_cell_369 ( .INP(net317), .ZN(net316) );
  NAND2X2 u_cell_368 ( .IN1(net315), .IN2(net316), .QN(U5_U1_2_ffin) );
  INVX1 u_cell_367 ( .INP(U5_instruction_shift_3_), .ZN(net299) );
  NOR2X2 u_cell_366 ( .IN1(net314), .IN2(net299), .QN(net311) );
  NAND2X2 u_cell_365 ( .IN1(shift_ir_int), .IN2(tdi), .QN(net313) );
  INVX1 u_cell_364 ( .INP(net313), .ZN(net312) );
  NOR2X2 u_cell_363 ( .IN1(net311), .IN2(net312), .QN(net306) );
  INVX1 u_cell_362 ( .INP(sentinel_val[1]), .ZN(net310) );
  NOR2X2 u_cell_361 ( .IN1(net309), .IN2(net310), .QN(net308) );
  INVX1 u_cell_360 ( .INP(net308), .ZN(net307) );
  NAND2X2 u_cell_359 ( .IN1(net306), .IN2(net307), .QN(U5_U1_3_ffin) );
  INVX1 u_cell_358 ( .INP(instructions[0]), .ZN(net304) );
  MUX21X1 u_cell_357 ( .IN1(net304), .IN2(net305), .S(tap_state[15]), .Q(
        U5_ff_d[0]) );
  INVX1 u_cell_356 ( .INP(instructions[1]), .ZN(net302) );
  MUX21X1 u_cell_355 ( .IN1(net302), .IN2(net303), .S(tap_state[15]), .Q(
        U5_ff_d[1]) );
  INVX1 u_cell_354 ( .INP(instructions[2]), .ZN(net300) );
  MUX21X1 u_cell_353 ( .IN1(net300), .IN2(net301), .S(tap_state[15]), .Q(
        U5_ff_d[2]) );
  INVX1 u_cell_352 ( .INP(instructions[3]), .ZN(net298) );
  MUX21X1 u_cell_351 ( .IN1(net298), .IN2(net299), .S(tap_state[15]), .Q(
        U5_ff_d[3]) );
  INVX1 u_cell_350 ( .INP(instr_rst), .ZN(net297) );
  MUX21X1 u_cell_349 ( .IN1(net297), .IN2(trst_n), .S(test), .Q(U5_rst_n) );
  NAND2X2 u_cell_348 ( .IN1(tdi), .IN2(shift_dr), .QN(net295) );
  INVX1 u_cell_347 ( .INP(byp_so), .ZN(net296) );
  MUX21X1 u_cell_346 ( .IN1(net295), .IN2(net296), .S(dr_sel_int), .Q(net294)
         );
  NOR2X2 u_cell_345 ( .IN1(tap_state[3]), .IN2(net294), .QN(U6_ffin) );
  NOR3X0 u_cell_344 ( .IN1(tap_state[3]), .IN2(tap_state[4]), .IN3(shift_dr), 
        .QN(sync_capture_en) );
  INVX1 u_cell_343 ( .INP(shift_dr), .ZN(net293) );
  NAND2X2 u_cell_342 ( .IN1(net292), .IN2(net293), .QN(tdo_en) );
  NAND2X2 u_cell_341 ( .IN1(instructions[2]), .IN2(instructions[3]), .QN(
        net290) );
  NAND2X2 u_cell_340 ( .IN1(instructions[0]), .IN2(instructions[1]), .QN(
        net291) );
  NOR2X2 u_cell_339 ( .IN1(net290), .IN2(net291), .QN(net289) );
  NOR2X2 u_cell_338 ( .IN1(net289), .IN2(bypass_sel), .QN(net288) );
  MUX21X1 u_cell_337 ( .IN1(byp_so), .IN2(so), .S(net288), .Q(net287) );
  MUX21X1 u_cell_336 ( .IN1(net287), .IN2(instr_so), .S(tap_state[11]), .Q(
        tdo_ffin) );
  DFFARX1 U1_current_state_reg_15_ ( .D(U1_next_state[15]), .CLK(tck), .RSTB(
        trst_n), .Q(tap_state[15]), .QN(net422) );
  DFFARX1 U1_current_state_reg_2_ ( .D(U1_next_state[2]), .CLK(tck), .RSTB(
        trst_n), .Q(tap_state[2]), .QN(net396) );
  DFFASX1 U1_current_state_reg_0_ ( .D(U1_next_state[0]), .CLK(tck), .SETB(
        trst_n), .Q(tap_state[0]), .QN(net365) );
  DFFARX1 U1_current_state_reg_1_ ( .D(U1_next_state[1]), .CLK(tck), .RSTB(
        trst_n), .Q(tap_state[1]) );
  DFFARX1 U1_current_state_reg_14_ ( .D(U1_next_state[14]), .CLK(tck), .RSTB(
        trst_n), .Q(tap_state[14]), .QN(net389) );
  DFFARX1 U1_current_state_reg_13_ ( .D(U1_next_state[13]), .CLK(tck), .RSTB(
        trst_n), .Q(tap_state[13]), .QN(net373) );
  DFFARX1 U1_current_state_reg_11_ ( .D(U1_next_state[11]), .CLK(tck), .RSTB(
        trst_n), .Q(tap_state[11]), .QN(net450) );
  DFFARX1 U1_current_state_reg_12_ ( .D(U1_next_state[12]), .CLK(tck), .RSTB(
        trst_n), .Q(tap_state[12]), .QN(net385) );
  DFFARX1 U1_current_state_reg_4_ ( .D(U1_next_state[4]), .CLK(tck), .RSTB(
        trst_n), .Q(tap_state[4]), .QN(net440) );
  DFFARX1 U1_current_state_reg_5_ ( .D(U1_next_state[5]), .CLK(tck), .RSTB(
        trst_n), .Q(tap_state[5]) );
  DFFARX1 U1_current_state_reg_8_ ( .D(U1_next_state[8]), .CLK(tck), .RSTB(
        trst_n), .Q(tap_state[8]), .QN(net434) );
  DFFARX1 U1_current_state_reg_6_ ( .D(U1_next_state[6]), .CLK(tck), .RSTB(
        trst_n), .Q(tap_state[6]), .QN(net377) );
  DFFARX1 U1_current_state_reg_7_ ( .D(U1_next_state[7]), .CLK(tck), .RSTB(
        trst_n), .Q(tap_state[7]), .QN(net410) );
  DFFARX1 U1_current_state_reg_9_ ( .D(U1_next_state[9]), .CLK(tck), .RSTB(
        trst_n), .Q(tap_state[9]) );
  DFFARX1 U1_current_state_reg_3_ ( .D(U1_next_state[3]), .CLK(tck), .RSTB(
        trst_n), .Q(tap_state[3]), .QN(net397) );
  DFFARX1 U1_current_state_reg_10_ ( .D(U1_next_state[10]), .CLK(tck), .RSTB(
        trst_n), .Q(tap_state[10]), .QN(net404) );
  DFFARX1 U1_dr_sel_int_reg ( .D(U1_dr_sel_int_next), .CLK(tck), .RSTB(trst_n), 
        .Q(dr_sel_int) );
  DFFX1 U8 ( .D(tdo_ffin), .CLK(tck_n), .Q(tdo) );
  DFFX1 U6_U4 ( .D(U6_ffin), .CLK(tck), .Q(byp_so) );
  DFFX1 U5_U1_3_U3 ( .D(U5_U1_3_ffin), .CLK(tck), .Q(U5_instruction_shift_3_)
         );
  DFFX1 U5_U1_2_U3 ( .D(U5_U1_2_ffin), .CLK(tck), .Q(U5_instruction_shift_2_)
         );
  DFFX1 U5_U1_1_U3 ( .D(U5_U1_1_ffin), .CLK(tck), .Q(U5_instruction_shift_1_)
         );
  DFFX1 U5_U1_0_U3 ( .D(U5_U1_0_ffin), .CLK(tck), .Q(instr_so) );
  DFFARX1 U5_U3_3 ( .D(U5_ff_d[3]), .CLK(tck_n), .RSTB(U5_rst_n), .QN(
        instructions[3]) );
  DFFARX1 U5_U3_2 ( .D(U5_ff_d[2]), .CLK(tck_n), .RSTB(U5_rst_n), .QN(
        instructions[2]) );
  DFFARX1 U5_U3_1 ( .D(U5_ff_d[1]), .CLK(tck_n), .RSTB(U5_rst_n), .QN(
        instructions[1]) );
  DFFARX1 U5_U3_0 ( .D(U5_ff_d[0]), .CLK(tck_n), .RSTB(U5_rst_n), .QN(
        instructions[0]) );
  DFFARX1 U1_U9 ( .D(tap_state[0]), .CLK(tck_n), .RSTB(trst_n), .QN(U1_net41)
         );
  DFFARX1 U1_U8 ( .D(tap_state[11]), .CLK(tck_n), .RSTB(trst_n), .Q(
        shift_ir_int) );
  DFFARX1 U1_U7 ( .D(tap_state[4]), .CLK(tck_n), .RSTB(trst_n), .Q(shift_dr)
         );
  NBUFFX32 u_cell_580 ( .INP(tap_state[8]), .Z(sync_update_dr) );
endmodule


module TOP_DW_bc_4 ( capture_clk, capture_en, shift_dr, si, data_in, so, 
        data_out );
  input capture_clk, capture_en, shift_dr, si, data_in;
  output so, data_out;
  wire   U1_ffin, net508;

  MUX21X1 u_cell_592 ( .IN1(data_in), .IN2(si), .S(shift_dr), .Q(net508) );
  MUX21X1 u_cell_591 ( .IN1(net508), .IN2(so), .S(capture_en), .Q(U1_ffin) );
  DFFX1 U1_U3 ( .D(U1_ffin), .CLK(capture_clk), .Q(so) );
  NBUFFX32 u_cell_597 ( .INP(data_in), .Z(data_out) );
endmodule


module TOP_DW_bc_2_test_0 ( capture_clk, update_clk, capture_en, update_en, 
        shift_dr, mode, si, data_in, data_out, so );
  input capture_clk, update_clk, capture_en, update_en, shift_dr, mode, si,
         data_in;
  output data_out, so;
  wire   update_out, U1_U1_ffin, U1_ffin, net539, net538, net537, net536;

  INVX1 u_cell_613 ( .INP(data_in), .ZN(net538) );
  INVX1 u_cell_612 ( .INP(update_out), .ZN(net539) );
  MUX21X1 u_cell_611 ( .IN1(net538), .IN2(net539), .S(mode), .Q(net537) );
  INVX1 u_cell_610 ( .INP(net537), .ZN(data_out) );
  MUX21X1 u_cell_609 ( .IN1(data_out), .IN2(si), .S(shift_dr), .Q(net536) );
  MUX21X1 u_cell_608 ( .IN1(net536), .IN2(so), .S(capture_en), .Q(U1_U1_ffin)
         );
  MUX21X1 u_cell_607 ( .IN1(update_out), .IN2(so), .S(update_en), .Q(U1_ffin)
         );
  DFFX1 U1_U1_U3 ( .D(U1_U1_ffin), .CLK(capture_clk), .Q(so) );
  DFFX1 U1_U3 ( .D(U1_ffin), .CLK(update_clk), .Q(update_out) );
endmodule


module TOP_DW_bc_2_test_1 ( capture_clk, update_clk, capture_en, update_en, 
        shift_dr, mode, si, data_in, data_out, so );
  input capture_clk, update_clk, capture_en, update_en, shift_dr, mode, si,
         data_in;
  output data_out, so;
  wire   update_out, U1_U1_ffin, U1_ffin, net539, net538, net537, net536;

  INVX1 u_cell_613 ( .INP(data_in), .ZN(net538) );
  INVX1 u_cell_612 ( .INP(update_out), .ZN(net539) );
  MUX21X1 u_cell_611 ( .IN1(net538), .IN2(net539), .S(mode), .Q(net537) );
  INVX1 u_cell_610 ( .INP(net537), .ZN(data_out) );
  MUX21X1 u_cell_609 ( .IN1(data_out), .IN2(si), .S(shift_dr), .Q(net536) );
  MUX21X1 u_cell_608 ( .IN1(net536), .IN2(so), .S(capture_en), .Q(U1_U1_ffin)
         );
  MUX21X1 u_cell_607 ( .IN1(update_out), .IN2(so), .S(update_en), .Q(U1_ffin)
         );
  DFFX1 U1_U1_U3 ( .D(U1_U1_ffin), .CLK(capture_clk), .Q(so) );
  DFFX1 U1_U3 ( .D(U1_ffin), .CLK(update_clk), .Q(update_out) );
endmodule


module TOP_DW_bc_2_test_2 ( capture_clk, update_clk, capture_en, update_en, 
        shift_dr, mode, si, data_in, data_out, so );
  input capture_clk, update_clk, capture_en, update_en, shift_dr, mode, si,
         data_in;
  output data_out, so;
  wire   update_out, U1_U1_ffin, U1_ffin, net539, net538, net537, net536;

  INVX1 u_cell_613 ( .INP(data_in), .ZN(net538) );
  INVX1 u_cell_612 ( .INP(update_out), .ZN(net539) );
  MUX21X1 u_cell_611 ( .IN1(net538), .IN2(net539), .S(mode), .Q(net537) );
  INVX1 u_cell_610 ( .INP(net537), .ZN(data_out) );
  MUX21X1 u_cell_609 ( .IN1(data_out), .IN2(si), .S(shift_dr), .Q(net536) );
  MUX21X1 u_cell_608 ( .IN1(net536), .IN2(so), .S(capture_en), .Q(U1_U1_ffin)
         );
  MUX21X1 u_cell_607 ( .IN1(update_out), .IN2(so), .S(update_en), .Q(U1_ffin)
         );
  DFFX1 U1_U1_U3 ( .D(U1_U1_ffin), .CLK(capture_clk), .Q(so) );
  DFFX1 U1_U3 ( .D(U1_ffin), .CLK(update_clk), .Q(update_out) );
endmodule


module TOP_DW_bc_2_test_3 ( capture_clk, update_clk, capture_en, update_en, 
        shift_dr, mode, si, data_in, data_out, so );
  input capture_clk, update_clk, capture_en, update_en, shift_dr, mode, si,
         data_in;
  output data_out, so;
  wire   update_out, U1_U1_ffin, U1_ffin, net539, net538, net537, net536;

  INVX1 u_cell_613 ( .INP(data_in), .ZN(net538) );
  INVX1 u_cell_612 ( .INP(update_out), .ZN(net539) );
  MUX21X1 u_cell_611 ( .IN1(net538), .IN2(net539), .S(mode), .Q(net537) );
  INVX1 u_cell_610 ( .INP(net537), .ZN(data_out) );
  MUX21X1 u_cell_609 ( .IN1(data_out), .IN2(si), .S(shift_dr), .Q(net536) );
  MUX21X1 u_cell_608 ( .IN1(net536), .IN2(so), .S(capture_en), .Q(U1_U1_ffin)
         );
  MUX21X1 u_cell_607 ( .IN1(update_out), .IN2(so), .S(update_en), .Q(U1_ffin)
         );
  DFFX1 U1_U1_U3 ( .D(U1_U1_ffin), .CLK(capture_clk), .Q(so) );
  DFFX1 U1_U3 ( .D(U1_ffin), .CLK(update_clk), .Q(update_out) );
endmodule


module TOP_DW_bc_2_test_4 ( capture_clk, update_clk, capture_en, update_en, 
        shift_dr, mode, si, data_in, data_out, so );
  input capture_clk, update_clk, capture_en, update_en, shift_dr, mode, si,
         data_in;
  output data_out, so;
  wire   update_out, U1_U1_ffin, U1_ffin, net539, net538, net537, net536;

  INVX1 u_cell_613 ( .INP(data_in), .ZN(net538) );
  INVX1 u_cell_612 ( .INP(update_out), .ZN(net539) );
  MUX21X1 u_cell_611 ( .IN1(net538), .IN2(net539), .S(mode), .Q(net537) );
  INVX1 u_cell_610 ( .INP(net537), .ZN(data_out) );
  MUX21X1 u_cell_609 ( .IN1(data_out), .IN2(si), .S(shift_dr), .Q(net536) );
  MUX21X1 u_cell_608 ( .IN1(net536), .IN2(so), .S(capture_en), .Q(U1_U1_ffin)
         );
  MUX21X1 u_cell_607 ( .IN1(update_out), .IN2(so), .S(update_en), .Q(U1_ffin)
         );
  DFFX1 U1_U1_U3 ( .D(U1_U1_ffin), .CLK(capture_clk), .Q(so) );
  DFFX1 U1_U3 ( .D(U1_ffin), .CLK(update_clk), .Q(update_out) );
endmodule


module TOP_DW_bc_2_test_5 ( capture_clk, update_clk, capture_en, update_en, 
        shift_dr, mode, si, data_in, data_out, so );
  input capture_clk, update_clk, capture_en, update_en, shift_dr, mode, si,
         data_in;
  output data_out, so;
  wire   update_out, U1_U1_ffin, U1_ffin, net539, net538, net537, net536;

  INVX1 u_cell_613 ( .INP(data_in), .ZN(net538) );
  INVX1 u_cell_612 ( .INP(update_out), .ZN(net539) );
  MUX21X1 u_cell_611 ( .IN1(net538), .IN2(net539), .S(mode), .Q(net537) );
  INVX1 u_cell_610 ( .INP(net537), .ZN(data_out) );
  MUX21X1 u_cell_609 ( .IN1(data_out), .IN2(si), .S(shift_dr), .Q(net536) );
  MUX21X1 u_cell_608 ( .IN1(net536), .IN2(so), .S(capture_en), .Q(U1_U1_ffin)
         );
  MUX21X1 u_cell_607 ( .IN1(update_out), .IN2(so), .S(update_en), .Q(U1_ffin)
         );
  DFFX1 U1_U1_U3 ( .D(U1_U1_ffin), .CLK(capture_clk), .Q(so) );
  DFFX1 U1_U3 ( .D(U1_ffin), .CLK(update_clk), .Q(update_out) );
endmodule


module TOP_DW_bc_2_test_6 ( capture_clk, update_clk, capture_en, update_en, 
        shift_dr, mode, si, data_in, data_out, so );
  input capture_clk, update_clk, capture_en, update_en, shift_dr, mode, si,
         data_in;
  output data_out, so;
  wire   update_out, U1_U1_ffin, U1_ffin, net539, net538, net537, net536;

  INVX1 u_cell_613 ( .INP(data_in), .ZN(net538) );
  INVX1 u_cell_612 ( .INP(update_out), .ZN(net539) );
  MUX21X1 u_cell_611 ( .IN1(net538), .IN2(net539), .S(mode), .Q(net537) );
  INVX1 u_cell_610 ( .INP(net537), .ZN(data_out) );
  MUX21X1 u_cell_609 ( .IN1(data_out), .IN2(si), .S(shift_dr), .Q(net536) );
  MUX21X1 u_cell_608 ( .IN1(net536), .IN2(so), .S(capture_en), .Q(U1_U1_ffin)
         );
  MUX21X1 u_cell_607 ( .IN1(update_out), .IN2(so), .S(update_en), .Q(U1_ffin)
         );
  DFFX1 U1_U1_U3 ( .D(U1_U1_ffin), .CLK(capture_clk), .Q(so) );
  DFFX1 U1_U3 ( .D(U1_ffin), .CLK(update_clk), .Q(update_out) );
endmodule


module TOP_DW_bc_2_test_7 ( capture_clk, update_clk, capture_en, update_en, 
        shift_dr, mode, si, data_in, data_out, so );
  input capture_clk, update_clk, capture_en, update_en, shift_dr, mode, si,
         data_in;
  output data_out, so;
  wire   update_out, U1_U1_ffin, U1_ffin, net539, net538, net537, net536;

  INVX1 u_cell_613 ( .INP(data_in), .ZN(net538) );
  INVX1 u_cell_612 ( .INP(update_out), .ZN(net539) );
  MUX21X1 u_cell_611 ( .IN1(net538), .IN2(net539), .S(mode), .Q(net537) );
  INVX1 u_cell_610 ( .INP(net537), .ZN(data_out) );
  MUX21X1 u_cell_609 ( .IN1(data_out), .IN2(si), .S(shift_dr), .Q(net536) );
  MUX21X1 u_cell_608 ( .IN1(net536), .IN2(so), .S(capture_en), .Q(U1_U1_ffin)
         );
  MUX21X1 u_cell_607 ( .IN1(update_out), .IN2(so), .S(update_en), .Q(U1_ffin)
         );
  DFFX1 U1_U1_U3 ( .D(U1_U1_ffin), .CLK(capture_clk), .Q(so) );
  DFFX1 U1_U3 ( .D(U1_ffin), .CLK(update_clk), .Q(update_out) );
endmodule


module TOP_DW_bc_2_test_8 ( capture_clk, update_clk, capture_en, update_en, 
        shift_dr, mode, si, data_in, data_out, so );
  input capture_clk, update_clk, capture_en, update_en, shift_dr, mode, si,
         data_in;
  output data_out, so;
  wire   update_out, U1_U1_ffin, U1_ffin, net539, net538, net537, net536;

  INVX1 u_cell_613 ( .INP(data_in), .ZN(net538) );
  INVX1 u_cell_612 ( .INP(update_out), .ZN(net539) );
  MUX21X1 u_cell_611 ( .IN1(net538), .IN2(net539), .S(mode), .Q(net537) );
  INVX1 u_cell_610 ( .INP(net537), .ZN(data_out) );
  MUX21X1 u_cell_609 ( .IN1(data_out), .IN2(si), .S(shift_dr), .Q(net536) );
  MUX21X1 u_cell_608 ( .IN1(net536), .IN2(so), .S(capture_en), .Q(U1_U1_ffin)
         );
  MUX21X1 u_cell_607 ( .IN1(update_out), .IN2(so), .S(update_en), .Q(U1_ffin)
         );
  DFFX1 U1_U1_U3 ( .D(U1_U1_ffin), .CLK(capture_clk), .Q(so) );
  DFFX1 U1_U3 ( .D(U1_ffin), .CLK(update_clk), .Q(update_out) );
endmodule


module TOP_DW_bc_1_test_0 ( capture_clk, update_clk, capture_en, update_en, 
        shift_dr, mode, si, data_in, data_out, so );
  input capture_clk, update_clk, capture_en, update_en, shift_dr, mode, si,
         data_in;
  output data_out, so;
  wire   temp_out, U1_U1_ffin, U1_ffin, net566;

  MUX21X1 u_cell_637 ( .IN1(data_in), .IN2(si), .S(shift_dr), .Q(net566) );
  MUX21X1 u_cell_636 ( .IN1(net566), .IN2(so), .S(capture_en), .Q(U1_U1_ffin)
         );
  MUX21X1 u_cell_635 ( .IN1(temp_out), .IN2(so), .S(update_en), .Q(U1_ffin) );
  MUX21X1 u_cell_634 ( .IN1(data_in), .IN2(temp_out), .S(mode), .Q(data_out)
         );
  DFFX1 U1_U1_U3 ( .D(U1_U1_ffin), .CLK(capture_clk), .Q(so) );
  DFFX1 U1_U3 ( .D(U1_ffin), .CLK(update_clk), .Q(temp_out) );
endmodule


module TOP_DW_bc_1_test_1 ( capture_clk, update_clk, capture_en, update_en, 
        shift_dr, mode, si, data_in, data_out, so );
  input capture_clk, update_clk, capture_en, update_en, shift_dr, mode, si,
         data_in;
  output data_out, so;
  wire   temp_out, U1_U1_ffin, U1_ffin, net566;

  MUX21X1 u_cell_637 ( .IN1(data_in), .IN2(si), .S(shift_dr), .Q(net566) );
  MUX21X1 u_cell_636 ( .IN1(net566), .IN2(so), .S(capture_en), .Q(U1_U1_ffin)
         );
  MUX21X1 u_cell_635 ( .IN1(temp_out), .IN2(so), .S(update_en), .Q(U1_ffin) );
  MUX21X1 u_cell_634 ( .IN1(data_in), .IN2(temp_out), .S(mode), .Q(data_out)
         );
  DFFX1 U1_U1_U3 ( .D(U1_U1_ffin), .CLK(capture_clk), .Q(so) );
  DFFX1 U1_U3 ( .D(U1_ffin), .CLK(update_clk), .Q(temp_out) );
endmodule


module TOP_DW_bc_1_test_2 ( capture_clk, update_clk, capture_en, update_en, 
        shift_dr, mode, si, data_in, data_out, so );
  input capture_clk, update_clk, capture_en, update_en, shift_dr, mode, si,
         data_in;
  output data_out, so;
  wire   temp_out, U1_U1_ffin, U1_ffin, net566;

  MUX21X1 u_cell_637 ( .IN1(data_in), .IN2(si), .S(shift_dr), .Q(net566) );
  MUX21X1 u_cell_636 ( .IN1(net566), .IN2(so), .S(capture_en), .Q(U1_U1_ffin)
         );
  MUX21X1 u_cell_635 ( .IN1(temp_out), .IN2(so), .S(update_en), .Q(U1_ffin) );
  MUX21X1 u_cell_634 ( .IN1(data_in), .IN2(temp_out), .S(mode), .Q(data_out)
         );
  DFFX1 U1_U1_U3 ( .D(U1_U1_ffin), .CLK(capture_clk), .Q(so) );
  DFFX1 U1_U3 ( .D(U1_ffin), .CLK(update_clk), .Q(temp_out) );
endmodule


module TOP_DW_bc_1_test_3 ( capture_clk, update_clk, capture_en, update_en, 
        shift_dr, mode, si, data_in, data_out, so );
  input capture_clk, update_clk, capture_en, update_en, shift_dr, mode, si,
         data_in;
  output data_out, so;
  wire   temp_out, U1_U1_ffin, U1_ffin, net566;

  MUX21X1 u_cell_637 ( .IN1(data_in), .IN2(si), .S(shift_dr), .Q(net566) );
  MUX21X1 u_cell_636 ( .IN1(net566), .IN2(so), .S(capture_en), .Q(U1_U1_ffin)
         );
  MUX21X1 u_cell_635 ( .IN1(temp_out), .IN2(so), .S(update_en), .Q(U1_ffin) );
  MUX21X1 u_cell_634 ( .IN1(data_in), .IN2(temp_out), .S(mode), .Q(data_out)
         );
  DFFX1 U1_U1_U3 ( .D(U1_U1_ffin), .CLK(capture_clk), .Q(so) );
  DFFX1 U1_U3 ( .D(U1_ffin), .CLK(update_clk), .Q(temp_out) );
endmodule


module TOP_DW_bc_2 ( capture_clk, update_clk, capture_en, update_en, shift_dr, 
        mode, si, data_in, data_out, so );
  input capture_clk, update_clk, capture_en, update_en, shift_dr, mode, si,
         data_in;
  output data_out, so;
  wire   update_out, U1_U1_ffin, U1_ffin, net539, net538, net537, net536;

  INVX1 u_cell_613 ( .INP(data_in), .ZN(net538) );
  INVX1 u_cell_612 ( .INP(update_out), .ZN(net539) );
  MUX21X1 u_cell_611 ( .IN1(net538), .IN2(net539), .S(mode), .Q(net537) );
  INVX1 u_cell_610 ( .INP(net537), .ZN(data_out) );
  MUX21X1 u_cell_609 ( .IN1(data_out), .IN2(si), .S(shift_dr), .Q(net536) );
  MUX21X1 u_cell_608 ( .IN1(net536), .IN2(so), .S(capture_en), .Q(U1_U1_ffin)
         );
  MUX21X1 u_cell_607 ( .IN1(update_out), .IN2(so), .S(update_en), .Q(U1_ffin)
         );
  DFFX1 U1_U1_U3 ( .D(U1_U1_ffin), .CLK(capture_clk), .Q(so) );
  DFFX1 U1_U3 ( .D(U1_ffin), .CLK(update_clk), .Q(update_out) );
endmodule


module TOP_DW_bc_1 ( capture_clk, update_clk, capture_en, update_en, shift_dr, 
        mode, si, data_in, data_out, so );
  input capture_clk, update_clk, capture_en, update_en, shift_dr, mode, si,
         data_in;
  output data_out, so;
  wire   temp_out, U1_U1_ffin, U1_ffin, net566;

  MUX21X1 u_cell_637 ( .IN1(data_in), .IN2(si), .S(shift_dr), .Q(net566) );
  MUX21X1 u_cell_636 ( .IN1(net566), .IN2(so), .S(capture_en), .Q(U1_U1_ffin)
         );
  MUX21X1 u_cell_635 ( .IN1(temp_out), .IN2(so), .S(update_en), .Q(U1_ffin) );
  MUX21X1 u_cell_634 ( .IN1(data_in), .IN2(temp_out), .S(mode), .Q(data_out)
         );
  DFFX1 U1_U1_U3 ( .D(U1_U1_ffin), .CLK(capture_clk), .Q(so) );
  DFFX1 U1_U3 ( .D(U1_ffin), .CLK(update_clk), .Q(temp_out) );
endmodule


module TOP_Decoder_inst_design ( TOP_instructions_3_, TOP_instructions_2_, 
        TOP_instructions_1_, TOP_instructions_0_, SCANCH, SAMPLE, PRELOAD, 
        EXTEST, CLAMP, BYPASS );
  input TOP_instructions_3_, TOP_instructions_2_, TOP_instructions_1_,
         TOP_instructions_0_;
  output SCANCH, SAMPLE, PRELOAD, EXTEST, CLAMP, BYPASS;
  wire   net910, net909, net908, net907, net906, net905, net904, net903,
         net902, net901, net900, net899;

  NAND3X0 u_cell_840 ( .IN1(TOP_instructions_2_), .IN2(TOP_instructions_0_), 
        .IN3(TOP_instructions_3_), .QN(net899) );
  INVX1 u_cell_839 ( .INP(TOP_instructions_1_), .ZN(net906) );
  NOR2X2 u_cell_838 ( .IN1(net899), .IN2(net906), .QN(BYPASS) );
  INVX1 u_cell_837 ( .INP(TOP_instructions_2_), .ZN(net903) );
  INVX1 u_cell_836 ( .INP(TOP_instructions_3_), .ZN(net907) );
  NAND2X2 u_cell_835 ( .IN1(net903), .IN2(net907), .QN(net908) );
  INVX1 u_cell_834 ( .INP(TOP_instructions_0_), .ZN(net910) );
  NAND2X2 u_cell_833 ( .IN1(TOP_instructions_1_), .IN2(net910), .QN(net909) );
  NOR2X2 u_cell_832 ( .IN1(net908), .IN2(net909), .QN(CLAMP) );
  NAND2X2 u_cell_831 ( .IN1(net903), .IN2(net907), .QN(net904) );
  NAND2X2 u_cell_830 ( .IN1(TOP_instructions_0_), .IN2(net906), .QN(net905) );
  NOR2X2 u_cell_829 ( .IN1(net904), .IN2(net905), .QN(EXTEST) );
  NOR2X2 u_cell_828 ( .IN1(TOP_instructions_0_), .IN2(net903), .QN(net901) );
  NOR2X2 u_cell_827 ( .IN1(TOP_instructions_3_), .IN2(TOP_instructions_1_), 
        .QN(net902) );
  NAND2X2 u_cell_826 ( .IN1(net901), .IN2(net902), .QN(net900) );
  NOR2X2 u_cell_824 ( .IN1(TOP_instructions_1_), .IN2(net899), .QN(SCANCH) );
  INVX0 u_cell_846 ( .INP(net900), .ZN(SAMPLE) );
  DELLN1X2 u_cell_845 ( .INP(SAMPLE), .Z(PRELOAD) );
endmodule


module TOP_BSR_mode_inst_design ( test_so, test_si_1, test_se, tck, net674, 
        net670, net665, net657, net614, net612, clk, TOP_tdo, TOP_tdi, 
        TOP_si_15, TOP_shift_dr, TOP_inv_in, TOP_instructions_3_, 
        TOP_instructions_2_, TOP_instructions_1_, TOP_instructions_0_, 
        TOP_bypass_sel, TOP_INV_ABC_5, TOP_INV_ABC_4, TOP_INV_ABC_3, 
        TOP_INV_ABC_1, SCANCH );
  input test_so, test_si_1, test_se, net614, net612, clk, TOP_tdo, TOP_tdi,
         TOP_si_15, TOP_inv_in, TOP_instructions_3_, TOP_instructions_2_,
         TOP_instructions_1_, TOP_instructions_0_, TOP_INV_ABC_5;
  output tck, net674, net670, net665, net657, TOP_shift_dr, TOP_bypass_sel,
         TOP_INV_ABC_4, TOP_INV_ABC_3, TOP_INV_ABC_1, SCANCH;
  wire   BYPASS, CLAMP, EXTEST, PRELOAD, SAMPLE, net650, net651, net962,
         net961, net960, net959, net958, net957, net956, net955, net954,
         net953, net952, net951, net950;

  INVX1 u_cell_870 ( .INP(EXTEST), .ZN(net961) );
  INVX1 u_cell_869 ( .INP(CLAMP), .ZN(net962) );
  NAND2X2 u_cell_868 ( .IN1(net961), .IN2(net962), .QN(TOP_INV_ABC_1) );
  INVX1 u_cell_867 ( .INP(net612), .ZN(net650) );
  INVX1 u_cell_866 ( .INP(SCANCH), .ZN(net959) );
  NOR2X2 u_cell_865 ( .IN1(EXTEST), .IN2(SAMPLE), .QN(net960) );
  INVX1 u_cell_864 ( .INP(PRELOAD), .ZN(net955) );
  NAND3X0 u_cell_863 ( .IN1(net959), .IN2(net960), .IN3(net955), .QN(net958)
         );
  NAND2X2 u_cell_862 ( .IN1(net650), .IN2(net958), .QN(TOP_INV_ABC_3) );
  INVX1 u_cell_861 ( .INP(net958), .ZN(net956) );
  INVX1 u_cell_860 ( .INP(net614), .ZN(net957) );
  NOR2X2 u_cell_859 ( .IN1(net956), .IN2(net957), .QN(TOP_INV_ABC_4) );
  NOR2X2 u_cell_858 ( .IN1(CLAMP), .IN2(BYPASS), .QN(net952) );
  NOR2X2 u_cell_857 ( .IN1(SAMPLE), .IN2(EXTEST), .QN(net954) );
  NAND2X2 u_cell_856 ( .IN1(net954), .IN2(net955), .QN(net953) );
  NAND2X2 u_cell_855 ( .IN1(net952), .IN2(net953), .QN(TOP_bypass_sel) );
  MUX21X1 u_cell_854 ( .IN1(test_se), .IN2(TOP_INV_ABC_5), .S(SCANCH), .Q(
        TOP_shift_dr) );
  NAND2X2 u_cell_853 ( .IN1(TOP_inv_in), .IN2(net651), .QN(net951) );
  NOR2X2 u_cell_852 ( .IN1(net612), .IN2(net951), .QN(net950) );
  MUX21X1 u_cell_851 ( .IN1(clk), .IN2(net950), .S(SCANCH), .Q(net657) );
  MUX21X1 u_cell_850 ( .IN1(test_si_1), .IN2(TOP_si_15), .S(SCANCH), .Q(net670) );
  MUX21X1 u_cell_849 ( .IN1(TOP_tdo), .IN2(test_so), .S(SCANCH), .Q(net674) );
  INVX1 u_cell_848 ( .INP(TOP_inv_in), .ZN(tck) );
  DFFX1 TOP_STT_CLK_REG ( .D(net650), .CLK(tck), .Q(net651) );
  TOP_Decoder_inst_design TOP_Decoder_inst ( .TOP_instructions_3_(
        TOP_instructions_3_), .TOP_instructions_2_(TOP_instructions_2_), 
        .TOP_instructions_1_(TOP_instructions_1_), .TOP_instructions_0_(
        TOP_instructions_0_), .SCANCH(SCANCH), .SAMPLE(SAMPLE), .PRELOAD(
        PRELOAD), .EXTEST(EXTEST), .CLAMP(CLAMP), .BYPASS(BYPASS) );
  NBUFFX2 u_cell_876 ( .INP(TOP_tdi), .Z(net665) );
endmodule


module TOP_BSR_top_inst_design ( y_i_3_, y_i_2_, y_i_1_, y_i_0_, x_i_3_, 
        x_i_2_, x_i_1_, x_i_0_, test_so, test_se, net674, net670, net657, 
        net614, net612, go_i, d_o_3_, d_o_2_, d_o_1_, d_o_0_, clk, TOP_tdo, 
        TOP_tdi, TOP_si_15, TOP_shift_dr, TOP_inv_in, TOP_instructions_3_, 
        TOP_instructions_2_, TOP_instructions_1_, TOP_instructions_0_, 
        TOP_data_out_4, TOP_data_out_3, TOP_data_out_2, TOP_data_out_1, 
        TOP_data_out, TOP_data_in_9, TOP_data_in_8, TOP_data_in_7, 
        TOP_data_in_6, TOP_data_in_5, TOP_data_in_4, TOP_data_in_3, 
        TOP_data_in_2, TOP_data_in_1, TOP_data_in, TOP_bypass_sel, 
        TOP_INV_ABC_5 );
  input test_so, test_se, net614, net612, d_o_3_, d_o_2_, d_o_1_, d_o_0_, clk,
         TOP_tdo, TOP_tdi, TOP_inv_in, TOP_instructions_3_,
         TOP_instructions_2_, TOP_instructions_1_, TOP_instructions_0_,
         TOP_data_in_9, TOP_data_in_8, TOP_data_in_7, TOP_data_in_6,
         TOP_data_in_5, TOP_data_in_4, TOP_data_in_3, TOP_data_in_2,
         TOP_data_in_1, TOP_data_in, TOP_INV_ABC_5;
  output y_i_3_, y_i_2_, y_i_1_, y_i_0_, x_i_3_, x_i_2_, x_i_1_, x_i_0_,
         net674, net670, net657, go_i, TOP_si_15, TOP_shift_dr, TOP_data_out_4,
         TOP_data_out_3, TOP_data_out_2, TOP_data_out_1, TOP_data_out,
         TOP_bypass_sel;
  wire   SCANCH, TOP_INV_ABC_1, TOP_INV_ABC_3, TOP_INV_ABC_4, TOP_si, TOP_si_1,
         TOP_si_10, TOP_si_11, TOP_si_12, TOP_si_13, TOP_si_14, TOP_si_2,
         TOP_si_3, TOP_si_4, TOP_si_5, TOP_si_6, TOP_si_7, TOP_si_8, TOP_si_9,
         net665, tck, test_si_1;

  TOP_DW_bc_4 TOP_CLK_bsr1 ( .capture_clk(TOP_inv_in), .capture_en(
        TOP_INV_ABC_3), .shift_dr(TOP_INV_ABC_5), .si(net665), .data_in(clk), 
        .so(TOP_si) );
  TOP_DW_bc_2_test_0 TOP_GO_I_bsr2 ( .capture_clk(TOP_inv_in), .update_clk(tck), .capture_en(TOP_INV_ABC_3), .update_en(TOP_INV_ABC_4), .shift_dr(
        TOP_INV_ABC_5), .mode(SCANCH), .si(TOP_si), .data_in(TOP_data_in), 
        .data_out(go_i), .so(TOP_si_1) );
  TOP_DW_bc_2_test_1 TOP_X_I_0__bsr3 ( .capture_clk(TOP_inv_in), .update_clk(
        tck), .capture_en(TOP_INV_ABC_3), .update_en(TOP_INV_ABC_4), 
        .shift_dr(TOP_INV_ABC_5), .mode(SCANCH), .si(TOP_si_1), .data_in(
        TOP_data_in_1), .data_out(x_i_0_), .so(TOP_si_2) );
  TOP_DW_bc_2_test_2 TOP_X_I_1__bsr4 ( .capture_clk(TOP_inv_in), .update_clk(
        tck), .capture_en(TOP_INV_ABC_3), .update_en(TOP_INV_ABC_4), 
        .shift_dr(TOP_INV_ABC_5), .mode(SCANCH), .si(TOP_si_2), .data_in(
        TOP_data_in_2), .data_out(x_i_1_), .so(TOP_si_3) );
  TOP_DW_bc_2_test_3 TOP_X_I_2__bsr5 ( .capture_clk(TOP_inv_in), .update_clk(
        tck), .capture_en(TOP_INV_ABC_3), .update_en(TOP_INV_ABC_4), 
        .shift_dr(TOP_INV_ABC_5), .mode(SCANCH), .si(TOP_si_3), .data_in(
        TOP_data_in_3), .data_out(x_i_2_), .so(TOP_si_4) );
  TOP_DW_bc_2_test_4 TOP_X_I_3__bsr6 ( .capture_clk(TOP_inv_in), .update_clk(
        tck), .capture_en(TOP_INV_ABC_3), .update_en(TOP_INV_ABC_4), 
        .shift_dr(TOP_INV_ABC_5), .mode(SCANCH), .si(TOP_si_4), .data_in(
        TOP_data_in_4), .data_out(x_i_3_), .so(TOP_si_5) );
  TOP_DW_bc_2_test_5 TOP_Y_I_0__bsr7 ( .capture_clk(TOP_inv_in), .update_clk(
        tck), .capture_en(TOP_INV_ABC_3), .update_en(TOP_INV_ABC_4), 
        .shift_dr(TOP_INV_ABC_5), .mode(SCANCH), .si(TOP_si_5), .data_in(
        TOP_data_in_5), .data_out(y_i_0_), .so(TOP_si_6) );
  TOP_DW_bc_2_test_6 TOP_Y_I_1__bsr8 ( .capture_clk(TOP_inv_in), .update_clk(
        tck), .capture_en(TOP_INV_ABC_3), .update_en(TOP_INV_ABC_4), 
        .shift_dr(TOP_INV_ABC_5), .mode(SCANCH), .si(TOP_si_6), .data_in(
        TOP_data_in_6), .data_out(y_i_1_), .so(TOP_si_7) );
  TOP_DW_bc_2_test_7 TOP_Y_I_2__bsr9 ( .capture_clk(TOP_inv_in), .update_clk(
        tck), .capture_en(TOP_INV_ABC_3), .update_en(TOP_INV_ABC_4), 
        .shift_dr(TOP_INV_ABC_5), .mode(SCANCH), .si(TOP_si_7), .data_in(
        TOP_data_in_7), .data_out(y_i_2_), .so(TOP_si_8) );
  TOP_DW_bc_2_test_8 TOP_Y_I_3__bsr10 ( .capture_clk(TOP_inv_in), .update_clk(
        tck), .capture_en(TOP_INV_ABC_3), .update_en(TOP_INV_ABC_4), 
        .shift_dr(TOP_INV_ABC_5), .mode(SCANCH), .si(TOP_si_8), .data_in(
        TOP_data_in_8), .data_out(y_i_3_), .so(TOP_si_9) );
  TOP_DW_bc_1_test_0 TOP_D_O_0__bsr11 ( .capture_clk(TOP_inv_in), .update_clk(
        tck), .capture_en(TOP_INV_ABC_3), .update_en(TOP_INV_ABC_4), 
        .shift_dr(TOP_INV_ABC_5), .mode(TOP_INV_ABC_1), .si(TOP_si_9), 
        .data_in(d_o_0_), .data_out(TOP_data_out), .so(TOP_si_10) );
  TOP_DW_bc_1_test_1 TOP_D_O_1__bsr12 ( .capture_clk(TOP_inv_in), .update_clk(
        tck), .capture_en(TOP_INV_ABC_3), .update_en(TOP_INV_ABC_4), 
        .shift_dr(TOP_INV_ABC_5), .mode(TOP_INV_ABC_1), .si(TOP_si_10), 
        .data_in(d_o_1_), .data_out(TOP_data_out_1), .so(TOP_si_11) );
  TOP_DW_bc_1_test_2 TOP_D_O_2__bsr13 ( .capture_clk(TOP_inv_in), .update_clk(
        tck), .capture_en(TOP_INV_ABC_3), .update_en(TOP_INV_ABC_4), 
        .shift_dr(TOP_INV_ABC_5), .mode(TOP_INV_ABC_1), .si(TOP_si_11), 
        .data_in(d_o_2_), .data_out(TOP_data_out_2), .so(TOP_si_12) );
  TOP_DW_bc_1_test_3 TOP_D_O_3__bsr14 ( .capture_clk(TOP_inv_in), .update_clk(
        tck), .capture_en(TOP_INV_ABC_3), .update_en(TOP_INV_ABC_4), 
        .shift_dr(TOP_INV_ABC_5), .mode(TOP_INV_ABC_1), .si(TOP_si_12), 
        .data_in(d_o_3_), .data_out(TOP_data_out_3), .so(TOP_si_13) );
  TOP_DW_bc_2 TOP_TEST_SI_bsr15 ( .capture_clk(TOP_inv_in), .update_clk(tck), 
        .capture_en(TOP_INV_ABC_3), .update_en(TOP_INV_ABC_4), .shift_dr(
        TOP_INV_ABC_5), .mode(SCANCH), .si(TOP_si_13), .data_in(TOP_data_in_9), 
        .data_out(test_si_1), .so(TOP_si_14) );
  TOP_DW_bc_1 TOP_TEST_SO_bsr16 ( .capture_clk(TOP_inv_in), .update_clk(tck), 
        .capture_en(TOP_INV_ABC_3), .update_en(TOP_INV_ABC_4), .shift_dr(
        TOP_INV_ABC_5), .mode(TOP_INV_ABC_1), .si(TOP_si_14), .data_in(test_so), .data_out(TOP_data_out_4), .so(TOP_si_15) );
  TOP_BSR_mode_inst_design TOP_BSR_mode_inst ( .test_so(test_so), .test_si_1(
        test_si_1), .test_se(test_se), .tck(tck), .net674(net674), .net670(
        net670), .net665(net665), .net657(net657), .net614(net614), .net612(
        net612), .clk(clk), .TOP_tdo(TOP_tdo), .TOP_tdi(TOP_tdi), .TOP_si_15(
        TOP_si_15), .TOP_shift_dr(TOP_shift_dr), .TOP_inv_in(TOP_inv_in), 
        .TOP_instructions_3_(TOP_instructions_3_), .TOP_instructions_2_(
        TOP_instructions_2_), .TOP_instructions_1_(TOP_instructions_1_), 
        .TOP_instructions_0_(TOP_instructions_0_), .TOP_bypass_sel(
        TOP_bypass_sel), .TOP_INV_ABC_5(TOP_INV_ABC_5), .TOP_INV_ABC_4(
        TOP_INV_ABC_4), .TOP_INV_ABC_3(TOP_INV_ABC_3), .TOP_INV_ABC_1(
        TOP_INV_ABC_1), .SCANCH(SCANCH) );
endmodule


module TOP ( RST, CLK, GO_I, X_I, Y_I, D_O, TEST_SI, TEST_SO, TEST_SE, TCK, 
        TRSTN, TDI, TMS, TDO );
  input [3:0] X_I;
  input [3:0] Y_I;
  output [3:0] D_O;
  input RST, CLK, GO_I, TEST_SI, TEST_SE, TCK, TRSTN, TDI, TMS;
  output TEST_SO, TDO;
  wire   go_i, clk, rst, test_se, test_so, TOP_inv_in, TOP_tdi, TOP_tdo,
         TOP_tdo_en, TOP_tms, TOP_trst_n, TOP_instructions_0_,
         TOP_instructions_1_, TOP_instructions_2_, TOP_instructions_3_,
         TOP_bypass_sel, net612, net614, TOP_INV_ABC_5, TOP_data_in,
         TOP_data_in_1, TOP_data_in_2, TOP_data_in_3, TOP_data_in_4,
         TOP_data_in_5, TOP_data_in_6, TOP_data_in_7, TOP_data_in_8,
         TOP_data_out, TOP_data_out_1, TOP_data_out_2, TOP_data_out_3,
         TOP_data_in_9, TOP_data_out_4, TOP_si_15, net657, TOP_shift_dr,
         net670, net674, SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2,
         SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4,
         SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6,
         SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8,
         SYNOPSYS_UNCONNECTED_9, SYNOPSYS_UNCONNECTED_10,
         SYNOPSYS_UNCONNECTED_11, SYNOPSYS_UNCONNECTED_12,
         SYNOPSYS_UNCONNECTED_13, SYNOPSYS_UNCONNECTED_14,
         SYNOPSYS_UNCONNECTED_15, SYNOPSYS_UNCONNECTED_16;
  wire   [3:0] x_i;
  wire   [3:0] y_i;
  wire   [3:0] d_o;

  GTECH_INBUF U1 ( .PAD_IN(RST), .DATA_IN(rst) );
  GTECH_INBUF U2 ( .PAD_IN(CLK), .DATA_IN(clk) );
  GTECH_INBUF U3 ( .PAD_IN(GO_I), .DATA_IN(TOP_data_in) );
  GTECH_INBUF U4 ( .PAD_IN(X_I[0]), .DATA_IN(TOP_data_in_1) );
  GTECH_INBUF U5 ( .PAD_IN(X_I[1]), .DATA_IN(TOP_data_in_2) );
  GTECH_INBUF U6 ( .PAD_IN(X_I[2]), .DATA_IN(TOP_data_in_3) );
  GTECH_INBUF U7 ( .PAD_IN(X_I[3]), .DATA_IN(TOP_data_in_4) );
  GTECH_INBUF U8 ( .PAD_IN(Y_I[0]), .DATA_IN(TOP_data_in_5) );
  GTECH_INBUF U9 ( .PAD_IN(Y_I[1]), .DATA_IN(TOP_data_in_6) );
  GTECH_INBUF U10 ( .PAD_IN(Y_I[2]), .DATA_IN(TOP_data_in_7) );
  GTECH_INBUF U11 ( .PAD_IN(Y_I[3]), .DATA_IN(TOP_data_in_8) );
  GTECH_OUTBUF U12 ( .DATA_OUT(TOP_data_out), .OE(1'b1), .PAD_OUT(D_O[0]) );
  GTECH_OUTBUF U13 ( .DATA_OUT(TOP_data_out_1), .OE(1'b1), .PAD_OUT(D_O[1]) );
  GTECH_OUTBUF U14 ( .DATA_OUT(TOP_data_out_2), .OE(1'b1), .PAD_OUT(D_O[2]) );
  GTECH_OUTBUF U15 ( .DATA_OUT(TOP_data_out_3), .OE(1'b1), .PAD_OUT(D_O[3]) );
  GTECH_INBUF U16 ( .PAD_IN(TEST_SI), .DATA_IN(TOP_data_in_9) );
  GTECH_INBUF U17 ( .PAD_IN(TEST_SE), .DATA_IN(test_se) );
  GTECH_OUTBUF U18 ( .DATA_OUT(TOP_data_out_4), .OE(1'b1), .PAD_OUT(TEST_SO)
         );
  GTECH_INBUF U19 ( .PAD_IN(TCK), .DATA_IN(TOP_inv_in) );
  GTECH_INBUF U20 ( .PAD_IN(TRSTN), .DATA_IN(TOP_trst_n) );
  GTECH_INBUF U21 ( .PAD_IN(TDI), .DATA_IN(TOP_tdi) );
  GTECH_INBUF U22 ( .PAD_IN(TMS), .DATA_IN(TOP_tms) );
  GTECH_OUTBUF U23 ( .DATA_OUT(net674), .OE(TOP_tdo_en), .PAD_OUT(TDO) );
  gcd_bsd core ( .rst(rst), .clk(net657), .go_i(go_i), .x_i(x_i), .y_i(y_i), 
        .d_o(d_o), .test_si(net670), .test_so(test_so), .test_se(TOP_shift_dr)
         );
  TOP_DW_tap_uc_width4_id0_idcode_opcode1_version0_part0_man_num0_sync_mode1_tst_mode1 TOP_DW_tap_inst ( 
        .tck(TOP_inv_in), .trst_n(TOP_trst_n), .tms(TOP_tms), .tdi(TOP_tdi), 
        .so(TOP_si_15), .bypass_sel(TOP_bypass_sel), .sentinel_val({1'b0, 1'b0, 
        1'b0}), .device_id_sel(1'b0), .user_code_sel(1'b0), .user_code_val({
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .ver({1'b0, 1'b0, 
        1'b0, 1'b0}), .ver_sel(1'b0), .part_num({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .part_num_sel(1'b0), .mnfr_id({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .mnfr_id_sel(1'b0), .shift_dr(
        TOP_INV_ABC_5), .tdo(TOP_tdo), .tdo_en(TOP_tdo_en), .tap_state({
        SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3, 
        SYNOPSYS_UNCONNECTED_4, SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6, 
        SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8, SYNOPSYS_UNCONNECTED_9, 
        SYNOPSYS_UNCONNECTED_10, SYNOPSYS_UNCONNECTED_11, 
        SYNOPSYS_UNCONNECTED_12, SYNOPSYS_UNCONNECTED_13, 
        SYNOPSYS_UNCONNECTED_14, SYNOPSYS_UNCONNECTED_15, 
        SYNOPSYS_UNCONNECTED_16}), .instructions({TOP_instructions_3_, 
        TOP_instructions_2_, TOP_instructions_1_, TOP_instructions_0_}), 
        .sync_capture_en(net612), .sync_update_dr(net614), .test(1'b0) );
  TOP_BSR_top_inst_design TOP_BSR_top_inst ( .y_i_3_(y_i[3]), .y_i_2_(y_i[2]), 
        .y_i_1_(y_i[1]), .y_i_0_(y_i[0]), .x_i_3_(x_i[3]), .x_i_2_(x_i[2]), 
        .x_i_1_(x_i[1]), .x_i_0_(x_i[0]), .test_so(test_so), .test_se(test_se), 
        .net674(net674), .net670(net670), .net657(net657), .net614(net614), 
        .net612(net612), .go_i(go_i), .d_o_3_(d_o[3]), .d_o_2_(d_o[2]), 
        .d_o_1_(d_o[1]), .d_o_0_(d_o[0]), .clk(clk), .TOP_tdo(TOP_tdo), 
        .TOP_tdi(TOP_tdi), .TOP_si_15(TOP_si_15), .TOP_shift_dr(TOP_shift_dr), 
        .TOP_inv_in(TOP_inv_in), .TOP_instructions_3_(TOP_instructions_3_), 
        .TOP_instructions_2_(TOP_instructions_2_), .TOP_instructions_1_(
        TOP_instructions_1_), .TOP_instructions_0_(TOP_instructions_0_), 
        .TOP_data_out_4(TOP_data_out_4), .TOP_data_out_3(TOP_data_out_3), 
        .TOP_data_out_2(TOP_data_out_2), .TOP_data_out_1(TOP_data_out_1), 
        .TOP_data_out(TOP_data_out), .TOP_data_in_9(TOP_data_in_9), 
        .TOP_data_in_8(TOP_data_in_8), .TOP_data_in_7(TOP_data_in_7), 
        .TOP_data_in_6(TOP_data_in_6), .TOP_data_in_5(TOP_data_in_5), 
        .TOP_data_in_4(TOP_data_in_4), .TOP_data_in_3(TOP_data_in_3), 
        .TOP_data_in_2(TOP_data_in_2), .TOP_data_in_1(TOP_data_in_1), 
        .TOP_data_in(TOP_data_in), .TOP_bypass_sel(TOP_bypass_sel), 
        .TOP_INV_ABC_5(TOP_INV_ABC_5) );
endmodule


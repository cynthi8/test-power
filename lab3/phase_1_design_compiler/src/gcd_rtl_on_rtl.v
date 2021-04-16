/////////////////////////////////////////////////////////////
// Created by: Synopsys Design Compiler(R)
// Version   : O-2018.06-SP1
// Date      : Thu Apr 15 23:19:56 2021
/////////////////////////////////////////////////////////////


module fsm ( rst, clk, proceed, comparison, enable, xsel, ysel, xld, yld );
  input [1:0] comparison;
  input rst, clk, proceed;
  output enable, xsel, ysel, xld, yld;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29,
         N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43,
         N44, N45, N46, N47, N48, N49;
  wire   [2:0] cState;
  wire   [2:0] nState;

  \**SEQGEN**  cState_reg_2_ ( .clear(rst), .preset(1'b0), .next_state(
        nState[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        cState[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  cState_reg_1_ ( .clear(rst), .preset(1'b0), .next_state(
        nState[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        cState[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  cState_reg_0_ ( .clear(rst), .preset(1'b0), .next_state(
        nState[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        cState[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  GTECH_AND2 C19 ( .A(N12), .B(N13), .Z(N15) );
  GTECH_AND2 C20 ( .A(N15), .B(N14), .Z(N16) );
  GTECH_OR2 C22 ( .A(cState[2]), .B(cState[1]), .Z(N17) );
  GTECH_OR2 C23 ( .A(N17), .B(N14), .Z(N18) );
  GTECH_OR2 C26 ( .A(cState[2]), .B(N13), .Z(N20) );
  GTECH_OR2 C27 ( .A(N20), .B(cState[0]), .Z(N21) );
  GTECH_OR2 C31 ( .A(cState[2]), .B(N13), .Z(N23) );
  GTECH_OR2 C32 ( .A(N23), .B(N14), .Z(N24) );
  GTECH_OR2 C35 ( .A(N12), .B(cState[1]), .Z(N26) );
  GTECH_OR2 C36 ( .A(N26), .B(cState[0]), .Z(N27) );
  GTECH_OR2 C40 ( .A(N12), .B(cState[1]), .Z(N29) );
  GTECH_OR2 C41 ( .A(N29), .B(N14), .Z(N30) );
  GTECH_OR2 C45 ( .A(N12), .B(N13), .Z(N32) );
  GTECH_OR2 C46 ( .A(N32), .B(cState[0]), .Z(N33) );
  GTECH_AND2 C48 ( .A(cState[2]), .B(cState[1]), .Z(N35) );
  GTECH_AND2 C49 ( .A(N35), .B(cState[0]), .Z(N36) );
  GTECH_NOT I_0 ( .A(comparison[1]), .Z(N37) );
  GTECH_OR2 C69 ( .A(comparison[0]), .B(N37), .Z(N38) );
  GTECH_NOT I_1 ( .A(N38), .Z(N39) );
  GTECH_NOT I_2 ( .A(comparison[0]), .Z(N40) );
  GTECH_OR2 C77 ( .A(N40), .B(comparison[1]), .Z(N41) );
  GTECH_NOT I_3 ( .A(N41), .Z(N42) );
  GTECH_AND2 C84 ( .A(comparison[0]), .B(comparison[1]), .Z(N43) );
  GTECH_NOT I_4 ( .A(N43), .Z(N44) );
  SELECT_OP C114 ( .DATA1({1'b1, 1'b1}), .DATA2({N43, N44}), .CONTROL1(N0), 
        .CONTROL2(N1), .Z({N46, N45}) );
  GTECH_BUF B_0 ( .A(N42), .Z(N0) );
  GTECH_BUF B_1 ( .A(N41), .Z(N1) );
  SELECT_OP C115 ( .DATA1({1'b1, 1'b0, 1'b0}), .DATA2({N46, N41, N45}), 
        .CONTROL1(N2), .CONTROL2(N3), .Z({N49, N48, N47}) );
  GTECH_BUF B_2 ( .A(N39), .Z(N2) );
  GTECH_BUF B_3 ( .A(N38), .Z(N3) );
  SELECT_OP C116 ( .DATA1({1'b0, 1'b0, proceed}), .DATA2({1'b0, 1'b1, 1'b0}), 
        .DATA3({1'b0, 1'b1, 1'b1}), .DATA4({N49, N48, N47}), .DATA5({1'b0, 
        1'b1, 1'b1}), .DATA6({1'b0, 1'b1, 1'b1}), .DATA7({1'b0, 1'b0, 1'b1}), 
        .DATA8({1'b0, 1'b0, 1'b1}), .CONTROL1(N4), .CONTROL2(N5), .CONTROL3(N6), .CONTROL4(N7), .CONTROL5(N8), .CONTROL6(N9), .CONTROL7(N10), .CONTROL8(N11), 
        .Z(nState) );
  GTECH_BUF B_4 ( .A(N16), .Z(N4) );
  GTECH_BUF B_5 ( .A(N19), .Z(N5) );
  GTECH_BUF B_6 ( .A(N22), .Z(N6) );
  GTECH_BUF B_7 ( .A(N25), .Z(N7) );
  GTECH_BUF B_8 ( .A(N28), .Z(N8) );
  GTECH_BUF B_9 ( .A(N31), .Z(N9) );
  GTECH_BUF B_10 ( .A(N34), .Z(N10) );
  GTECH_BUF B_11 ( .A(N36), .Z(N11) );
  SELECT_OP C117 ( .DATA1(1'b0), .DATA2(1'b0), .DATA3(1'b0), .DATA4(1'b0), 
        .DATA5(1'b0), .DATA6(1'b0), .DATA7(1'b1), .DATA8(1'b0), .CONTROL1(N4), 
        .CONTROL2(N5), .CONTROL3(N6), .CONTROL4(N7), .CONTROL5(N8), .CONTROL6(
        N9), .CONTROL7(N10), .CONTROL8(N11), .Z(enable) );
  SELECT_OP C118 ( .DATA1(1'b0), .DATA2(1'b0), .DATA3(1'b0), .DATA4(1'b0), 
        .DATA5(1'b1), .DATA6(1'b0), .DATA7(1'b1), .DATA8(1'b0), .CONTROL1(N4), 
        .CONTROL2(N5), .CONTROL3(N6), .CONTROL4(N7), .CONTROL5(N8), .CONTROL6(
        N9), .CONTROL7(N10), .CONTROL8(N11), .Z(xsel) );
  SELECT_OP C119 ( .DATA1(1'b0), .DATA2(1'b0), .DATA3(1'b0), .DATA4(1'b0), 
        .DATA5(1'b0), .DATA6(1'b1), .DATA7(1'b1), .DATA8(1'b0), .CONTROL1(N4), 
        .CONTROL2(N5), .CONTROL3(N6), .CONTROL4(N7), .CONTROL5(N8), .CONTROL6(
        N9), .CONTROL7(N10), .CONTROL8(N11), .Z(ysel) );
  SELECT_OP C120 ( .DATA1(1'b0), .DATA2(1'b0), .DATA3(1'b1), .DATA4(1'b0), 
        .DATA5(1'b1), .DATA6(1'b0), .DATA7(1'b1), .DATA8(1'b0), .CONTROL1(N4), 
        .CONTROL2(N5), .CONTROL3(N6), .CONTROL4(N7), .CONTROL5(N8), .CONTROL6(
        N9), .CONTROL7(N10), .CONTROL8(N11), .Z(xld) );
  SELECT_OP C121 ( .DATA1(1'b0), .DATA2(1'b0), .DATA3(1'b1), .DATA4(1'b0), 
        .DATA5(1'b0), .DATA6(1'b1), .DATA7(1'b1), .DATA8(1'b0), .CONTROL1(N4), 
        .CONTROL2(N5), .CONTROL3(N6), .CONTROL4(N7), .CONTROL5(N8), .CONTROL6(
        N9), .CONTROL7(N10), .CONTROL8(N11), .Z(yld) );
  GTECH_NOT I_5 ( .A(cState[2]), .Z(N12) );
  GTECH_NOT I_6 ( .A(cState[1]), .Z(N13) );
  GTECH_NOT I_7 ( .A(cState[0]), .Z(N14) );
  GTECH_NOT I_8 ( .A(N18), .Z(N19) );
  GTECH_NOT I_9 ( .A(N21), .Z(N22) );
  GTECH_NOT I_10 ( .A(N24), .Z(N25) );
  GTECH_NOT I_11 ( .A(N27), .Z(N28) );
  GTECH_NOT I_12 ( .A(N30), .Z(N31) );
  GTECH_NOT I_13 ( .A(N33), .Z(N34) );
endmodule


module mux_1 ( rst, sLine, load, result, output0 );
  input [3:0] load;
  input [3:0] result;
  output [3:0] output0;
  input rst, sLine;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9;

  GTECH_NOT I_0 ( .A(sLine), .Z(N9) );
  SELECT_OP C25 ( .DATA1(load), .DATA2(result), .CONTROL1(N0), .CONTROL2(N1), 
        .Z({N8, N7, N6, N5}) );
  GTECH_BUF B_0 ( .A(N9), .Z(N0) );
  GTECH_BUF B_1 ( .A(sLine), .Z(N1) );
  SELECT_OP C26 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0}), .DATA2({N8, N7, N6, N5}), 
        .CONTROL1(N2), .CONTROL2(N3), .Z(output0) );
  GTECH_BUF B_2 ( .A(rst), .Z(N2) );
  GTECH_BUF B_3 ( .A(N4), .Z(N3) );
  GTECH_NOT I_1 ( .A(rst), .Z(N4) );
endmodule


module regis_2 ( rst, clk, load, input0, output0 );
  input [3:0] input0;
  output [3:0] output0;
  input rst, clk, load;


  \**SEQGEN**  output_reg_3_ ( .clear(rst), .preset(1'b0), .next_state(
        input0[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        output0[3]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load) );
  \**SEQGEN**  output_reg_2_ ( .clear(rst), .preset(1'b0), .next_state(
        input0[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        output0[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load) );
  \**SEQGEN**  output_reg_1_ ( .clear(rst), .preset(1'b0), .next_state(
        input0[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        output0[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load) );
  \**SEQGEN**  output_reg_0_ ( .clear(rst), .preset(1'b0), .next_state(
        input0[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        output0[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load) );
endmodule


module comparator ( rst, x, y, output0 );
  input [3:0] x;
  input [3:0] y;
  output [1:0] output0;
  input rst;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, net2400;

  LT_UNS_OP lt_gt_54 ( .A(y), .B(x), .Z(N5) );
  LT_UNS_OP lt_56 ( .A(x), .B(y), .Z(N7) );
  GTECH_NOT I_0 ( .A(N7), .Z(N8) );
  GTECH_NOT I_1 ( .A(N5), .Z(N9) );
  SELECT_OP C28 ( .DATA1(1'b1), .DATA2(N8), .CONTROL1(N0), .CONTROL2(N6), .Z(
        N10) );
  GTECH_BUF B_0 ( .A(N5), .Z(N0) );
  SELECT_OP C29 ( .DATA1({1'b0, 1'b0}), .DATA2({N10, N9}), .CONTROL1(N1), 
        .CONTROL2(N2), .Z(output0) );
  GTECH_BUF B_1 ( .A(rst), .Z(N1) );
  GTECH_BUF B_2 ( .A(N3), .Z(N2) );
  GTECH_NOT I_2 ( .A(rst), .Z(N3) );
  GTECH_BUF B_3 ( .A(N3), .Z(N4) );
  GTECH_NOT I_3 ( .A(N5), .Z(N6) );
  GTECH_AND2 C38 ( .A(N4), .B(N6), .Z(net2400) );
endmodule


module subtractor ( rst, cmd, x, y, xout, yout );
  input [1:0] cmd;
  input [3:0] x;
  input [3:0] y;
  output [3:0] xout;
  output [3:0] yout;
  input rst;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29,
         N30, N31, N32, N33, N34, N35, N36, net2428, net2429;

  GTECH_OR2 C5 ( .A(cmd[0]), .B(cmd[1]), .Z(N5) );
  GTECH_NOT I_0 ( .A(N5), .Z(N6) );
  GTECH_NOT I_1 ( .A(cmd[1]), .Z(N10) );
  GTECH_OR2 C14 ( .A(cmd[0]), .B(N10), .Z(N11) );
  GTECH_NOT I_2 ( .A(N11), .Z(N12) );
  GTECH_NOT I_3 ( .A(cmd[0]), .Z(N18) );
  GTECH_OR2 C22 ( .A(N18), .B(cmd[1]), .Z(N19) );
  GTECH_NOT I_4 ( .A(N19), .Z(N20) );
  SUB_UNS_OP sub_87 ( .A(x), .B(y), .Z({N16, N15, N14, N13}) );
  SUB_UNS_OP sub_91 ( .A(y), .B(x), .Z({N24, N23, N22, N21}) );
  SELECT_OP C50 ( .DATA1({N24, N23, N22, N21}), .DATA2(y), .CONTROL1(N0), 
        .CONTROL2(N1), .Z({N28, N27, N26, N25}) );
  GTECH_BUF B_0 ( .A(N20), .Z(N0) );
  GTECH_BUF B_1 ( .A(N19), .Z(N1) );
  SELECT_OP C51 ( .DATA1({N16, N15, N14, N13}), .DATA2(x), .CONTROL1(N2), 
        .CONTROL2(N3), .Z({N32, N31, N30, N29}) );
  GTECH_BUF B_2 ( .A(N12), .Z(N2) );
  GTECH_BUF B_3 ( .A(N11), .Z(N3) );
  SELECT_OP C52 ( .DATA1(y), .DATA2({N28, N27, N26, N25}), .CONTROL1(N2), 
        .CONTROL2(N3), .Z({N36, N35, N34, N33}) );
  SELECT_OP C53 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0}), .DATA2({N32, N31, N30, N29}), .CONTROL1(N4), .CONTROL2(N8), .Z(xout) );
  GTECH_BUF B_4 ( .A(N7), .Z(N4) );
  SELECT_OP C54 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0}), .DATA2({N36, N35, N34, N33}), .CONTROL1(N4), .CONTROL2(N8), .Z(yout) );
  GTECH_OR2 C57 ( .A(rst), .B(N6), .Z(N7) );
  GTECH_NOT I_5 ( .A(N7), .Z(N8) );
  GTECH_BUF B_5 ( .A(N8), .Z(N9) );
  GTECH_AND2 C63 ( .A(N9), .B(N12), .Z(net2428) );
  GTECH_AND2 C64 ( .A(N9), .B(N11), .Z(N17) );
  GTECH_AND2 C67 ( .A(N17), .B(N20), .Z(net2429) );
endmodule


module mux_0 ( rst, sLine, load, result, output0 );
  input [3:0] load;
  input [3:0] result;
  output [3:0] output0;
  input rst, sLine;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9;

  GTECH_NOT I_0 ( .A(sLine), .Z(N9) );
  SELECT_OP C25 ( .DATA1(load), .DATA2(result), .CONTROL1(N0), .CONTROL2(N1), 
        .Z({N8, N7, N6, N5}) );
  GTECH_BUF B_0 ( .A(N9), .Z(N0) );
  GTECH_BUF B_1 ( .A(sLine), .Z(N1) );
  SELECT_OP C26 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0}), .DATA2({N8, N7, N6, N5}), 
        .CONTROL1(N2), .CONTROL2(N3), .Z(output0) );
  GTECH_BUF B_2 ( .A(rst), .Z(N2) );
  GTECH_BUF B_3 ( .A(N4), .Z(N3) );
  GTECH_NOT I_1 ( .A(rst), .Z(N4) );
endmodule


module regis_0 ( rst, clk, load, input0, output0 );
  input [3:0] input0;
  output [3:0] output0;
  input rst, clk, load;


  \**SEQGEN**  output_reg_3_ ( .clear(rst), .preset(1'b0), .next_state(
        input0[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        output0[3]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load) );
  \**SEQGEN**  output_reg_2_ ( .clear(rst), .preset(1'b0), .next_state(
        input0[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        output0[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load) );
  \**SEQGEN**  output_reg_1_ ( .clear(rst), .preset(1'b0), .next_state(
        input0[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        output0[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load) );
  \**SEQGEN**  output_reg_0_ ( .clear(rst), .preset(1'b0), .next_state(
        input0[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        output0[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load) );
endmodule


module regis_1 ( rst, clk, load, input0, output0 );
  input [3:0] input0;
  output [3:0] output0;
  input rst, clk, load;


  \**SEQGEN**  output_reg_3_ ( .clear(rst), .preset(1'b0), .next_state(
        input0[3]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        output0[3]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load) );
  \**SEQGEN**  output_reg_2_ ( .clear(rst), .preset(1'b0), .next_state(
        input0[2]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        output0[2]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load) );
  \**SEQGEN**  output_reg_1_ ( .clear(rst), .preset(1'b0), .next_state(
        input0[1]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        output0[1]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load) );
  \**SEQGEN**  output_reg_0_ ( .clear(rst), .preset(1'b0), .next_state(
        input0[0]), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        output0[0]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(load) );
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


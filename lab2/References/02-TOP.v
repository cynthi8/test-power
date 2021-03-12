module TOP (RST,CLK,GO_I,X_I,Y_I,D_O,TEST_SI,TEST_SO,TEST_SE,TCK,TRSTN,TDI,TMS,TDO);
input RST, CLK, GO_I;
input [3:0] X_I;
input [3:0] Y_I;
output [3:0] D_O;
input TEST_SI, TEST_SE;

output TEST_SO;
//boundary scan ports
input TCK, TRSTN, TDI,  TMS;
output TDO;
wire [3:0] x_i;
wire [3:0] y_i;
wire [3:0] d_o;
wire go_i, clk, rst, test_si, test_se;
wire cout, test_so;
wire enable;

assign enable=1'b1;

// begin normal pads

GTECH_INBUF U1 ( .PAD_IN(RST), .DATA_IN(rst) );
GTECH_INBUF U2 ( .PAD_IN(CLK), .DATA_IN(clk) );
GTECH_INBUF U3 ( .PAD_IN(GO_I), .DATA_IN(go_i) );

GTECH_INBUF U4 ( .PAD_IN(X_I[0]), .DATA_IN(x_i[0]) );
GTECH_INBUF U5 ( .PAD_IN(X_I[1]), .DATA_IN(x_i[1]) );
GTECH_INBUF U6 ( .PAD_IN(X_I[2]), .DATA_IN(x_i[2]) );
GTECH_INBUF U7 ( .PAD_IN(X_I[3]), .DATA_IN(x_i[3]) );
GTECH_INBUF U8 ( .PAD_IN(Y_I[0]), .DATA_IN(y_i[0]) );
GTECH_INBUF U9 ( .PAD_IN(Y_I[1]), .DATA_IN(y_i[1]) );
GTECH_INBUF U10 ( .PAD_IN(Y_I[2]), .DATA_IN(y_i[2]) );
GTECH_INBUF U11 ( .PAD_IN(Y_I[3]), .DATA_IN(y_i[3]) );

GTECH_OUTBUF U12 ( .DATA_OUT(d_o[0]), .OE(enable), .PAD_OUT(D_O[0]) );
GTECH_OUTBUF U13 ( .DATA_OUT(d_o[1]), .OE(enable), .PAD_OUT(D_O[1]) );
GTECH_OUTBUF U14 ( .DATA_OUT(d_o[2]), .OE(enable), .PAD_OUT(D_O[2]) );
GTECH_OUTBUF U15 ( .DATA_OUT(d_o[3]), .OE(enable), .PAD_OUT(D_O[3]) );

GTECH_INBUF U16 ( .PAD_IN(TEST_SI), .DATA_IN(test_si) );
GTECH_INBUF U17 ( .PAD_IN(TEST_SE), .DATA_IN(test_se) );
GTECH_OUTBUF U18 ( .DATA_OUT(test_so), .OE(enable), .PAD_OUT(TEST_SO) );

// boundary scan pads
GTECH_INBUF U19 ( .PAD_IN(TCK) );
GTECH_INBUF U20 ( .PAD_IN(TRSTN) );
GTECH_INBUF U21 ( .PAD_IN(TDI) );
GTECH_INBUF U22 ( .PAD_IN(TMS) );
GTECH_OUTBUF U23 ( .OE(enable), .PAD_OUT(TDO) );

gcd_bsd core ( .rst(rst), 
.clk(clk),
.go_i(go_i), 
.x_i(x_i), 
.y_i(y_i), 
.d_o(d_o), 
.test_si(test_si),
.test_so(test_so),
.test_se(test_se));

endmodule

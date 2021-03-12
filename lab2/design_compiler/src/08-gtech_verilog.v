module GTECH_INBUF (PAD_IN,DATA_IN);
input PAD_IN;
output DATA_IN;

assign DATA_IN = PAD_IN;

endmodule

module GTECH_OUTBUF (PAD_OUT,DATA_OUT,OE);
input OE;
input DATA_OUT;
output PAD_OUT;

assign DATA_OUT = OE ? PAD_OUT: 0;

endmodule

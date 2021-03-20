///////////////////////////////////////////////////////////////////////////////
//
//        This confidential and proprietary software may be used only
//     as authorized by a licensing agreement from Synopsys Inc.
//     In the event of publication, the following notice is applicable:
//
//                    (C) COPYRIGHT 1994-2002 SYNOPSYS, INC.
//                              ALL RIGHTS RESERVED
//
//        The entire notice above must be reproduced on all authorized
//       copies.
//
// ABSTRACT: The GTECH library Verilog Simulation Model
//
// DesignWare_version : aafb9485
// DesignWare_release : O-2018.06-DWBB_201806.1
//
///////////////////////////////////////////////////////////////////////////////

`ifdef GTECH_default_delay
`else
`define GTECH_default_delay 1
`endif

`timescale 1 ns / 10 ps
//
// Verilog Simulation model for GTECH_OUTBUF
//

module GTECH_OUTBUF(DATA_OUT,OE,PAD_OUT);
parameter integer delay = `GTECH_default_delay;
input	DATA_OUT,OE;
output	PAD_OUT;
assign	#(delay) PAD_OUT = OE? (DATA_OUT & 1'b1) : 1'bz;
endmodule

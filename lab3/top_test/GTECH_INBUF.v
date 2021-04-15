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
// DesignWare_version : a40d3090
// DesignWare_release : O-2018.06-DWBB_201806.1
//
///////////////////////////////////////////////////////////////////////////////

`ifdef GTECH_default_delay
`else
`define GTECH_default_delay 1
`endif

`timescale 1 ns / 10 ps
//
// Verilog Simulation model for GTECH_INBUF
//

module GTECH_INBUF(PAD_IN,DATA_IN);
parameter integer delay = `GTECH_default_delay;
output	DATA_IN;
input	PAD_IN;
assign  #(delay) DATA_IN = PAD_IN & 1'b1;
endmodule

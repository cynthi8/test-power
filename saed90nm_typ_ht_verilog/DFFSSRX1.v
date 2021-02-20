`timescale 1ns/1ps
`celldefine
module DFFSSRX1 (CLK, D, RSTB, SETB, Q, QN);
input CLK;
input D;
input RSTB;
input SETB;
output Q;
output QN;
reg notifier;

UDP_DFFSSRX1_Q U0 (Q, CLK, RSTB, D, SETB, notifier);
not U1 (QN, Q);

specify
specparam
tdelay_CLK_Q_01_0=0.01,
tdelay_CLK_Q_10_0=0.01,
tdelay_CLK_QN_01_0=0.01,
tdelay_CLK_QN_10_0=0.01,
tsetup_D_CLK_0=0.01,
tsetup_D_CLK_1=0.01,
thold_CLK_D_0=0.01,
thold_CLK_D_1=0.01,
tsetup_RSTB_CLK_0=0.01,
tsetup_RSTB_CLK_1=0.01,
thold_CLK_RSTB_0=0.01,
thold_CLK_RSTB_1=0.01,
tsetup_SETB_CLK_0=0.01,
tsetup_SETB_CLK_1=0.01,
thold_CLK_SETB_0=0.01,
thold_CLK_SETB_1=0.01,
tpulsewidth_CLK_0=0.01,
tpulsewidth_CLK_1=0.01;

(posedge CLK => (Q : 1'b1))=(tdelay_CLK_Q_01_0, tdelay_CLK_Q_10_0);
(posedge CLK => (QN : 1'b1))=(tdelay_CLK_QN_01_0, tdelay_CLK_QN_10_0);
$setup(posedge D , posedge CLK , tsetup_D_CLK_0 , notifier);
$setup(negedge D , posedge CLK , tsetup_D_CLK_1 , notifier);
$hold(posedge CLK , posedge D , thold_CLK_D_0 , notifier);
$hold(posedge CLK , negedge D , thold_CLK_D_1 , notifier);
$setup(posedge RSTB , posedge CLK , tsetup_RSTB_CLK_0 , notifier);
$setup(negedge RSTB , posedge CLK , tsetup_RSTB_CLK_1 , notifier);
$hold(posedge CLK , posedge RSTB , thold_CLK_RSTB_0 , notifier);
$hold(posedge CLK , negedge RSTB , thold_CLK_RSTB_1 , notifier);
$setup(posedge SETB , posedge CLK , tsetup_SETB_CLK_0 , notifier);
$setup(negedge SETB , posedge CLK , tsetup_SETB_CLK_1 , notifier);
$hold(posedge CLK , posedge SETB , thold_CLK_SETB_0 , notifier);
$hold(posedge CLK , negedge SETB , thold_CLK_SETB_1 , notifier);
$width(posedge CLK , tpulsewidth_CLK_0 ,0, notifier);
$width(negedge CLK , tpulsewidth_CLK_1 ,0, notifier);
endspecify
endmodule
`endcelldefine
primitive UDP_DFFSSRX1_Q (q, in1, in2, in3, in4, notifier);
output q;
reg q;
input in1, in2, in3, in4, notifier;
table
//	CLK	RSTB	D	SETB	notifier	: Q 	: Q+1 ;
	(01)	0	?	1	?		: ? 	: 0 ;
	(01)	1	1	?	?		: ? 	: 1 ;
	(01)	?	0	1	?		: ? 	: 0 ;
	(01)	?	?	0	?		: ? 	: 1 ;
	(1?)	?	?	?	?		: ? 	: - ;
	(?0)	?	?	?	?		: ? 	: - ;
	(x1)	0	?	1	?		: 0 	: 0 ;	//pessimism reduction
	(0x)	0	?	1	?		: 0 	: 0 ;	//pessimism reduction
	(x1)	1	1	?	?		: 1 	: 1 ;	//pessimism reduction
	(0x)	1	1	?	?		: 1 	: 1 ;	//pessimism reduction
	(x1)	?	0	1	?		: 0 	: 0 ;	//pessimism reduction
	(0x)	?	0	1	?		: 0 	: 0 ;	//pessimism reduction
	(x1)	?	?	0	?		: 1 	: 1 ;	//pessimism reduction
	(0x)	?	?	0	?		: 1 	: 1 ;	//pessimism reduction
	?	*	?	?	?		: ? 	: - ;
	?	?	*	?	?		: ? 	: - ;
	?	?	?	*	?		: ? 	: - ;
	?	?	?	?	*		: ? 	: x ;
endtable
endprimitive


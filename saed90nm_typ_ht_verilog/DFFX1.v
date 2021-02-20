`timescale 1ns/1ps
`celldefine
module DFFX1 (D, CLK, Q, QN);
input D;
input CLK;
output Q;
output QN;
reg notifier;

UDP_DFFX1_Q U0 (Q, CLK, D, notifier);
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
tpulsewidth_CLK_0=0.01,
tpulsewidth_CLK_1=0.01;

(posedge CLK => (Q : 1'b1))=(tdelay_CLK_Q_01_0, tdelay_CLK_Q_10_0);
(posedge CLK => (QN : 1'b1))=(tdelay_CLK_QN_01_0, tdelay_CLK_QN_10_0);
$setup(posedge D , posedge CLK , tsetup_D_CLK_0 , notifier);
$setup(negedge D , posedge CLK , tsetup_D_CLK_1 , notifier);
$hold(posedge CLK , posedge D , thold_CLK_D_0 , notifier);
$hold(posedge CLK , negedge D , thold_CLK_D_1 , notifier);
$width(posedge CLK , tpulsewidth_CLK_0 ,0, notifier);
$width(negedge CLK , tpulsewidth_CLK_1 ,0, notifier);
endspecify
endmodule
`endcelldefine
primitive UDP_DFFX1_Q (q, in1, in2, notifier);
output q;
reg q;
input in1, in2, notifier;
table
//	CLK	D	notifier	: Q 	: Q+1 ;
	(01)	0	?		: ? 	: 0 ;
	(01)	1	?		: ? 	: 1 ;
	(1?)	?	?		: ? 	: - ;
	(?0)	?	?		: ? 	: - ;
	(x1)	0	?		: 0 	: 0 ;	//pessimism reduction
	(0x)	0	?		: 0 	: 0 ;	//pessimism reduction
	(x1)	1	?		: 1 	: 1 ;	//pessimism reduction
	(0x)	1	?		: 1 	: 1 ;	//pessimism reduction
	?	*	?		: ? 	: - ;
	?	?	*		: ? 	: x ;
endtable
endprimitive


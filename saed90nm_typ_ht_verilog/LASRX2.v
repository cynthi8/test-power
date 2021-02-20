`timescale 1ns/1ps
`celldefine
module LASRX2 (D, CLK, SETB, RSTB, Q, QN);
input D;
input CLK;
input SETB;
input RSTB;
output Q;
output QN;
reg notifier;

UDP_LASRX2_Q U0 (Q, RSTB, D, SETB, CLK, notifier);
UDP_LASRX2_QN U1 (QN, SETB, RSTB, D, CLK, notifier);

specify
specparam
tdelay_D_Q_01_0=0.01,
tdelay_D_Q_10_0=0.01,
tdelay_CLK_Q_01_0=0.01,
tdelay_CLK_Q_10_0=0.01,
tdelay_SETB_Q_01_0=0.01,
tdelay_SETB_Q_10_0=0.01,
tdelay_RSTB_Q_01_0=0.01,
tdelay_RSTB_Q_10_0=0.01,
tdelay_D_QN_01_0=0.01,
tdelay_D_QN_10_0=0.01,
tdelay_CLK_QN_01_0=0.01,
tdelay_CLK_QN_10_0=0.01,
tdelay_SETB_QN_01_0=0.01,
tdelay_SETB_QN_10_0=0.01,
tdelay_RSTB_QN_01_0=0.01,
tdelay_RSTB_QN_10_0=0.01,
tsetup_D_CLK_0=0.01,
tsetup_D_CLK_1=0.01,
thold_CLK_D_0=0.01,
thold_CLK_D_1=0.01,
trecovery_SETB_CLK_0=0.01,
tremoval_CLK_SETB_0=0.01,
trecovery_RSTB_CLK_0=0.01,
tremoval_CLK_RSTB_0=0.01,
tpulsewidth_CLK_0=0.01,
tpulsewidth_SETB_0=0.01,
tpulsewidth_RSTB_0=0.01;

(D +=> Q)=(tdelay_D_Q_01_0, tdelay_D_Q_10_0);
(posedge CLK => (Q : 1'b1))=(tdelay_CLK_Q_01_0, tdelay_CLK_Q_10_0);
(negedge SETB => (Q -: 1'b1))=(tdelay_SETB_Q_01_0, tdelay_SETB_Q_10_0);
(negedge RSTB => (Q +: 1'b0))=(tdelay_RSTB_Q_01_0, tdelay_RSTB_Q_10_0);
(D -=> QN)=(tdelay_D_QN_01_0, tdelay_D_QN_10_0);
(posedge CLK => (QN : 1'b1))=(tdelay_CLK_QN_01_0, tdelay_CLK_QN_10_0);
(negedge SETB => (QN +: 1'b0))=(tdelay_SETB_QN_01_0, tdelay_SETB_QN_10_0);
(negedge RSTB => (QN -: 1'b1))=(tdelay_RSTB_QN_01_0, tdelay_RSTB_QN_10_0);
$setup(posedge D , negedge CLK , tsetup_D_CLK_0 , notifier);
$setup(negedge D , negedge CLK , tsetup_D_CLK_1 , notifier);
$hold(negedge CLK , posedge D , thold_CLK_D_0 , notifier);
$hold(negedge CLK , negedge D , thold_CLK_D_1 , notifier);
$recovery(posedge SETB , negedge CLK , trecovery_SETB_CLK_0 , notifier);
$hold(negedge CLK , posedge SETB , tremoval_CLK_SETB_0 , notifier);
$recovery(posedge RSTB , negedge CLK , trecovery_RSTB_CLK_0 , notifier);
$hold(negedge CLK , posedge RSTB , tremoval_CLK_RSTB_0 , notifier);
$width(posedge CLK , tpulsewidth_CLK_0 ,0, notifier);
$width(negedge SETB , tpulsewidth_SETB_0 ,0, notifier);
$width(negedge RSTB , tpulsewidth_RSTB_0 ,0, notifier);
endspecify
endmodule
`endcelldefine
primitive UDP_LASRX2_Q (q, in1, in2, in3, in4, notifier);
output q;
reg q;
input in1, in2, in3, in4, notifier;
table
//	RSTB	D	SETB	CLK	notifier	: Q 	: Q+1 ;
	0	?	?	?	?		: ? 	: 0 ;
	1	1	?	1	?		: ? 	: 1 ;
	1	?	0	?	?		: ? 	: 1 ;
	1	?	1	0	?		: ? 	: - ;
	?	0	1	1	?		: ? 	: 0 ;
	x	?	1	0	?		: 0 	: 0 ;	//pessimism reduction
	1	?	x	0	?		: 1 	: 1 ;	//pessimism reduction
	1	1	1	x	?		: 1 	: 1 ;	//pessimism reduction
	1	0	1	x	?		: 0 	: 0 ;	//pessimism reduction
	x	0	1	x	?		: 0 	: 0 ;	//pessimism reduction
	1	1	x	x	?		: 1 	: 1 ;	//pessimism reduction
	1	*	1	0	?		: ? 	: - ;
	?	?	?	?	*		: ? 	: x ;
endtable
endprimitive

primitive UDP_LASRX2_QN (q, in1, in2, in3, in4, notifier);
output q;
reg q;
input in1, in2, in3, in4, notifier;
table
//	SETB	RSTB	D	CLK	notifier	: QN 	: QN+1 ;
	0	?	?	?	?		: ? 	: 0 ;
	1	0	?	?	?		: ? 	: 1 ;
	1	1	?	0	?		: ? 	: - ;
	1	?	0	1	?		: ? 	: 1 ;
	?	1	1	1	?		: ? 	: 0 ;
	x	1	?	0	?		: 0 	: 0 ;	//pessimism reduction
	1	x	?	0	?		: 1 	: 1 ;	//pessimism reduction
	1	1	0	x	?		: 1 	: 1 ;	//pessimism reduction
	1	1	1	x	?		: 0 	: 0 ;	//pessimism reduction
	x	1	1	x	?		: 0 	: 0 ;	//pessimism reduction
	1	x	0	x	?		: 1 	: 1 ;	//pessimism reduction
	1	1	*	0	?		: ? 	: - ;
	?	?	?	?	*		: ? 	: x ;
endtable
endprimitive


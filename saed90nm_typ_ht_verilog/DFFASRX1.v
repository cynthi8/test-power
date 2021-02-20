`timescale 1ns/1ps
`celldefine
module DFFASRX1 (D, CLK, RSTB, SETB, Q, QN);
input D;
input CLK;
input RSTB;
input SETB;
output Q;
output QN;
reg notifier;

UDP_DFFASRX1_Q U0 (Q, RSTB, CLK, D, SETB, notifier);
UDP_DFFASRX1_QN U1 (QN, SETB, CLK, RSTB, D, notifier);

specify
specparam
tdelay_RSTB_Q_01_0=0.01,
tdelay_RSTB_Q_10_0=0.01,
tdelay_SETB_Q_01_0=0.01,
tdelay_CLK_Q_01_0=0.01,
tdelay_CLK_Q_10_0=0.01,
tdelay_RSTB_QN_01_0=0.01,
tdelay_SETB_QN_01_0=0.01,
tdelay_SETB_QN_10_0=0.01,
tdelay_CLK_QN_01_0=0.01,
tdelay_CLK_QN_10_0=0.01,
tsetup_D_CLK_0=0.01,
tsetup_D_CLK_1=0.01,
thold_CLK_D_0=0.01,
thold_CLK_D_1=0.01,
trecovery_RSTB_CLK_0=0.01,
tremoval_CLK_RSTB_0=0.01,
trecovery_SETB_CLK_0=0.01,
tremoval_CLK_SETB_0=0.01,
tpulsewidth_CLK_0=0.01,
tpulsewidth_CLK_1=0.01,
tpulsewidth_RSTB_0=0.01,
tpulsewidth_SETB_0=0.01;

(negedge RSTB => (Q +: 1'b0))=(tdelay_RSTB_Q_01_0, tdelay_RSTB_Q_10_0);
(negedge SETB => (Q -: 1'b1))=(tdelay_SETB_Q_01_0, tdelay_SETB_Q_01_0);
(posedge CLK => (Q : 1'b1))=(tdelay_CLK_Q_01_0, tdelay_CLK_Q_10_0);
(negedge RSTB => (QN -: 1'b1))=(tdelay_RSTB_QN_01_0, tdelay_RSTB_QN_01_0);
(negedge SETB => (QN +: 1'b0))=(tdelay_SETB_QN_01_0, tdelay_SETB_QN_10_0);
(posedge CLK => (QN : 1'b1))=(tdelay_CLK_QN_01_0, tdelay_CLK_QN_10_0);
$setup(posedge D , posedge CLK , tsetup_D_CLK_0 , notifier);
$setup(negedge D , posedge CLK , tsetup_D_CLK_1 , notifier);
$hold(posedge CLK , posedge D , thold_CLK_D_0 , notifier);
$hold(posedge CLK , negedge D , thold_CLK_D_1 , notifier);
$recovery(posedge RSTB , posedge CLK , trecovery_RSTB_CLK_0 , notifier);
$hold(posedge CLK , posedge RSTB , tremoval_CLK_RSTB_0 , notifier);
$recovery(posedge SETB , posedge CLK , trecovery_SETB_CLK_0 , notifier);
$hold(posedge CLK , posedge SETB , tremoval_CLK_SETB_0 , notifier);
$width(posedge CLK , tpulsewidth_CLK_0 ,0, notifier);
$width(negedge CLK , tpulsewidth_CLK_1 ,0, notifier);
$width(negedge RSTB , tpulsewidth_RSTB_0 ,0, notifier);
$width(negedge SETB , tpulsewidth_SETB_0 ,0, notifier);
endspecify
endmodule
`endcelldefine
primitive UDP_DFFASRX1_Q (q, in1, in2, in3, in4, notifier);
output q;
reg q;
input in1, in2, in3, in4, notifier;
table
//	RSTB	CLK	D	SETB	notifier	: Q 	: Q+1 ;
	0	?	?	?	?		: ? 	: 0 ;
	1	(01)	1	?	?		: ? 	: 1 ;
	1	(1?)	?	1	?		: ? 	: - ;
	1	?	?	0	?		: ? 	: 1 ;
	1	(?0)	?	1	?		: ? 	: - ;
	?	(01)	0	1	?		: ? 	: 0 ;
	x	?	?	1	?		: 0 	: 0 ;	//pessimism reduction
	1	(x1)	1	1	?		: 1 	: 1 ;	//pessimism reduction
	1	(0x)	1	1	?		: 1 	: 1 ;	//pessimism reduction
	1	(x1)	0	1	?		: 0 	: 0 ;	//pessimism reduction
	1	(0x)	0	1	?		: 0 	: 0 ;	//pessimism reduction
	1	?	?	x	?		: 1 	: 1 ;	//pessimism reduction
	1	(x1)	1	x	?		: 1 	: 1 ;	//pessimism reduction
	1	(0x)	1	x	?		: 1 	: 1 ;	//pessimism reduction
	x	(x1)	0	1	?		: 0 	: 0 ;	//pessimism reduction
	x	(0x)	0	1	?		: 0 	: 0 ;	//pessimism reduction
	(?1)	?	?	1	?		: ? 	: - ;
	1	?	*	1	?		: ? 	: - ;
	1	?	?	(?1)	?		: ? 	: - ;
	?	?	?	?	*		: ? 	: x ;
endtable
endprimitive

primitive UDP_DFFASRX1_QN (q, in1, in2, in3, in4, notifier);
output q;
reg q;
input in1, in2, in3, in4, notifier;
table
//	SETB	CLK	RSTB	D	notifier	: QN 	: QN+1 ;
	0	?	?	?	?		: ? 	: 0 ;
	1	(01)	?	0	?		: ? 	: 1 ;
	1	(1?)	1	?	?		: ? 	: - ;
	1	?	0	?	?		: ? 	: 1 ;
	1	(?0)	1	?	?		: ? 	: - ;
	?	(01)	1	1	?		: ? 	: 0 ;
	x	?	1	?	?		: 0 	: 0 ;	//pessimism reduction
	1	(x1)	1	0	?		: 1 	: 1 ;	//pessimism reduction
	1	(0x)	1	0	?		: 1 	: 1 ;	//pessimism reduction
	1	(x1)	1	1	?		: 0 	: 0 ;	//pessimism reduction
	1	(0x)	1	1	?		: 0 	: 0 ;	//pessimism reduction
	1	?	x	?	?		: 1 	: 1 ;	//pessimism reduction
	1	(x1)	x	0	?		: 1 	: 1 ;	//pessimism reduction
	1	(0x)	x	0	?		: 1 	: 1 ;	//pessimism reduction
	x	(x1)	1	1	?		: 0 	: 0 ;	//pessimism reduction
	x	(0x)	1	1	?		: 0 	: 0 ;	//pessimism reduction
	(?1)	?	1	?	?		: ? 	: - ;
	1	?	(?1)	?	?		: ? 	: - ;
	1	?	1	*	?		: ? 	: - ;
	?	?	?	?	*		: ? 	: x ;
endtable
endprimitive


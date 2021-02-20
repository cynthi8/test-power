`timescale 1ns/1ps
`celldefine
module LNANDX2 (SIN, RIN, Q, QN);
input SIN;
input RIN;
output Q;
output QN;
reg notifier;

UDP_LNANDX2_Q U0 (Q, RIN, SIN, notifier);
UDP_LNANDX2_QN U1 (QN, SIN, RIN, notifier);

specify
specparam
tdelay_SIN_Q_01_0=0.01,
tdelay_RIN_Q_10_0=0.01,
tdelay_SIN_QN_10_0=0.01,
tdelay_RIN_QN_01_0=0.01,
tsetup_SIN_RIN_0=0.01,
tsetup_SIN_RIN_1=0.01,
thold_RIN_SIN_0=0.01,
tsetup_RIN_SIN_0=0.01,
tsetup_RIN_SIN_1=0.01,
thold_SIN_RIN_0=0.01,
tpulsewidth_SIN_0=0.01,
tpulsewidth_RIN_0=0.01;

(negedge SIN => (Q -: 1'b1))=(tdelay_SIN_Q_01_0, tdelay_SIN_Q_01_0);
(negedge RIN => (Q +: 1'b0))=(tdelay_RIN_Q_10_0, tdelay_RIN_Q_10_0);
(negedge SIN => (QN +: 1'b0))=(tdelay_SIN_QN_10_0, tdelay_SIN_QN_10_0);
(negedge RIN => (QN -: 1'b1))=(tdelay_RIN_QN_01_0, tdelay_RIN_QN_01_0);
$setup(posedge SIN , posedge RIN , tsetup_SIN_RIN_0 , notifier);
$setup(posedge SIN , negedge RIN , tsetup_SIN_RIN_1 , notifier);
$hold(posedge RIN , posedge SIN , thold_RIN_SIN_0 , notifier);
$setup(posedge RIN , posedge SIN , tsetup_RIN_SIN_0 , notifier);
$setup(posedge RIN , negedge SIN , tsetup_RIN_SIN_1 , notifier);
$hold(posedge SIN , posedge RIN , thold_SIN_RIN_0 , notifier);
$width(negedge SIN , tpulsewidth_SIN_0 ,0, notifier);
$width(negedge RIN , tpulsewidth_RIN_0 ,0, notifier);
endspecify
endmodule
`endcelldefine
primitive UDP_LNANDX2_Q (q, in1, in2, notifier);
output q;
reg q;
input in1, in2, notifier;
table
//	RIN	SIN	notifier	: Q 	: Q+1 ;
	0	?	?		: ? 	: 0 ;
	1	0	?		: ? 	: 1 ;
	1	1	?		: ? 	: - ;
	x	1	?		: 0 	: 0 ;	//pessimism reduction
	1	x	?		: 1 	: 1 ;	//pessimism reduction
	?	?	*		: ? 	: x ;
endtable
endprimitive

primitive UDP_LNANDX2_QN (q, in1, in2, notifier);
output q;
reg q;
input in1, in2, notifier;
table
//	SIN	RIN	notifier	: QN 	: QN+1 ;
	0	?	?		: ? 	: 0 ;
	1	0	?		: ? 	: 1 ;
	1	1	?		: ? 	: - ;
	x	1	?		: 0 	: 0 ;	//pessimism reduction
	1	x	?		: 1 	: 1 ;	//pessimism reduction
	?	?	*		: ? 	: x ;
endtable
endprimitive


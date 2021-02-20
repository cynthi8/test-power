`timescale 1ns/1ps
`celldefine
module MUX41X1 (IN1, IN2, IN3, IN4, S0, S1, Q);
input IN1;
input IN2;
input IN3;
input IN4;
input S0;
input S1;
output Q;

UDP_MUX41X1_Q U0 ( Q,IN1,IN3,IN2,IN4,S1, S0);

specify
specparam
tdelay_IN1_Q_01_0=0.01,
tdelay_IN1_Q_10_0=0.01,
tdelay_IN2_Q_01_0=0.01,
tdelay_IN2_Q_10_0=0.01,
tdelay_IN3_Q_01_0=0.01,
tdelay_IN3_Q_10_0=0.01,
tdelay_IN4_Q_01_0=0.01,
tdelay_IN4_Q_10_0=0.01,
tdelay_S0_Q_01_0=0.01,
tdelay_S0_Q_10_0=0.01,
tdelay_S1_Q_01_0=0.01,
tdelay_S1_Q_10_0=0.01;

(IN1 +=> Q)=(tdelay_IN1_Q_01_0, tdelay_IN1_Q_10_0);
(IN2 +=> Q)=(tdelay_IN2_Q_01_0, tdelay_IN2_Q_10_0);
(IN3 +=> Q)=(tdelay_IN3_Q_01_0, tdelay_IN3_Q_10_0);
(IN4 +=> Q)=(tdelay_IN4_Q_01_0, tdelay_IN4_Q_10_0);
(S0 => Q)=(tdelay_S0_Q_01_0, tdelay_S0_Q_10_0);
(S1 => Q)=(tdelay_S1_Q_01_0, tdelay_S1_Q_10_0);
endspecify
endmodule
`endcelldefine
primitive UDP_MUX41X1_Q (out,i0,i1,i2,i3,s1,s0);
// Port declareations
output out;
input i0, i1, i2, i3;
input s1, s0;
table
//	i0	i1	i2	i3,	s1	s0	: out
	0	?	?	?	0	0:	0;
	1	?	?	?	0	0:	1;

	?	0	?	?	0	1:	0;
	?	1	?	?	0	1:	1;

	0	0	?	?	0	?:	0;
	1	1	?	?	0	?:	1;

	?	?	0	?	1	0:	0;
	?	?	1	?	1	0:	1;

	?	?	?	0	1	1:	0;
	?	?	?	1	1	1:	1;

	?	?	0	0	1	?:	0;
	?	?	1	1	1	?:	1;

	0	?	0	?	?	0:	0;
	1	?	1	?	?	0:	1;

	?	0	?	0	?	1:	0;
	?	1	?	1	?	1:	1;

	0	0	0	0	?	?:	0;
	1	1	1	1	?	?:	1;

endtable
endprimitive

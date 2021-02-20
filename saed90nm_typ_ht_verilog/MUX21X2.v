`timescale 1ns/1ps
`celldefine
module MUX21X2 (IN1, IN2, S, Q);
input IN1;
input IN2;
input S;
output Q;

UDP_MUX21X2_Q U0 ( Q,IN1,IN2,S);

specify
specparam
tdelay_IN1_Q_01_0=0.01,
tdelay_IN1_Q_10_0=0.01,
tdelay_IN2_Q_01_0=0.01,
tdelay_IN2_Q_10_0=0.01,
tdelay_S_Q_01_0=0.01,
tdelay_S_Q_10_0=0.01;

(IN1 +=> Q)=(tdelay_IN1_Q_01_0, tdelay_IN1_Q_10_0);
(IN2 +=> Q)=(tdelay_IN2_Q_01_0, tdelay_IN2_Q_10_0);
(S => Q)=(tdelay_S_Q_01_0, tdelay_S_Q_10_0);
endspecify
endmodule
`endcelldefine
primitive UDP_MUX21X2_Q (out,i0,i1,s0);
// Port declareations
output out;
input i0, i1;
input s0;
table
//	i0	i1,	s0	: out
	0	?	0:	0;
	1	?	0:	1;

	?	0	1:	0;
	?	1	1:	1;

	0	0	?:	0;
	1	1	?:	1;

endtable
endprimitive

`timescale 1ns/1ps
`celldefine
module OR3X1 (IN1, IN2, IN3, Q);
input IN1;
input IN2;
input IN3;
output Q;

or U0 (Q, IN2, IN3, IN1);

specify
specparam
tdelay_IN1_Q_01_0=0.01,
tdelay_IN1_Q_10_0=0.01,
tdelay_IN2_Q_01_0=0.01,
tdelay_IN2_Q_10_0=0.01,
tdelay_IN3_Q_01_0=0.01,
tdelay_IN3_Q_10_0=0.01;

(IN1 +=> Q)=(tdelay_IN1_Q_01_0, tdelay_IN1_Q_10_0);
(IN2 +=> Q)=(tdelay_IN2_Q_01_0, tdelay_IN2_Q_10_0);
(IN3 +=> Q)=(tdelay_IN3_Q_01_0, tdelay_IN3_Q_10_0);
endspecify
endmodule
`endcelldefine

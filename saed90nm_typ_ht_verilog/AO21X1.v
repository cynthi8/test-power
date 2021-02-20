`timescale 1ns/1ps
`celldefine
module AO21X1 (IN1, IN2, IN3, Q);
input IN1;
input IN2;
input IN3;
output Q;

and U0 (_net_0, IN2, IN1);
or U1 (Q, IN3, _net_0);

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

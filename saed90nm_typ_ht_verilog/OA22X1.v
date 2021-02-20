`timescale 1ns/1ps
`celldefine
module OA22X1 (IN1, IN2, IN3, IN4, Q);
input IN1;
input IN2;
input IN3;
input IN4;
output Q;

or U0 (_net_0, IN1, IN2);
or U1 (_net_1, IN3, IN4);
and U2 (Q, _net_0, _net_1);

specify
specparam
tdelay_IN1_Q_01_0=0.01,
tdelay_IN1_Q_10_0=0.01,
tdelay_IN2_Q_01_0=0.01,
tdelay_IN2_Q_10_0=0.01,
tdelay_IN3_Q_01_0=0.01,
tdelay_IN3_Q_10_0=0.01,
tdelay_IN4_Q_01_0=0.01,
tdelay_IN4_Q_10_0=0.01;

(IN1 +=> Q)=(tdelay_IN1_Q_01_0, tdelay_IN1_Q_10_0);
(IN2 +=> Q)=(tdelay_IN2_Q_01_0, tdelay_IN2_Q_10_0);
(IN3 +=> Q)=(tdelay_IN3_Q_01_0, tdelay_IN3_Q_10_0);
(IN4 +=> Q)=(tdelay_IN4_Q_01_0, tdelay_IN4_Q_10_0);
endspecify
endmodule
`endcelldefine

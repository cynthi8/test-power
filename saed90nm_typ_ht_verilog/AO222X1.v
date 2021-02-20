`timescale 1ns/1ps
`celldefine
module AO222X1 (IN1, IN2, IN3, IN4, IN5, IN6, Q);
input IN1;
input IN2;
input IN3;
input IN4;
input IN5;
input IN6;
output Q;

and U0 (_net_0, IN3, IN4);
and U1 (_net_1, IN1, IN2);
and U2 (_net_2, IN5, IN6);
or U3 (Q, _net_0, _net_1, _net_2);

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
tdelay_IN5_Q_01_0=0.01,
tdelay_IN5_Q_10_0=0.01,
tdelay_IN6_Q_01_0=0.01,
tdelay_IN6_Q_10_0=0.01;

(IN1 +=> Q)=(tdelay_IN1_Q_01_0, tdelay_IN1_Q_10_0);
(IN2 +=> Q)=(tdelay_IN2_Q_01_0, tdelay_IN2_Q_10_0);
(IN3 +=> Q)=(tdelay_IN3_Q_01_0, tdelay_IN3_Q_10_0);
(IN4 +=> Q)=(tdelay_IN4_Q_01_0, tdelay_IN4_Q_10_0);
(IN5 +=> Q)=(tdelay_IN5_Q_01_0, tdelay_IN5_Q_10_0);
(IN6 +=> Q)=(tdelay_IN6_Q_01_0, tdelay_IN6_Q_10_0);
endspecify
endmodule
`endcelldefine

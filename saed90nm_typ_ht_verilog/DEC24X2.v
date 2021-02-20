`timescale 1ns/1ps
`celldefine
module DEC24X2 (IN1, IN2, Q0, Q1, Q2, Q3);
input IN1;
input IN2;
output Q0;
output Q1;
output Q2;
output Q3;

not U0 (_net_0, IN1);
not U1 (_net_1, IN2);
and U2 (Q0, _net_0, _net_1);
not U3 (_net_2, IN1);
and U4 (Q1, _net_2, IN2);
not U5 (_net_3, IN2);
and U6 (Q2, IN1, _net_3);
and U7 (Q3, IN1, IN2);

specify
specparam
tdelay_IN1_Q0_01_0=0.01,
tdelay_IN1_Q0_10_0=0.01,
tdelay_IN2_Q0_01_0=0.01,
tdelay_IN2_Q0_10_0=0.01,
tdelay_IN1_Q1_01_0=0.01,
tdelay_IN1_Q1_10_0=0.01,
tdelay_IN2_Q1_01_0=0.01,
tdelay_IN2_Q1_10_0=0.01,
tdelay_IN1_Q2_01_0=0.01,
tdelay_IN1_Q2_10_0=0.01,
tdelay_IN2_Q2_01_0=0.01,
tdelay_IN2_Q2_10_0=0.01,
tdelay_IN1_Q3_01_0=0.01,
tdelay_IN1_Q3_10_0=0.01,
tdelay_IN2_Q3_01_0=0.01,
tdelay_IN2_Q3_10_0=0.01;

(IN1 -=> Q0)=(tdelay_IN1_Q0_01_0, tdelay_IN1_Q0_10_0);
(IN2 -=> Q0)=(tdelay_IN2_Q0_01_0, tdelay_IN2_Q0_10_0);
(IN1 -=> Q1)=(tdelay_IN1_Q1_01_0, tdelay_IN1_Q1_10_0);
(IN2 +=> Q1)=(tdelay_IN2_Q1_01_0, tdelay_IN2_Q1_10_0);
(IN1 +=> Q2)=(tdelay_IN1_Q2_01_0, tdelay_IN1_Q2_10_0);
(IN2 -=> Q2)=(tdelay_IN2_Q2_01_0, tdelay_IN2_Q2_10_0);
(IN1 +=> Q3)=(tdelay_IN1_Q3_01_0, tdelay_IN1_Q3_10_0);
(IN2 +=> Q3)=(tdelay_IN2_Q3_01_0, tdelay_IN2_Q3_10_0);
endspecify
endmodule
`endcelldefine

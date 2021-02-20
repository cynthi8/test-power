`timescale 1ns/1ps
`celldefine
module NOR4X0 (IN1, IN2, IN3, IN4, QN);
input IN1;
input IN2;
input IN3;
input IN4;
output QN;

nor U0 (QN, IN3, IN4, IN2, IN1);

specify
specparam
tdelay_IN1_QN_01_0=0.01,
tdelay_IN1_QN_10_0=0.01,
tdelay_IN2_QN_01_0=0.01,
tdelay_IN2_QN_10_0=0.01,
tdelay_IN3_QN_01_0=0.01,
tdelay_IN3_QN_10_0=0.01,
tdelay_IN4_QN_01_0=0.01,
tdelay_IN4_QN_10_0=0.01;

(IN1 -=> QN)=(tdelay_IN1_QN_01_0, tdelay_IN1_QN_10_0);
(IN2 -=> QN)=(tdelay_IN2_QN_01_0, tdelay_IN2_QN_10_0);
(IN3 -=> QN)=(tdelay_IN3_QN_01_0, tdelay_IN3_QN_10_0);
(IN4 -=> QN)=(tdelay_IN4_QN_01_0, tdelay_IN4_QN_10_0);
endspecify
endmodule
`endcelldefine

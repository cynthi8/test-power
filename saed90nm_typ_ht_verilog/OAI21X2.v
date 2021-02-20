`timescale 1ns/1ps
`celldefine
module OAI21X2 (IN1, IN2, IN3, QN);
input IN1;
input IN2;
input IN3;
output QN;

or U0 (_net_0, IN2, IN1);
nand U1 (QN, _net_0, IN3);

specify
specparam
tdelay_IN1_QN_01_0=0.01,
tdelay_IN1_QN_10_0=0.01,
tdelay_IN2_QN_01_0=0.01,
tdelay_IN2_QN_10_0=0.01,
tdelay_IN3_QN_01_0=0.01,
tdelay_IN3_QN_10_0=0.01;

(IN1 -=> QN)=(tdelay_IN1_QN_01_0, tdelay_IN1_QN_10_0);
(IN2 -=> QN)=(tdelay_IN2_QN_01_0, tdelay_IN2_QN_10_0);
(IN3 -=> QN)=(tdelay_IN3_QN_01_0, tdelay_IN3_QN_10_0);
endspecify
endmodule
`endcelldefine

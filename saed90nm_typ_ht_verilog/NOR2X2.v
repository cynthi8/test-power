`timescale 1ns/1ps
`celldefine
module NOR2X2 (IN1, IN2, QN);
input IN1;
input IN2;
output QN;

nor U0 (QN, IN1, IN2);

specify
specparam
tdelay_IN1_QN_01_0=0.01,
tdelay_IN1_QN_10_0=0.01,
tdelay_IN2_QN_01_0=0.01,
tdelay_IN2_QN_10_0=0.01;

(IN1 -=> QN)=(tdelay_IN1_QN_01_0, tdelay_IN1_QN_10_0);
(IN2 -=> QN)=(tdelay_IN2_QN_01_0, tdelay_IN2_QN_10_0);
endspecify
endmodule
`endcelldefine

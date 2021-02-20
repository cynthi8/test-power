`timescale 1ns/1ps
`celldefine
module BSLEX1 (INOUT1, ENB, INOUT2);
input INOUT1;
input ENB;
inout INOUT2;

bufif1 U0 (INOUT2, INOUT1, ENB);

specify
specparam
tdelay_ENB_INOUT2_Z1_0=0.01,
tdelay_ENB_INOUT2_Z0_0=0.01,
tdelay_ENB_INOUT2_01_0=0.01,
tdelay_ENB_INOUT2_10_0=0.01,
tdelay_INOUT1_INOUT2_01_0=0.01,
tdelay_INOUT1_INOUT2_10_0=0.01,
tdelay_INOUT1_INOUT2_01_1=0.01,
tdelay_INOUT1_INOUT2_10_1=0.01;

(ENB => INOUT2)=(tdelay_ENB_INOUT2_Z1_0, tdelay_ENB_INOUT2_Z0_0, tdelay_ENB_INOUT2_Z1_0, tdelay_ENB_INOUT2_Z1_0, tdelay_ENB_INOUT2_Z0_0, tdelay_ENB_INOUT2_Z0_0);
(INOUT1 +=> INOUT2)=(tdelay_INOUT1_INOUT2_01_0, tdelay_INOUT1_INOUT2_10_0);
endspecify
endmodule
`endcelldefine

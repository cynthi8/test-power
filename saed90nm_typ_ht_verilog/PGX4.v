`timescale 1ns/1ps
`celldefine
module PGX4 (INQ1, INN, INP, INQ2);
input INQ1;
input INN;
input INP;
inout INQ2;

not U0 (_net_0, INP);
nand U1 (_net_1, INN, _net_0);
bufif0 U2 (INQ2, INQ1, _net_1);

specify
specparam
tdelay_INN_INQ2_Z1_0=0.01,
tdelay_INN_INQ2_Z0_0=0.01,
tdelay_INN_INQ2_01_0=0.01,
tdelay_INN_INQ2_10_0=0.01,
tdelay_INP_INQ2_Z1_0=0.01,
tdelay_INP_INQ2_Z0_0=0.01,
tdelay_INP_INQ2_01_0=0.01,
tdelay_INP_INQ2_10_0=0.01,
tdelay_INQ1_INQ2_01_0=0.01,
tdelay_INQ1_INQ2_10_0=0.01;

(INN => INQ2)=(tdelay_INN_INQ2_Z1_0, tdelay_INN_INQ2_Z0_0, tdelay_INN_INQ2_Z1_0, tdelay_INN_INQ2_Z1_0, tdelay_INN_INQ2_Z0_0, tdelay_INN_INQ2_Z0_0);
(INP => INQ2)=(tdelay_INP_INQ2_Z1_0, tdelay_INP_INQ2_Z0_0, tdelay_INP_INQ2_Z1_0, tdelay_INP_INQ2_Z1_0, tdelay_INP_INQ2_Z0_0, tdelay_INP_INQ2_Z0_0);
(INQ1 +=> INQ2)=(tdelay_INQ1_INQ2_01_0, tdelay_INQ1_INQ2_10_0);
endspecify
endmodule
`endcelldefine

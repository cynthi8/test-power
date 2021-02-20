`timescale 1ns/1ps
`celldefine
module TNBUFFX4 (INP, ENB, Z);
input INP;
input ENB;
output Z;

bufif1 U0 (Z, INP, ENB);

specify
specparam
tdelay_INP_Z_01_0=0.01,
tdelay_INP_Z_10_0=0.01,
tdelay_ENB_Z_Z1_0=0.01,
tdelay_ENB_Z_Z0_0=0.01,
tdelay_ENB_Z_01_0=0.01,
tdelay_ENB_Z_10_0=0.01;

(INP +=> Z)=(tdelay_INP_Z_01_0, tdelay_INP_Z_10_0);
(ENB => Z)=(tdelay_ENB_Z_Z1_0, tdelay_ENB_Z_Z0_0, tdelay_ENB_Z_Z1_0, tdelay_ENB_Z_Z1_0, tdelay_ENB_Z_Z0_0, tdelay_ENB_Z_Z0_0);
endspecify
endmodule
`endcelldefine

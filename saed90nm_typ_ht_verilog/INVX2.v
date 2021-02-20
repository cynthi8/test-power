`timescale 1ns/1ps
`celldefine
module INVX2 (INP, ZN);
input INP;
output ZN;

not U0 (ZN, INP);

specify
specparam
tdelay_INP_ZN_01_0=0.01,
tdelay_INP_ZN_10_0=0.01;

(INP -=> ZN)=(tdelay_INP_ZN_01_0, tdelay_INP_ZN_10_0);
endspecify
endmodule
`endcelldefine

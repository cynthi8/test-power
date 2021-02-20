`timescale 1ns/1ps
`celldefine
module DELLN1X2 (INP, Z);
input INP;
output Z;

buf U0 (Z, INP);

specify
specparam
tdelay_INP_Z_01_0=0.01,
tdelay_INP_Z_10_0=0.01;

(INP +=> Z)=(tdelay_INP_Z_01_0, tdelay_INP_Z_10_0);
endspecify
endmodule
`endcelldefine

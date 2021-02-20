`timescale 1ns/1ps
`celldefine
module HADDX1 (A0, B0, SO, C1);
input A0;
input B0;
output SO;
output C1;

xor U0 (SO, A0, B0);
and U1 (C1, A0, B0);

specify
specparam
tdelay_A0_SO_01_0=0.01,
tdelay_A0_SO_10_0=0.01,
tdelay_B0_SO_01_0=0.01,
tdelay_B0_SO_10_0=0.01,
tdelay_A0_C1_01_0=0.01,
tdelay_A0_C1_10_0=0.01,
tdelay_B0_C1_01_0=0.01,
tdelay_B0_C1_10_0=0.01;

(A0 => SO)=(tdelay_A0_SO_01_0, tdelay_A0_SO_10_0);
(B0 => SO)=(tdelay_B0_SO_01_0, tdelay_B0_SO_10_0);
(A0 +=> C1)=(tdelay_A0_C1_01_0, tdelay_A0_C1_10_0);
(B0 +=> C1)=(tdelay_B0_C1_01_0, tdelay_B0_C1_10_0);
endspecify
endmodule
`endcelldefine

`timescale 1ns/1ps
`celldefine
module ISOLORX1 (ISO, D, Q);
input ISO;
input D;
output Q;

or U0 (Q, D, ISO);

specify
specparam
tdelay_ISO_Q_01_0=0.01,
tdelay_ISO_Q_10_0=0.01,
tdelay_D_Q_01_0=0.01,
tdelay_D_Q_10_0=0.01;

(ISO +=> Q)=(tdelay_ISO_Q_01_0, tdelay_ISO_Q_10_0);
(D +=> Q)=(tdelay_D_Q_01_0, tdelay_D_Q_10_0);
endspecify
endmodule
`endcelldefine

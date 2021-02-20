`timescale 1ns/1ps
`celldefine
module ISOLANDX4 (ISO, D, Q);
input ISO;
input D;
output Q;

not U0 (_net_0, ISO);
and U1 (Q, D, _net_0);

specify
specparam
tdelay_ISO_Q_01_0=0.01,
tdelay_ISO_Q_10_0=0.01,
tdelay_D_Q_01_0=0.01,
tdelay_D_Q_10_0=0.01;

(ISO -=> Q)=(tdelay_ISO_Q_01_0, tdelay_ISO_Q_10_0);
(D +=> Q)=(tdelay_D_Q_01_0, tdelay_D_Q_10_0);
endspecify
endmodule
`endcelldefine

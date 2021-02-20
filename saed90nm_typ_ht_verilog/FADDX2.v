`timescale 1ns/1ps
`celldefine
module FADDX2 (A, B, CI, S, CO);
input A;
input B;
input CI;
output S;
output CO;

xor U0 (S, B, CI, A);
and U1 (_net_0, A, CI);
and U2 (_net_1, B, CI);
and U3 (_net_2, A, B);
or U4 (CO, _net_0, _net_1, _net_2);

specify
specparam
tdelay_A_S_01_0=0.01,
tdelay_A_S_10_0=0.01,
tdelay_B_S_01_0=0.01,
tdelay_B_S_10_0=0.01,
tdelay_CI_S_01_0=0.01,
tdelay_CI_S_10_0=0.01,
tdelay_A_CO_01_0=0.01,
tdelay_A_CO_10_0=0.01,
tdelay_B_CO_01_0=0.01,
tdelay_B_CO_10_0=0.01,
tdelay_CI_CO_01_0=0.01,
tdelay_CI_CO_10_0=0.01;

(A => S)=(tdelay_A_S_01_0, tdelay_A_S_10_0);
(B => S)=(tdelay_B_S_01_0, tdelay_B_S_10_0);
(CI => S)=(tdelay_CI_S_01_0, tdelay_CI_S_10_0);
(A +=> CO)=(tdelay_A_CO_01_0, tdelay_A_CO_10_0);
(B +=> CO)=(tdelay_B_CO_01_0, tdelay_B_CO_10_0);
(CI +=> CO)=(tdelay_CI_CO_01_0, tdelay_CI_CO_10_0);
endspecify
endmodule
`endcelldefine

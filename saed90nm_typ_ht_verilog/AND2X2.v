`timescale 1ns/1ps
`celldefine
module AND2X2 (IN1, IN2, Q);
input IN1;
input IN2;
output Q;

and U0 (Q, IN1, IN2);

specify
specparam
tdelay_IN1_Q_01_0=0.01,
tdelay_IN1_Q_10_0=0.01,
tdelay_IN2_Q_01_0=0.01,
tdelay_IN2_Q_10_0=0.01;

(IN1 +=> Q)=(tdelay_IN1_Q_01_0, tdelay_IN1_Q_10_0);
(IN2 +=> Q)=(tdelay_IN2_Q_01_0, tdelay_IN2_Q_10_0);
endspecify
endmodule
`endcelldefine

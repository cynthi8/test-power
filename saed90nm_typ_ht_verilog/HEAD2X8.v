`timescale 1ns/1ps
`celldefine
module HEAD2X8 (SLEEP, SLEEPOUT);
input SLEEP;
output SLEEPOUT;

buf U0 (SLEEPOUT, SLEEP);

specify
specparam
tdelay_SLEEP_SLEEPOUT_01_0=0.01,
tdelay_SLEEP_SLEEPOUT_10_0=0.01;

(SLEEP +=> SLEEPOUT)=(tdelay_SLEEP_SLEEPOUT_01_0, tdelay_SLEEP_SLEEPOUT_10_0);
endspecify
endmodule
`endcelldefine

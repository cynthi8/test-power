`timescale 1ns/1ps
module top_tb();
    reg  RST, CLK, GO_I, TEST_SI, TEST_SE, TCK, TRSTN, TDI, TMS;
    reg[3:0] X_I, Y_I;
    wire[3:0] D_O;
    wire TDO, TEST_SO;

    TOP uut(.RST(RST), .CLK(RST), .GO_I(GO_I), .X_I(X_I), .Y_I(Y_I), .D_O(D_O), .TEST_SI(TEST_SI), .TEST_SO(TEST_SO), .TEST_SE(TEST_SE), .TCK(TCK), .TRSTN(TRSTN), .TDI(TDI), .TMS(TMS), .TDO(TDO));

    parameter period = 40;
    
    initial begin
        TCK = 0;
    end

    always #(period/2) TCK = ~TCK;
    
    initial begin
        TDI = 0;
        TMS = 0;
        TRSTN = 0;
    end
    
    


endmodule

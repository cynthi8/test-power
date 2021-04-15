`timescale 1ns/1ps
module gcd_tb();
    reg rst, clk, go_i;
    reg[3:0] x_i, y_i;
    wire[3:0] d_o;

    gcd uut(.rst(rst), .clk(clk), .go_i(go_i), .x_i(x_i), .y_i(y_i), .d_o(d_o));

    parameter period = 40;
    parameter cycles_per_test = 30;
    
    task TestGCD;
        input [3:0] xValue, yValue; 
        input integer correct_result;
        begin
            x_i = xValue;
            y_i = yValue;
            go_i = 1;
            #(period);
            go_i = 0;
            #(cycles_per_test * period);
            if (d_o != correct_result) begin
                $display("Test failed for gcd(%d,%d) = %0d",  xValue, yValue, correct_result);
                $display("%d", $time);
            end
        end
    endtask

    initial begin
        clk = 0;
    end

    always #(period/2) clk = ~clk;

    always @(negedge clk) begin
        // Initialize
        rst = 1;
        go_i = 0;
        x_i = 0;
        y_i = 0;
        #(period);
        rst = 0;
        #(period);

        $display("\nStarting Tests:");
        TestGCD(12, 8, 4);
        TestGCD(14, 7, 7);
        TestGCD(15, 13, 1);
        TestGCD(11, 3, 1);
        TestGCD(5, 15, 5);
        TestGCD(6, 6, 6);
        TestGCD(8, 7, 1);
        TestGCD(15, 2, 1);


        $display("Simulation Complete");
        $stop;
        
    end

endmodule

`timescale 1ns/1ps
module gcd_tb();
    reg rst, clk, go_i;
    reg[3:0] x_i, y_i;
    wire[3:0] d_o;

    gcd uut(.rst(rst), .clk(clk), .go_i(go_i), .x_i(x_i), .y_i(y_i), .d_o(d_o));

    parameter period = 40;
    parameter cycles_per_test = 20;

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

        // Test 1
        x_i = 12;
        y_i = 8;
        go_i = 1;
        #(period);
        go_i = 0;
        #(cycles_per_test * period);
        if (d_o != 4) begin
            $display("%0t test failed for gcd(12,8) = 4", $time);
        end

        // Test 2
        x_i = 7;
        y_i = 3;
        go_i = 1;
        #(period);
        go_i = 0;
        #(cycles_per_test * period);
        if (d_o != 1) begin
            $display("%0t test failed for gcd(7,3) = 1", $time);
        end

        // Test 3
        x_i = 15;
        y_i = 15;
        go_i = 1;
        #(period);
        go_i = 0;
        #(cycles_per_test * period);
        if (d_o != 15) begin
            $display("%0t test failed for gcd(15,15) = 15", $time);
        end

        $display("Simulation Complete");
        $stop;
        
    end

endmodule

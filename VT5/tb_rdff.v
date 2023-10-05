`timescale 1ns / 1ps
`include "reset_d_ff.v"
module testbench;
    reg d;
    reg clk;
    reg reset_n;
    wire q;

    // Instantiate the D flip-flop
    d_flip_flop u1 (d,clk,reset_n,q);
   

    initial begin
        // Initialize signals
        d = 0;
        clk = 0;
        reset_n = 0;

        // Apply reset
        #10 reset_n = 1;

        // Apply test vectors
        #10 d = 1;
        #10 d = 0;
        #10 d = 1;
        #10 d = 0;

        // End of test
        #10 $finish;
    end

    // Generate clock
    always #10 clk = ~clk;

endmodule

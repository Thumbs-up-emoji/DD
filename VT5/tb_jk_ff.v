`timescale 1ns / 1ps
`include "jk_ff.v"
module testbench_jk;
    reg j;
    reg k;
    reg clk;
    wire q;

    // Instantiate the JK flip-flop
    jk_flip_flop u1 (j,k,clk,q);

    initial begin
        // Initialize signals
        j = 0;
        k = 0;
        clk = 0;

        // Apply test vectors
        #10 j = 1; k = 0; // Set
        #10 j = 0; k = 1; // Reset
        #10 j = 1; k = 1; // Toggle
        #10 j = 0; k = 0; // Hold

        // End of test
        #10 $finish;
    end

    // Generate clock
    always #10 clk = ~clk;

endmodule

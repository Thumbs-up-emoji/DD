`timescale 1ns / 1ps
`include "t_ff.v"
module testbench_t;
    reg t;
    reg clk;
    wire q;

    // Instantiate the T flip-flop
    t_flip_flop u1 (t,clk,q);

    initial begin
        // Initialize signals
        t = 0;
        clk = 0;

        // Apply test vectors
        #10 t = 1; // Toggle
        #10 t = 0; // Hold
        #10 t = 1; // Toggle
        #10 t = 0; // Hold

        // End of test
        #10 $finish;
    end

    // Generate clock
    always #10 clk = ~clk;

endmodule

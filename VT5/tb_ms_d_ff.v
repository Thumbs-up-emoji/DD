`timescale 1ns / 1ps
`include "ms_d_ff.v"
module testbench_master_slave_d;
    reg d;
    reg clk;
    wire q;

    // Instantiate the master-slave D flip-flop
    master_slave_d_flip_flop u1 (d,clk,q );

    initial begin
        // Initialize signals
        d = 0;
        clk = 0;

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

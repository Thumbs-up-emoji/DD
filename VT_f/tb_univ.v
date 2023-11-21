`include "univ_register.v"

module universal_shift_register_testbench();
    reg clk, reset;
    reg [1:0] mode;
    reg data_in;
    wire [3:0] data_out;

    universal_shift_register dut(clk, reset, mode, data_in, data_out);

    initial begin 
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("out1.vcd");
        $dumpvars(0, universal_shift_register_testbench);
        reset = 1;
        #5;
        reset = 0;
        #200;
        $finish;
    end

    initial begin
        mode = 2'b00; // Shift left mode
        data_in=1'b0;
        #10;
        data_in = 1'b1; // Test input
        #10;
        mode = 2'b01; // Shift right mode
        #10;
        data_in = 1'b0; // Test input
        #10;
        mode = 2'b10; // Parallel load mode
        #10;
        data_in = 1'b1; // Test input
        #10;
        mode = 2'b11; // Hold state mode
        #10;
    end
endmodule

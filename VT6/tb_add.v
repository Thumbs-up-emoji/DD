`include "s_add.v"

module serial_adder_testbench();
    reg clk, reset, load;
    reg a_in, b_in;
    wire [3:0] sum_out;

    serial_adder dut(clk, reset, load, a_in, b_in, sum_out);

    initial begin 
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("out.vcd");
        $dumpvars(0, serial_adder_testbench);
        reset = 1;
        #15;
        reset = 0;
        #200;
        $finish;
    end

    initial begin
        load = 0;
        a_in = 1'b0; // Test input
        b_in = 1'b0; // Test input
        #10;
        load = 1; // Assert load
        a_in = 1'b1; // Test input
        b_in = 1'b1; // Test input
        #10;
        load = 0; // Deassert load
        a_in = 1'b1; // Test input
        b_in = 1'b0; // Test input
        #10;
        load = 1; // Assert load
        a_in = 1'b0; // Test input
        b_in = 1'b1; // Test input
        #10;
    end
endmodule

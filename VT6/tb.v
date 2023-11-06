`include "counter.v"

module up_down_counter_testbench();
    reg clk, reset, load, up_down;
    reg [3:0] data_in;
    wire [3:0] count_out;

    up_down_counter dut(clk, reset, load, up_down, data_in, count_out);

    initial begin 
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("out3.vcd");
        $dumpvars(0, up_down_counter_testbench);
        reset = 1;
        #15;
        reset = 0;
        #200;
        $finish;
    end

    initial begin
        load = 0;
        up_down = 1; // Up mode
        data_in = 4'b0000; // Test input
        #10;
        load = 1; // Assert load
        data_in = 4'b1010; // Test input
        #10;
        load = 0; // Deassert load
        #20; // Observe the count incrementing
        up_down = 0; // Down mode
        #20; // Observe the count decrementing
    end
endmodule

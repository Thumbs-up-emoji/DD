`include "johnson_c.v"

module twisted_johnson_counter_testbench();
    reg clk, reset;
    wire [3:0] count_out;

    twisted_johnson_counter dut(clk, reset, count_out);

    initial begin 
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("out4.vcd");
        $dumpvars(0, twisted_johnson_counter_testbench);
        reset = 1;
        #15;
        reset = 0;
        #200;
        $finish;
    end
endmodule

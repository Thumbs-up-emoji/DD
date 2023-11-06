`include "rip_2b_counter.v"

module ripple_counter_testbench();
    reg clk, reset;
    wire [1:0] count_out;

    ripple_counter dut(clk, reset, count_out);

    initial begin 
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("out6.vcd");
        $dumpvars(0, ripple_counter_testbench);
        reset = 1;
        #15;
        reset = 0;
        #200;
        $finish;
    end
endmodule

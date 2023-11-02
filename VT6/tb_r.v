`include "register.v"

module parallel_load_register_testbench();
    reg clk, reset_n, load;
    reg [3:0] data_in;
    wire [3:0] data_out;

    parallel_load_register dut(clk, reset_n, load, data_in, data_out);

    initial begin 
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("out.vcd");
        $dumpvars(0, parallel_load_register_testbench);
        reset_n = 0; // Assert reset
        #15;
        reset_n = 1; // Deassert reset
        #200;
        $finish;
    end

    initial begin
        load = 0;
        data_in = 4'b0000; // Test input
        #10;
        load = 1; // Assert load
        data_in = 4'b1010; // Test input
        #10;
        load = 0; // Deassert load
        data_in = 4'b1111; // Test input
        #10;
        load = 1; // Assert load
        data_in = 4'b0101; // Test input
        #10;
    end
endmodule

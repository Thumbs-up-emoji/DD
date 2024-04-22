module compare (
    input [3:0] in1,
    input [3:0] in2,
    output reg g,
    output reg e,
    output reg l
);
    // Declare a module named "compare" with two 4-bit input ports (in1 and in2)
    // and three 1-bit output registers (g, e, and l).

    always @(in1 or in2) begin
        // Create a combinational logic block that triggers whenever in1 or in2 changes.

        if (in1 > in2) begin
            // If in1 is greater than in2, set g=1, e=0, and l=0.
            g <= 1;
            e <= 0;
            l <= 0;
        end
        else if (in1 == in2) begin
            // If in1 is equal to in2, set g=0, e=1, and l=0.
            g <= 0;
            e <= 1;
            l <= 0;
        end
        else begin
            // Otherwise (in1 < in2), set g=0, e=0, and l=1.
            g <= 0;
            e <= 0;
            l <= 1;
        end
    end
    // Note: The "always" block continuously monitors changes in in1 and in2.
    // The conditions inside the block determine the values of g, e, and l.
endmodule

module tb ();
    // Declare a testbench module named "tb".

    reg [3:0] in1;
    reg [3:0] in2;
    wire g, e, l;
    // Declare registers for input (in1 and in2) and wires for output (g, e, and l).

    compare test(in1, in2, g, e, l);
    // Instantiate the "compare" module with the specified inputs and connect its outputs.

    initial begin
        $dumpfile("out3.vcd");
        $dumpvars(0, tb);
        // Specify VCD file for waveform dumping and associate it with the testbench module.

        // Apply input values and observe outputs
        // (Each #10 delay represents a time unit of 10 time units.)

        // ... (Repeat for all test cases)

        // Finish the simulation
        #10 $finish;
        // Terminate the simulation after a delay of 10 time units.
    end
endmodule

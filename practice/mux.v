module mux (
    input [3:0] in, // 4-bit input vector 'in' representing the inputs to the multiplexer
    input [1:0] s,  // 2-bit input vector 's' representing the select lines for the multiplexer
    output reg out  // Single-bit output 'out' representing the output of the multiplexer
);
    always @(in or s) begin
        // An 'always' block that triggers whenever there is a change in 'in' or 's'
        if(s == 2'b00) out <= in[0]; // If select lines are 00, output the first bit of 'in'
        if(s == 2'b01) out <= in[1]; // If select lines are 01, output the second bit of 'in'
        if(s == 2'b10) out <= in[2]; // If select lines are 10, output the third bit of 'in'
        if(s == 2'b11) out <= in[3]; // If select lines are 11, output the fourth bit of 'in'
    end
endmodule
// End of the 'mux' module definition

module tb (); // Testbench module named 'tb'
    reg [3:0] in; // 4-bit register 'in' to hold the test input vector
    reg [1:0] s;  // 2-bit register 's' to hold the test select lines
    wire out;     // Single-bit wire 'out' to observe the output of the multiplexer

    mux test(in, s, out); // Instantiation of the 'mux' module named 'test'
    initial begin
        $dumpfile("out1.vcd"); // Command to create a VCD (Value Change Dump) file named 'out1.vcd'
        $dumpvars(0, tb);      // Command to dump all variables of the testbench 'tb' to the VCD file

        in = 4'b1010; // Initialize 'in' with the binary value 1010
        s = 2'b00;    // Set the select lines to 00
        #10           // Wait for 10 simulation time units
        s = 2'b01;    // Change the select lines to 01
        #10           // Wait for 10 simulation time units
        s = 2'b10;    // Change the select lines to 10
        #10           // Wait for 10 simulation time units
        s = 2'b11;    // Change the select lines to 11
        #10           // Wait for 10 simulation time units
        $finish;      // End the simulation
    end
endmodule
// End of the 'tb' (testbench) module definition

module sequence_detector (
    input wire clk, reset, data_in,
    output reg detected
);
    // Declare a module named "sequence_detector" with the following ports:
    // - clk: Clock input
    // - reset: Asynchronous reset input
    // - data_in: Input data
    // - detected: Output indicating whether the sequence is detected

    reg [1:0] state, next_state;
    // Declare two 2-bit registers: "state" and "next_state".

    always @(posedge clk or posedge reset) begin
        // Create a clocked always block triggered by the positive edge of clk or reset.

        if (reset) state <= 2'b00;
        else state <= next_state;
        // If reset is active (high), set state to 2'b00; otherwise, update state with next_state.
    end

    always @* begin
        // Create a combinational always block triggered by changes in any input.

        case (state)
            2'b00: if (data_in) next_state = 2'b01; else next_state = 2'b00;
            2'b01: if (data_in) next_state = 2'b10; else next_state = 2'b00;
            2'b10: if (~data_in) next_state = 2'b11; else next_state = 2'b10;
            2'b11: if (data_in) next_state = 2'b10; else next_state = 2'b00;
            default: next_state = 2'b00;
        endcase
        // Based on the current state, determine the next state using a case statement.
    end

    always @* begin
        // Another combinational always block triggered by changes in any input.

        if (state == 2'b11) detected = 1;
        else detected = 0;
        // If the current state is 2'b11 (binary 3), set detected to 1; otherwise, set it to 0.
    end
endmodule

module tb_sequence_detector;
    // Declare a testbench module named "tb_sequence_detector".

    reg clk, reset, data_in;
    wire detected;
    // Declare registers for input (clk, reset, data_in) and a wire for output (detected).

    // Instantiate the sequence_detector module
    sequence_detector u1 (.clk(clk), .reset(reset), .data_in(data_in), .detected(detected));

    initial begin
        $dumpfile("out2.vcd");
        $dumpvars(0, tb_sequence_detector);
        // Specify VCD file for waveform dumping and associate it with the testbench module.

        // Initialize signals
        clk = 0;
        reset = 1;
        data_in = 0;

        // Apply reset
        #10 reset = 0;
        #10 reset = 1;
        #10 reset = 0;

        // Apply input sequence
        // ... (Repeat for all test cases)

        // Finish the simulation
        #10 $finish;
        // Terminate the simulation after a delay of 10 time units.
    end

    // Generate clock signal
    always #5 clk = ~clk;
    // Toggle the clock every 5 time units.
endmodule

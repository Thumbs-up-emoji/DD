module sequence_detector (input wire clk, reset, data_in, output reg detected);
    reg [1:0] state, next_state;

    always @(posedge clk or posedge reset) begin
        if (reset) state <= 2'b00;
        else state <= next_state;
    end

    always @* begin
        case (state)
            2'b00: if (data_in) next_state = 2'b01; else next_state = 2'b00;
            2'b01: if (data_in) next_state = 2'b10; else next_state = 2'b00;
            2'b10: if (~data_in) next_state = 2'b11; else next_state = 2'b10;
            2'b11: if (data_in) next_state = 2'b10; else next_state = 2'b00;
            default: next_state = 2'b00;
        endcase
    end

    always @* begin
        if (state == 2'b11) detected = 1;
        else detected = 0;
    end
endmodule

module tb_sequence_detector;
    reg clk, reset, data_in;
    wire detected;

    // Instantiate the sequence_detector module
    sequence_detector u1 (.clk(clk), .reset(reset), .data_in(data_in), .detected(detected));

    initial begin
        $dumpfile("out2.vcd");
        $dumpvars(0,tb_sequence_detector);
        // Initialize signals
        clk = 0;
        reset = 1;
        data_in = 0;

        // Apply reset
        #10 reset = 0;
        #10 reset = 1;
        #10 reset = 0;

        // Apply input sequence
        #10 data_in = 1;
        #10 data_in = 1;
        #10 data_in = 0;
        #10 data_in = 1;
        #10 data_in = 1;
        #10 data_in = 0;

        // Finish the simulation
        #10 $finish;
    end

    // Generate clock signal
    always #5 clk = ~clk;
endmodule

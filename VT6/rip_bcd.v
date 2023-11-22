module BCDRippleCounter (
    input wire clk,
    input wire reset,
    output wire [3:0] bcdOut
);

    // Declare 4 flip-flops
    reg q0, q1, q2, q3;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            q0 = 0;
        end else begin
            q0 = ~q0;  // Toggle on every clock cycle
        end
    end

    always @(negedge q0 or posedge reset) begin
        if (reset) begin
            q1 = 0;
        end else begin
            q1 = ~q1;  // Toggle when q0 goes from 1 to 0
        end
    end

    always @(negedge q1 or posedge reset) begin
        if (reset) begin
            q2 = 0;
        end else begin
            q2 = ~q2;  // Toggle when q1 goes from 1 to 0
        end
    end

    always @(negedge q2 or posedge reset) begin
        if (reset) begin
            q3 = 0;
        end else begin
            q3 = ~q3;  // Toggle when q2 goes from 1 to 0
        end
    end

    assign bcdOut = {q3, q2, q1, q0};  // Concatenate the outputs

    // Reset the counter when it reaches 10
    always @(bcdOut) begin
        if (bcdOut == 4'b1010) begin
            q0 = 0;
            q1 = 0;
            q2 = 0;
            q3 = 0;
        end
    end

endmodule

module BCDRippleCounter_tb;
    reg clk;
    reg reset;
    wire [3:0] bcdOut;

    // Instantiate the BCDRippleCounter
    BCDRippleCounter u1 (
        .clk(clk),
        .reset(reset),
        .bcdOut(bcdOut)
    );

    // Clock generator
    always begin
        #5 clk = ~clk;  // Toggle the clock every 5 time units
    end

    // Test procedure
    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;

        #10 reset = 0;  // Release the reset after 10 time units

        #100 $finish;  // Stop the simulation after 100 time units
    end

    // Monitor procedure
    initial begin
        $monitor("At time %t, bcdOut = %b", $time, bcdOut);
    end
endmodule

module parking (
    input entry,
    input exit,
    output reg [3:0] num
);
    // Declare a module named "parking" with input ports "entry" and "exit"
    // and an output register "num" of 4 bits wide.

    initial begin
        num = 4'b0101;
        // Initialize "num" with the binary value 0101 (decimal 5).
        // This value represents the initial parking spaces occupied.

        // Note: The "initial" block is executed only once at the beginning of simulation.
    end

    always @(entry, exit) begin
        // Create a combinational logic block that triggers whenever "entry" or "exit" changes.

        if (num < 4'b1010) begin
            // Check if the current value of "num" (occupied parking spaces) is less than 1010 (decimal 10).

            if (entry & !exit) begin
                // If a car enters (entry=1) and does not exit (exit=0), increment "num" by 1.
                num = num + 1;
            end
            else if (exit & !entry) begin
                // If a car exits (exit=1) and does not enter (entry=0), decrement "num" by 1.
                num = num - 1;
            end
        end
        // Note: The "always" block continuously monitors changes in "entry" and "exit".
        // The conditions inside the block determine whether to increment or decrement "num".
    end
endmodule

module tb ();
    // Declare a testbench module named "tb".

    reg entry, exit;
    // Declare two registers "entry" and "exit" for testbench inputs.

    wire [3:0] n;
    // Declare a wire "n" of 4 bits wide for connecting to the "num" output of the "parking" module.

    parking test(entry, exit, n);
    // Instantiate the "parking" module with the specified inputs and connect its output to "n".

    initial begin
        $dumpfile("out4.vcd");
        $dumpvars(0, tb);
        // Specify VCD file for waveform dumping and associate it with the testbench module.

        // Initialize inputs
        entry = 0;
        exit = 0;
        // Set initial values for "entry" and "exit" (both are initially 0).

        // Apply test vectors
        #10 entry = 1; exit = 0;  // Car enters
        #10 entry = 0; exit = 0;  // No activity
        #10 entry = 0; exit = 1;  // Car exits
        #10 entry = 1; exit = 1;  // Invalid condition
        #10 entry = 0; exit = 0;  // No activity

        // End the simulation
        #10 $finish;
        // Terminate the simulation after a delay of 10 time units.
    end
endmodule

module parking (
    input entry,
    input exit,
    output reg [3:0]num
);
    initial begin
        num=4'b0101;
    end
    always @(entry,exit) begin
        if(num<4'b1010) begin
            if(entry&!exit) begin
                num+=1;
            end
            else if(exit&!entry) begin
                num-=1;
            end
        end
    end
endmodule

module tb ();
    reg entry, exit;
    wire [3:0]n;
    parking test(entry,exit,n);
    initial begin
        $dumpfile("out4.vcd");
        $dumpvars(0,tb);
        // Initialize inputs
        entry = 0;
        exit = 0;

        // Apply test vectors
        #10 entry = 1; exit = 0;  // Car enters
        #10 entry = 0; exit = 0;  // No activity
        #10 entry = 0; exit = 1;  // Car exits
        #10 entry = 1; exit = 1;  // Invalid condition
        #10 entry = 0; exit = 0;  // No activity

        // End the simulation
        #10 $finish;
    end
endmodule
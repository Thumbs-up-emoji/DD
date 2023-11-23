module compare (
    input [3:0] in1,
    input [3:0] in2,
    output reg g,
    output reg e,
    output reg l
);
    always@(in1 or in2) begin
        if(in1>in2) begin
            g<=1;
            e<=0;
            l<=0;
        end
        else if(in1==in2) begin
            g<=0;
            e<=1;
            l<=0;
        end    
        else begin
            g<=0;
            e<=0;
            l<=1;
        end
    end
endmodule

module tb ();
    reg [3:0] in1;
    reg [3:0] in2;
    wire g,e,l;
    compare test(in1,in2,g,e,l);
    initial begin
        $dumpfile("out3.vcd");
        $dumpvars(0,tb);

        // Apply input values
        #10 in1 = 4'b0000; in2 = 4'b0000; // in1 == in2
        #10 in1 = 4'b0001; in2 = 4'b0000; // in1 > in2
        #10 in1 = 4'b0000; in2 = 4'b0001; // in1 < in2
        #10 in1 = 4'b0010; in2 = 4'b0010; // in1 == in2
        #10 in1 = 4'b0011; in2 = 4'b0010; // in1 > in2
        #10 in1 = 4'b0010; in2 = 4'b0011; // in1 < in2
        #10 in1 = 4'b0100; in2 = 4'b0100; // in1 == in2
        #10 in1 = 4'b0101; in2 = 4'b0100; // in1 > in2
        #10 in1 = 4'b0100; in2 = 4'b0101; // in1 < in2
        #10 in1 = 4'b0110; in2 = 4'b0110; // in1 == in2
        #10 in1 = 4'b0111; in2 = 4'b0110; // in1 > in2
        #10 in1 = 4'b0110; in2 = 4'b0111; // in1 < in2
        #10 in1 = 4'b1000; in2 = 4'b1000; // in1 == in2
        #10 in1 = 4'b1001; in2 = 4'b1000; // in1 > in2
        #10 in1 = 4'b1000; in2 = 4'b1001; // in1 < in2
        #10 in1 = 4'b1010; in2 = 4'b1010; // in1 == in2
        #10 in1 = 4'b1011; in2 = 4'b1010; // in1 > in2
        #10 in1 = 4'b1010; in2 = 4'b1011; // in1 < in2
        #10 in1 = 4'b1100; in2 = 4'b1100; // in1 == in2
        #10 in1 = 4'b1101; in2 = 4'b1100; // in1 > in2
        #10 in1 = 4'b1100; in2 = 4'b1101; // in1 < in2
        #10 in1 = 4'b1110; in2 = 4'b1110; // in1 == in2
        #10 in1 = 4'b1111; in2 = 4'b1110; // in1 > in2
        #10 in1 = 4'b1110; in2 = 4'b1111; // in1 < in2
        #10 in1 = 4'b1111; in2 = 4'b1111; // in1 == in2

        // Finish the simulation
        #10 $finish;
    end
endmodule

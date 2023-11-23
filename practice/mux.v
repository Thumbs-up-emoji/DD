module mux (
    input [3:0] in, input [1:0] s, output reg out
);
    always @(in or s) begin
        if(s==2'b00) out<=in[0];
        if(s==2'b01) out<=in[1];
        if(s==2'b10) out<=in[2];
        if(s==2'b11) out<=in[3];
    end
endmodule

module tb ();
    reg [3:0] in;
    reg [1:0] s;
    wire out;
    mux test(in,s,out);
    initial begin
        $dumpfile("out1.vcd");
        $dumpvars(0,tb);
        in=4'b1010;
        s=2'b00;
        #10
        s=2'b01;
        #10
        s=2'b10;
        #10
        s=2'b11;
        #10
        $finish;
    end
endmodule
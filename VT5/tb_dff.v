`include "edge_d_ff.v"
module tb ();
    wire q;
    reg en,d;

    ff dff(clk,en,d,q);
    reg clk=1'b0;
    always #10 clk=~clk;
    initial begin
        $dumpfile("ff.vcd");
        $dumpvars(0,tb);

            d=1'b1 ; en=1'b1;
        #10 d=1'b0 ; en=1'b1;
        #10 d=1'b1 ; en=1'b1;
        #10 d=1'b1 ; en=1'b1;
        #10 $finish;
    end

    initial begin
        $monitor("time:%0d D:%d en:%d Q:%d",$time,d,en,q);
    end
endmodule
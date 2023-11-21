`include "fsm.v"
module tb();

reg [2:0] in;
wire out,clk;

check tb_check(in,out);

initial begin
    $dumpfile("out3.vcd");
    $dumpvars(0,tb);
    in=3'b000;
    #10 in=3'b101;
    #200;
    $finish;
end

endmodule
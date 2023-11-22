`include "decade_counter.v"
`include "counter3.v"
`include "flipflop.v"
module testbench();
reg clk, reset;
wire y,q;

counter10 cnt(clk, reset, y);
counter3 cnt1(y,reset,out);
jkff jk1(out,reset,1'b1,1'b1,q);
initial begin 
clk=0;
forever #1 clk=~clk;
end
initial begin
    $dumpfile("out.vcd");
    $dumpvars(0,testbench);
reset=1;
#10;
reset=0;
#200;
$finish;
reset=0;
end
endmodule 
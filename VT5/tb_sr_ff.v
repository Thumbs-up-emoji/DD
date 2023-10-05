`include "sr_ff.v"
module testbench;

  reg s, r, clk;
  wire q, q_bar;

  sr_flip_flop uut (
    .s(s),
    .r(r),
    .clk(clk),
    .q(q),
    .q_bar(q_bar)
  );

  initial begin
    $dumpfile("testbench.vcd");
    $dumpvars(0, testbench);

    s = 0;
    r = 0;
    clk = 0;

    #10;
    s = 1;
    #10;
    s = 0;
    #10;
    r = 1;
    #10;
    r = 0;
    #10;
    s = 1;
    #10;
    s = 0;
    #10;
    $finish;
  end

  always begin
    #5;
    clk = ~clk;
  end

endmodule

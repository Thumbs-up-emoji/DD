module sr_latch (
  input S,
  input R,
  output reg Q
);

  always @(posedge S or posedge R) begin
    if (S) begin
      Q <= 1'b1;
    end else if (R) begin
      Q <= 1'b0;
    end
  end

endmodule

module sr_latch_tb;

  reg S, R;
  wire Q;

  sr_latch sr_latch_inst (
    .S(S),
    .R(R),
    .Q(Q)
  );

  initial begin
    $dumpfile("sr_latch.vcd");
    $dumpvars(1);

    S = 1'b0;
    R = 1'b0;

    #10 S = 1'b1;
    #10 S = 1'b0;
    #10 R = 1'b1;
    #10 R = 1'b0;

    #10 $finish;
  end

initial begin
     $monitor ("Time = %0d, S = %b, R = %b, Q = %b", $time, S, R, Q);
end

endmodule

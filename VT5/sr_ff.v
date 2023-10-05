module sr_flip_flop (
  input s,
  input r,
  input clk,
  output reg q,
  output reg q_bar
);

  always @(posedge clk) begin
    if (s && !r)
      q <= 1'b1;
    else if (!s && r)
      q <= 1'b0;

    q_bar <= ~q;
  end

endmodule

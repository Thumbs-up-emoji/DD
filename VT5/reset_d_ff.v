module d_flip_flop (
    input d,
    input clk,
    input reset_n,
    output reg q
);

always @(posedge clk or negedge reset_n)
begin
    if (!reset_n)
        q <= 0;
    else
        q <= d;
end

endmodule

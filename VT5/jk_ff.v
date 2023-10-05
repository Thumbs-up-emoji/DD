module jk_flip_flop (
    input j,
    input k,
    input clk,
    output reg q
);

always @(posedge clk)
begin
    if (j && !k)
        q <= 1;
    else if (!j && k)
        q <= 0;
    else if (j && k)
        q <= ~q;
end

endmodule

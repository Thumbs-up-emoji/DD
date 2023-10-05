module master_slave_jk_flip_flop (
    input j,
    input k,
    input clk,
    output reg q
);

reg q_internal;

always @(posedge clk)
begin
    if (j && ~k)
        q_internal <= 1; // Set Q
    else if (~j && k)
        q_internal <= 0; // Reset Q
    else if (j && k)
        q_internal <= ~q_internal; // Toggle Q
end

always @(negedge clk)
begin
    q <= q_internal; // Slave latch
end

endmodule

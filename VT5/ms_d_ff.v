module master_slave_d_flip_flop (
    input d,
    input clk,
    output reg q
);

reg q_internal;

always @(posedge clk)
begin
    q_internal <= d; // Master latch
end

always @(negedge clk)
begin
    q <= q_internal; // Slave latch
end

endmodule

module ripple_counter (
    input wire clk,
    input wire reset,
    output reg [1:0] count_out
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        count_out[0] <= 1'b0;
    end else begin
        count_out[0] <= ~count_out[0];
    end
end

always @(negedge count_out[0] or posedge reset) begin
    if (reset) begin
        count_out[1] <= 1'b0;
    end else begin
        count_out[1] <= ~count_out[1];
    end
end

endmodule

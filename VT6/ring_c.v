module ring_counter (
    input wire clk,
    input wire reset,
    output reg [3:0] count_out
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        count_out <= 4'b0001;
    end else begin
        count_out <= {count_out[2:0], count_out[3]};
    end
end

endmodule

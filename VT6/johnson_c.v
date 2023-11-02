module twisted_johnson_counter (
    input wire clk,
    input wire reset,
    output reg [3:0] count_out
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        count_out <= 4'b0000;
    end else begin
        count_out <= {~count_out[0], count_out[3:1]};
    end
end

endmodule

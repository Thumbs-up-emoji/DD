    module serial_adder (
    input wire clk,
    input wire reset,
    input wire load,
    input wire a_in,
    input wire b_in,
    output reg [3:0] sum_out
);

reg carry;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        sum_out <= 4'b0000;
        carry <= 1'b0;
    end else if (load) begin
        {carry, sum_out} <= a_in + b_in + carry;
    end
end

endmodule

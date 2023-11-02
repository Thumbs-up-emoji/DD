module up_down_counter (
    input wire clk,
    input wire reset,
    input wire load,
    input wire up_down,
    input wire [3:0] data_in,
    output reg [3:0] count_out
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        count_out <= 4'b0000;
    end 
    else if (load) begin
        count_out <= data_in;
    end 
    else if (up_down) begin
        count_out <= count_out + 1;
    end 
    else begin
        count_out <= count_out - 1;
    end
end

endmodule

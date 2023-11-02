module up_down_bcd_counter (
    input wire clk,
    input wire reset,
    input wire load,
    input wire up_down,
    input wire [3:0] data_in,
    output reg [3:0] count_out
);

reg [3:0] next_count;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        count_out <= 4'b0000;
    end 
    else if (load) begin
        count_out <= data_in;
    end 
    else begin
        count_out <= next_count;
    end
end

always @* begin
    if (up_down) begin // Up count
        if (count_out == 4'b1001)
            next_count = 4'b0000;
        else
            next_count = count_out + 1;
    end 
    else begin // Down count
        if (count_out == 4'b0000)
            next_count = 4'b1001;
        else
            next_count = count_out - 1;
    end
end

endmodule

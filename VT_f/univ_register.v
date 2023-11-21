module universal_shift_register (
    input wire clk,
    input wire reset,
    input wire [1:0] mode,
    input wire data_in,
    output reg [3:0] data_out
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        data_out <= 4'b0000;
    end 
    else begin
        case (mode)
            2'b00: data_out <= {data_out[2:0], data_in}; // Shift left
            2'b01: data_out <= {data_in, data_out[3:1]}; // Shift right
            2'b10: data_out <= data_in; // Parallel load
            default: ; // Hold state
        endcase
    end
end

endmodule

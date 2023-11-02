module parallel_load_register (
    input wire clk,
    input wire reset_n, // Active low reset
    input wire load,
    input wire [3:0] data_in,
    output reg [3:0] data_out
);

always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin // If reset is low (active)
        data_out <= 4'b0000; // Clear the register
    end 
    else if (load) begin
        data_out <= data_in; // Load the input into the register
    end
end

endmodule

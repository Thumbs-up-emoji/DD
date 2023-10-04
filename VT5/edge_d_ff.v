module ff (input clk, input en, input d, output reg q);

always@(posedge clk,en) begin
    q<=d;
end
endmodule

module ff (input clk, input en, input d, output reg q); //enabler not actually necessary, since we have clk

always@(posedge clk,en) begin
    q<=d;
end
endmodule

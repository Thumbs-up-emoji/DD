module counter10(input clk,input rst,output y);
    reg [3:0] count;
    always@(negedge clk,rst) begin
        if(rst)
            count = 4'd9;
        else begin
            if(count == 4'd0)
                count = 4'd9;
            else 
                count = count - 4'd1;
        end
    end 
    assign y = count[3] && count[0];
endmodule
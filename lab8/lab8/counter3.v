module counter3 (input clk,input rst,output y);

reg [1:0] count;
always@(negedge clk,rst)begin
    if(rst)
        count = 2'd0;
    else begin
        if(count == 2'd2)
            count = 2'd0;
        else 
            count = count + 2'd1;
    end
end

assign y = count[1];
endmodule
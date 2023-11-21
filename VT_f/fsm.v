module check(input[2:0] in,output reg out);
    always @* begin
        if(in == 3'b011 || in == 3'b101) out <= 1'b1;
        else out <= 1'b0;
    end
endmodule
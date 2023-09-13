module func (out,A,B);
output out;
input A,B;

assign out=(A&&(!B))||((!A)&&B);

endmodule

module t_func ;

wire t_out; //outputs
reg t_A, t_B; //inputs
parameter stop_time = 50;

func F1 (t_out, t_A, t_B); //instantiate circuit, name F1

initial #stop_time $finish;
    initial begin //stimulus generator
    $dumpfile("out.vcd");
    $dumpvars(0,t_func);
    t_A=0; t_B=0;
    #10 t_A=0; t_B=1;
    #10 t_A=1; t_B=0;
    #10 t_A=1; t_B=1;
    end

initial begin
    $monitor("time = %0d A = %b B = %b OUT = %b", $time,t_A,t_B,t_out);
end

endmodule


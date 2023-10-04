module D_l(Q,D,En);
output Q;
input D, En;
reg Q;
always@(En,D)
	if(En)Q<=D;
endmodule

module D_latch_tb;

  reg D, En;
  wire Q;

  D_l D_l_inst(Q,D,En);

  initial begin
    $dumpfile("D_latch.vcd");
    $dumpvars(1);

    D = 1'b0;
    En = 1'b0;

    #10 D = 1'b1; En = 1'b1;
    #10 D = 1'b0; En = 1'b1;
    #10 D = 1'b1; En = 1'b0;
    #10 D = 1'b0; En = 1'b0;

    #10 $finish;
  end

  // Monitor the outputs at every time step
  initial begin
    $monitor ("Time = %0d, D = %b, En = %b, Q = %b", $time, D, En, Q);
  end

endmodule
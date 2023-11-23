`include "full_adder.v"
module bit4_adder(input [3:0]A,input  [3:0]B,input C0,output  [3:0]S, output C1);
    wire C1,C2,C3;
    full_adder fa1 (A[0],B[0],Cin,S[0],C1);
    full_adder fa2 (A[1],B[1],C1,S[1],C2);
    full_adder fa3 (A[2],B[2],C2,S[2],C3);
    full_adder fa4 (A[3],B[3],C3,S[3],Cout);

endmodule
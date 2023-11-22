module JK_FF(input wire clk, input wire reset, input wire J, input wire K, output wire Q);
    reg Q_int;
    assign Q = Q_int;
    always @(posedge clk or posedge reset) begin
        if (reset) Q_int <= 0;
        else if (J && !K) Q_int <= 1;
        else if (!J && K) Q_int <= 0;
        else if (J && K) Q_int <= ~Q_int;
    end
endmodule

module seq_circuit(input wire clk, input wire reset, input wire E, input wire F, output wire [1:0] state);
    wire J_A, K_A, J_B, K_B;
    wire [1:0] Q;

    assign state = Q;
    assign J_A = E && ((F && Q == 2'b00) || (!F && Q == 2'b11));
    assign K_A = E && ((F && Q == 2'b11) || (!F && Q == 2'b01));
    assign J_B = E && ((F && Q == 2'b00) || (!F && Q == 2'b10));
    assign K_B = E && ((F && Q == 2'b01) || (!F && Q == 2'b00));

    JK_FF ff_a(.clk(clk), .reset(reset), .J(J_A), .K(K_A), .Q(Q[0]));
    JK_FF ff_b(.clk(clk), .reset(reset), .J(J_B), .K(K_B), .Q(Q[1]));
endmodule

module tb_seq_circuit;
    reg clk;
    reg reset;
    reg E;
    reg F;
    wire [1:0] state;

    // Instantiate the seq_circuit
    seq_circuit u1(.clk(clk), .reset(reset), .E(E), .F(F), .state(state));

    initial begin
        // Initialize inputs
        clk = 0;
        reset = 1;
        E = 0;
        F = 0;

        // Apply inputs
        #10 reset = 0; E = 1; F = 1;  // E = 1, F = 1
        #40 E = 1; F = 0;  // E = 1, F = 0
        #40 E = 0;  // E = 0

        // End the simulation
        #10 $finish;
    end

    // Generate clock
    always #5 clk = ~clk;
endmodule

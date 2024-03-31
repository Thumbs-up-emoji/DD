// JK flip-flop module
module jkff(clk, reset, j, k, q);
input clk,reset,j,k; // Inputs: clock, reset, J and K inputs for the flip-flop
output reg q; // Output: Q output of the flip-flop
always@(posedge clk or reset) // On the rising edge of the clock or reset
begin
    if(reset) // If reset is high
    begin
        q <= 1'b0; // Set Q to 0
    end
    else // If reset is not high
    begin
        if(j == 1'b0 && k == 1'b1) q <= 1'b0; // If J is 0 and K is 1, set Q to 0
        if(j == 1'b1 && k == 1'b0) q <= 1'b1; // If J is 1 and K is 0, set Q to 1
        if(j == 1'b1 && k == 1'b1) q <= !q; // If J and K are both 1, toggle Q
    end
end
endmodule

// Finite state machine module
module FSM(reset,start,stop,clear,freeze,clr,count);
input start,stop,reset,clear; // Inputs: start, stop, reset, clear signals
output reg freeze,clr,count; // Outputs: freeze, clear, count signals
reg [1:0] state,nextstate; // State and next state variables
always@(start,stop,clear) // On any change in start, stop, clear signals
begin
    if(start == 1'b1) nextstate <= 2'b01; // If start is high, set next state to 01
    if(stop == 1'b1 && state == 2'b01) nextstate <= 2'b10; // If stop is high and current state is 01, set next state to 10
    if(clear == 1'b1) nextstate <= 2'b00; // If clear is high, set next state to 00
end
always@(nextstate or reset) // On any change in next state or reset
begin
    if(reset) nextstate <= 2'b00; // If reset is high, set next state to 00
    state = nextstate; // Update current state to next state
    case(state) // Depending on the current state
    2'b00: begin
        clr = 1'b1; // Set clear to 1
        freeze = 1'b0; // Set freeze to 0
        count = 1'b1; // Set count to 1
    end
    2'b01: begin
        count = 1'b1; // Set count to 1
        clr = 1'b0; // Set clear to 0
        freeze = 1'b0; // Set freeze to 0
    end
    2'b10: begin
        count = 1'b1; // Set count to 1
        freeze = 1'b1; // Set freeze to 1
        clr = 1'b0; // Set clear to 0
    end
    endcase
end
endmodule

// Stopwatch module
module stopwatch(clk,reset,start,stop,clear,out);
input reset,start,clear,clk,stop; // Inputs: reset, start, clear, clock, stop signals
output [3:0] out; // Output: 4-bit output
wire a,b,c,d; // Wires: a, b, c, d
wire ja,jb,jc,jd,ka,kb,kc,kd; // Wires: ja, jb, jc, jd, ka, kb, kc, kd
FSM fsm(reset,start,stop,clear,freeze,clr,count); // Instantiate FSM module
and (ja,b,c,d,!freeze,!clr); // AND gate for ja
or (ka,ja,clr); // OR gate for ka
and (jb,c,d,!freeze,!clr); // AND gate for jb
or (kb,jb,clr); // OR gate for kb
and (jc,d,!freeze,!clr); // AND gate for jc
or (kc,jc,clr); // OR gate for kc
and (jd,!freeze,!clr); // AND gate for jd
or (kd,jd,clr); // OR gate for kd
jkff A(clk & count,reset,ja,ka,a); // Instantiate JK flip-flop A
jkff B(clk & count,reset,jb,kb,b); // Instantiate JK flip-flop B
jkff C(clk & count,reset,jc,kc,c); // Instantiate JK flip-flop C
jkff D(clk & count,reset,jd,kd,d); // Instantiate JK flip-flop D
and(out[0],d,1'b1); // AND gate for out[0]
and(out[1],c,1'b1); // AND gate for out[1]
and(out[2],b,1'b1); // AND gate for out[2]
and(out[3],a,1'b1); // AND gate for out[3]
endmodule

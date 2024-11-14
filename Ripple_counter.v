`timescale 1ns / 1ps

module RippleCounter_4bit (
    input T,
    input clk,
    input reset,
    input C,
    output [3:0] Q
);
    TFlipFlop T0 (.T(T),.clk(clk),.reset(reset), .Q(Q[0]));

    TFlipFlop T1 (.T(T),.clk(C ? Q[0] : ~Q[0]), .reset(reset), .Q(Q[1]));

    TFlipFlop T2 (.T(T),.clk(C ? Q[1] : ~Q[1]),.reset(reset), .Q(Q[2]));

    TFlipFlop T3 (.T(T),.clk(C ? Q[2] : ~Q[2]), .reset(reset), .Q(Q[3]));

endmodule

module TFlipFlop (
    output reg Q,
    input T,
    input clk,
    input reset
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            Q <= 0;
        else if (T)
            Q <= ~Q;
    end
endmodule


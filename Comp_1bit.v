`timescale 10ns / 1ps
module COMP1(
    input A,
    input B,
    output E,
    output G,
    output L
    );
    assign E=~(A^B);
    assign G=A&(~B);
    assign L=(~A)&B;
endmodule
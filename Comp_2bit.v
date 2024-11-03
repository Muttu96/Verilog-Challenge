`timescale 1ns / 1ps

module COMP2(
    input [1:0] a,
    input [1:0] b,
    output E,
    output G,
    output L
    );
    wire e0, g0, l0; 
    wire e1, g1, l1; 
    wire w0, w1;   
    COMP1 M1(e0, g0, l0, a[0], b[0]);
    COMP1 M2(e1, g1, l1, a[1], b[1]);

    assign E = e0 & e1;                  
    assign w0 = g0 & e1;                 
    assign G = w0 | g1;                  
    assign w1 = e1 & l0;                 
    assign L = w1 | l1;                  
endmodule

module COMP1(
    output e, g, l,
    input a, b
);
    assign e = ~(a ^ b); 
    assign g = a & ~b;   
    assign l = ~a & b;   
endmodule

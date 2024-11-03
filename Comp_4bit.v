`timescale 10ns / 1ps
module COMP_4(
    input [3:0] a,
    input [3:0] b,
    output E,
    output G,
    output L
    );
    wire e0,g0,l0,e1,g1,l1,e2,g2,l2,e3,g3,l3;
    wire w1,w2,w3,w4,w5,w6;
    assign E = (e0&e1&e2&e3);
    assign w1 = (e3&g2);
    assign w2 = (e3&e2&g1);
    assign w3 = (e3&e2&e1&g0);
    assign G = (g3|w1|w2|w3);
    assign w4 = (e3&l2);
    assign w5 = (e3&e2&l1);
    assign w6 = (e3&e2&e1&l0);
    assign L = (l3|w4|w5|w6);
    COMP1 M1(e0,g0,l0,a[0],b[0]);
    COMP1 M2(e1,g1,l1,a[1],b[1]);
    COMP1 M3(e2,g2,l2,a[2],b[2]);
    COMP1 M4(e3,g3,l3,a[3],b[3]);
endmodule

module COMP1(e,g,l,a,b);
input a,b;
output e,g,l;
assign e=~(a^b);
assign g=a&(~b);
assign l=(~a)&b;
endmodule 
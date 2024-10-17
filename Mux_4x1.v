`timescale 1ns / 1ps


module Mux2(
    input [3:0] x,
    input [1:0] s,
    output y
    );
    wire [6:0] w;
    not G1(w[0],s[0]);
    not G2(w[1],s[1]);
    and G3(w[2],w[1],w[0],x[0]);
    and G4(w[3],w[1],s[0],x[1]);
    and G5(w[4],s[1],w[0],x[2]);
    and G6(w[5],s[1],s[0],x[3]);
    or  G7(y,w[5], w[4], w[3], w[2]);
endmodule

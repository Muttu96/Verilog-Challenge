`timescale 1ns / 1ps

module mux_8x1(output Y, input [7:0] I, input [2:0] S);

  wire Y1, Y2;

  Mux4x1 M1(.y(Y1), .x(I[3:0]), .s(S[1:0]));
  Mux4x1 M2(.y(Y2), .x(I[7:4]), .s(S[1:0]));
  Mux2x1 M3(.y(Y), .x0(Y1), .x1(Y2), .s(S[2]));

endmodule

module Mux2x1(
    input x0,
    input x1,
    input s,
    output y
    );

 assign y = (s) ? x1 : x0;

endmodule

module Mux4x1(
    input [3:0] x,
    input [1:0] s,
    output y
    );
    wire [5:0] w;
    not G1(w[0], s[0]);
    not G2(w[1], s[1]);
    and G3(w[2], w[1], w[0], x[0]);
    and G4(w[3], w[1], s[0], x[1]);
    and G5(w[4], s[1], w[0], x[2]);
    and G6(w[5], s[1], s[0], x[3]);
    or  G7(y, w[5], w[4], w[3], w[2]);
endmodule

`timescale 1ns / 1ps


module Mux_16X1(
    input [15:0] I,
    input [3:0] S,
    output Y
    );
    
    wire [3:0] w;
    
    Mux4x1 M1( .Y(w[0]), .S(S[1:0]), .D(I[3:0]));
    Mux4x1 M2( .Y(w[1]), .S(S[1:0]), .D(I[7:4]));
    Mux4x1 M3( .Y(w[2]), .S(S[1:0]), .D(I[11:8]));
    Mux4x1 M4( .Y(w[3]), .S(S[1:0]), .D(I[15:12]));
    Mux4x1 M5( .Y(Y), .S(S[3:2]), .D(w[3:0]));
    
endmodule

module Mux4x1 (
    input [3:0] D,
    input [1:0] S,  
    output  Y   
);

    assign Y = (S[1] == 0 && S[0] == 0) ? D[0] :
               (S[1] == 0 && S[0] == 1) ? D[1] :
               (S[1] == 1 && S[0]== 0) ? D[2] :
               (S[1] == 1 && S[0] == 1) ? D[3] : 0;

endmodule

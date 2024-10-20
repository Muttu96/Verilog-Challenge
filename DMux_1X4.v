`timescale 10ns / 1ps


module DMux_1X4(
    input A,
    input [1:0] S,
    output [3:0] Y
    );
    
assign Y[0] = (~S[1] & ~S[0] & A) ;
assign Y[1] = (~S[1] &  S[0] & A) ;
assign Y[2] = ( S[1] & ~S[0] & A) ;
assign Y[3] = ( S[1] &  S[0] & A) ;
       
endmodule

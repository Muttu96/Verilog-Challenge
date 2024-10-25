`timescale 1ns / 1ps

module Encoder_4X2(
    input [3:0] X,
    output [1:0] Y
    );
    
    assign Y[0]=X[1]| X[3];
    assign Y[1]=X[2]| X[3];
    
endmodule

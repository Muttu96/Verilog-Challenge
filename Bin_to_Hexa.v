`timescale 1ns / 1ps

module Bin_to_Hexa(
    input [3:0] X,
    output [15:0] Y
    );
    wire W;
    not (W,X[3]);
    Decoder_3X8 M1(.x(X[2:0]), .E(X[3]), .y(Y[7:0])); 
    Decoder_3X8 M2(.x(X[2:0]), .E(W), .y(Y[15:8])); 
endmodule


module Decoder_3X8(
    input [2:0] x,
    input E,
    output [7:0] y
    );
   
    assign y[0]=(~E)&(~x[2])&(~x[1])&(~x[0]);
    assign y[1]=(~E)&(~x[2])&(~x[1])& x[0];
    assign y[2]=(~E)&(~x[2])& x[1]&(~x[0]);
    assign y[3]=(~E)&(~x[2])& x[1]& x[0];
    assign y[4]=(~E)& x[2]&(~x[1])&(~x[0]);
    assign y[5]=(~E)& x[2]&(~x[1])& x[0];
    assign y[6]=(~E)& x[2]& x[1]&(~x[0]);
    assign y[7]=(~E)& x[2]& x[1]& x[0];
    
endmodule
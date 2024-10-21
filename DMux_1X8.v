`timescale 1ns / 1ps

module DMux_1X8(
    input A,
    input [2:0] S,
    output [7:0] Y
    );
    
    assign Y[0]=A&~S[2]&~S[1]&~S[0];
    assign Y[1]=A&~S[2]&~S[1]&S[0];
    assign Y[2]=A&~S[2]&S[1]&~S[0];
    assign Y[3]=A&~S[2]&S[1]&S[0];
    assign Y[4]=A&S[2]&~S[1]&~S[0];
    assign Y[5]=A&S[2]&~S[1]&S[0];
    assign Y[6]=A&S[2]&S[1]&~S[0];
    assign Y[7]=A&S[2]&S[1]&S[0];
    
endmodule

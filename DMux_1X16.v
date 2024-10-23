`timescale 1ns / 1ps


module DMux_1X16(
    input A,
    input [3:0] S,
    output [15:0] Y
    );


wire W1, W2;

DMux_1X2 M1(.A(A), .S(S[3]), .Y0(W1), .Y1(W2));
DMux_1X8 M2(.A(W1), .S(S[2:0]), .Y(Y[7:0]));
DMux_1X8 M3(.A(W2), .S(S[2:0]), .Y(Y[15:8]));

endmodule

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


module DMux_1X2(
    input A,
    input S,
    output  Y0, Y1
    );
    
    assign Y0 = ~S&A,
           Y1 = S&A;  
endmodule


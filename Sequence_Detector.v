`timescale 1ns / 1ps


module Sequence_Detector(
    input X,
    input clk,
    input rst,
    output Y
    );
    wire J1,J0, K1, K0, Q0, Q1;
    
    assign J0 = X;
    assign J1 = X & Q0;
    assign K1 = ~X;
    assign K0 = ~(Q1 & X);
    assign Y = Q0 & Q1;
    
   JK_FF FF0(.J(J0), .K(K0), .clk(clk), .rst(rst), .Q(Q0)); 
   JK_FF FF1(.J(J1), .K(K1), .clk(clk), .rst(rst), .Q(Q1)); 
    
endmodule

module JK_FF(
    input J,
    input K,
    input clk,
    input rst,
    output reg Q
    );
    
    initial begin 
    Q=1'b0;
    end
    
    always@(posedge clk or posedge rst)
    begin 
    if (rst)
    Q<=1'b0;
    else if (J==1'b0 && K==1'b0)
    Q<=Q;
    else if (J==1'b0 && K==1'b1)
    Q=1'b0;
    else if (J==1'b1 && K==1'b0)
    Q=1'b1;
    else
    Q=~Q;
    end
endmodule


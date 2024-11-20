`timescale 1ns / 1ps

module Mealy(
    input X,
    input clk,
    input rst,
    output Y
    );
    wire DA, DB, QA, QB;
    
    assign DA = (QA & QB) | (~QB & X) | (QA & X);
    assign DB = (QA & ~X) | (~QB & X) | (QA & QB);
    assign Y = (QA&QB&X);
    
    D_FF FF1(.clk(clk), .rst(rst), .D(DA), .Q(QA));
    D_FF FF2(.clk(clk), .rst(rst), .D(DB), .Q(QB));
    
    
endmodule

module D_FF(
    input clk,
    input D,
    input rst,
    output reg Q
    );

    always @ (posedge clk or posedge rst)
    begin
        if (rst)
            Q <= 0; 
        else
            Q <= D;
    end
endmodule
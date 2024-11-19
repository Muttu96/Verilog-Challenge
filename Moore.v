`timescale 1ns / 1ps

module Moore(
    input X,
    input clk,
    input rst,
    output Y
    );
    wire DA, DB, QA, QB;
    
    assign DA = (QA&X) | (QB&X);
    assign DB = (QA&X) | (~QB&X);
    D_FF FF1(.clk(clk), .rst(rst), .D(DA), .Q(QA));
    D_FF FF2(.clk(clk), .rst(rst), .D(DB), .Q(QB));
    assign Y = QA&QB;
    
endmodule

module D_FF(
    input clk,
    input D,
    input rst,
    output reg Q
    );
    
    initial begin
    Q=1;
    end 
    
    always @ (posedge clk or posedge rst )
    begin
    if(rst)
    Q<=0;
    else
    Q<=D;
    end
endmodule
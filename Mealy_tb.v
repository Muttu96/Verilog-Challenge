`timescale 1ns / 1ps


module Mealy_tb;

    reg X;
    reg clk;
    reg rst;
    wire Y;
    wire QA, QB;

    Mealy uut (
        .X(X),
        .clk(clk),
        .rst(rst),
        .Y(Y)
    );

    assign QA = uut.QA;
    assign QB = uut.QB;

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

 initial begin
    X = 0;
    rst = 1;
    #10 rst = 0;
    #10 X = 1; 
    #10 X = 0;
    #10 X = 1;
    #10 X = 0;
    #10 X = 1;
    #10 rst = 1; 
    #10 rst = 0;
    #10 X = 0;
    #10 X = 1;
    #10 X = 0;
    #10 X = 1;
    #10 X = 0;
    #10 $stop;
end

endmodule

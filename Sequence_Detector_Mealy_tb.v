`timescale 1ns / 1ps

module Sequence_Detector_tb;

    reg X;
    reg clk;
    reg rst;
    wire Y;

    Sequence_Detector uut (.X(X), .clk(clk), .rst(rst), .Y(Y));

    initial begin
        clk = 1'b0;  
        forever #5 clk = ~clk; 
    end

    
    initial begin
        rst = 1;
        X = 0;
       #5; rst = 0;
    end

   
    initial begin
        #15  X = 1; 
        #10 X = 1;
        #10 X = 0;
        #10 X = 1;
        #10 X = 0;
        #10 X = 1;
        #10 X = 0;
        #10 X = 1;
        #10 X = 1;
        #10 X = 0;
        #10 X = 1;
        #10 X = 1;
        #10 X = 1;
        #10 X = 0;
        #10 X = 1;
        #10 X = 0;
        #10 X = 1;
        #10 X = 1;
        #10 X = 1;
        #10 X = 0;
        #10;
        $finish;
    end

    // Debugging outputs
    initial begin
        $monitor("Time: %0t | X: %b | Y: %b | rst: %b | clk: %b", $time, X, Y, rst, clk);
    end

endmodule

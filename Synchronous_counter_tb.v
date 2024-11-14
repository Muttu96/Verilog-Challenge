`timescale 1ns / 1ps

module Synchronous_Up_Down_Counter_tb;
    reg clk;
    reg reset;
    reg UP_DOWN;
    wire [3:0] Q;

    Synchronous_Up_Down_Counter uut ( .clk(clk), .reset(reset), .UP_DOWN(UP_DOWN), .Q(Q) );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        
        reset = 1;
        UP_DOWN = 1;
        #5 reset = 0;
        #150 UP_DOWN = 0;
        
        reset = 1;
        UP_DOWN = 0;
        #5 reset = 0;
        #160 UP_DOWN = 1;
        $finish;
    end
endmodule

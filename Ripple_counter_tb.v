`timescale 1ns / 1ps

module RippleCounter_4bit_tb();
    reg T;
    reg clk;
    reg reset;
    reg C;
    wire [3:0] Q;

    RippleCounter_4bit uut ( .T(T),.clk(clk),.reset(reset), .C(C), .Q(Q) );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
     end
    
    initial begin
        reset = 1; T = 1;  C = 1;
        #5 reset = 0;
        #150;
   
        reset = 1;  T = 1; C = 0;
        #5 reset = 0;
        #160 $finish;
    end  
endmodule


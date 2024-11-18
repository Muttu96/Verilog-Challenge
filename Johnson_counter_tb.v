`timescale 1ns / 1ps

module Johnson_Counter_tb;
    reg clk;
    reg reset;
    wire [3:0] q;

    Johnson_Counter uut (.clk(clk), .reset(reset), .q(q)  );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
       
    end

    initial begin
     reset = 1;
        #5 reset = 0;
        #150 $finish;
    end
endmodule


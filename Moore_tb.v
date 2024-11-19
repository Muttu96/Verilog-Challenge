`timescale 1ns / 1ps

module Moore_tb;

    reg X, clk, rst;
    wire Y;
    Moore uut (.X(X), .clk(clk), .rst(rst), .Y(Y));
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1;
        X = 0;
        #10 rst = 0;
        #10 X = 1;
        #10 X = 1;
        #10 X = 0;
        #10 X = 1;
        #10 X = 1;
        #10 X = 1;
        #10 X = 0;
        #10 X = 1;
        #10 X = 1;
        #10 X = 1;
        #10 $stop;
    end
endmodule

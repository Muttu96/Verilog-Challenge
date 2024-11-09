`timescale 1ns / 1ps

module SIPO_tb();
    reg clk;
    reg SI;
    wire [3:0] Q;

    SIPO uut (
        .clk(clk),
        .SI(SI),
        .Q(Q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        SI = 0;
        @(posedge clk) SI = 1;
        @(posedge clk) SI = 0;
        @(posedge clk) SI = 1;
        @(posedge clk) SI = 1;
        @(posedge clk) SI = 0;
        @(posedge clk) SI = 1;
        @(posedge clk) SI = 1;
        
        #40 $stop;
    end

endmodule

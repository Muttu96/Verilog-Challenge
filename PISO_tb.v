`timescale 1ns / 1ps

module PISO_tb;
    reg [3:0] A;
    reg clk;
    reg S_L;
    wire S_O;

    PISO uut (
        .A(A),
        .clk(clk),
        .S_L(S_L),
        .S_O(S_O)
    );

    initial begin
        clk = 1;
        forever #5 clk = ~clk;
    end

    initial begin
       
        
        A = 4'b0101;
        S_L = 0; #10;
        
        @(posedge clk) S_L = 1; #10;
        @(posedge clk) S_L = 1; #10;
        @(posedge clk) S_L = 1; #10;
        @(posedge clk) S_L = 1; #10;
        
        A = 4'b0110;
        S_L = 0; #10;
        
        @(posedge clk) S_L = 1; #10;
        @(posedge clk) S_L = 1; #10;
        @(posedge clk) S_L = 1; #10;
        @(posedge clk) S_L = 1; #10;
        $finish;
    end
endmodule

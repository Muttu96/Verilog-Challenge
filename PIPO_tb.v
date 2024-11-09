`timescale 1ns / 1ps


module PIPO_tb( );
    reg clk;
    reg [3:0] D;
    wire [3:0] Q;

    PIPO uut (
        .clk(clk),
        .D(D),
        .Q(Q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        D = 4'b0000;
        @(posedge clk); D = 4'b1010;
        @(posedge clk); D = 4'b1111;
        @(posedge clk); D = 4'b0011;
        @(posedge clk); D = 4'b0101;
        @(posedge clk); D = 4'b0110;
        @(posedge clk); D = 4'b1001;
        @(posedge clk); D = 4'b1100;
        @(posedge clk); D = 4'b0101;
        #40 $finish;
    end

endmodule

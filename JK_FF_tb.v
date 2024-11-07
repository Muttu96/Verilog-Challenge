`timescale 1ns / 1ps
module JK_FF_tb();
reg J;
reg K;
reg clk;
wire Q;
wire Qb;

JK_FF uut(.J(J), .K(K), .clk(clk), .Q(Q), .Qb(Qb));

initial begin 
clk=1'b0; 
forever #5 clk=~clk;
end

initial begin
J=1; K=1; #10;
J=0; K=1; #10;
J=1; K=0; #10;
J=0; K=0; #10;
J=1; K=0; #10;
J=0; K=1; #10;
J=0; K=1; #10;

$finish;
end

endmodule

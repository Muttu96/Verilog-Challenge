`timescale 10ns / 1ps

module T_FF_tb();
reg clk;
reg T;
wire Q;
wire Qb;

T_FF uut(.clk(clk), .T(T), .Q(Q), .Qb(Qb));
initial begin
clk = 0;
forever #5 clk=~clk;
end
initial begin
T=1; #10
T=0; #10
T=0; #10
T=1; #10
T=1; #10
T=0; #10
T=1; #10
T=0; #10;
$finish;
end
endmodule
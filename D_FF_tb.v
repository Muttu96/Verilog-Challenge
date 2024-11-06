`timescale 10ns / 1ps
module D_FF_tb();
reg clk;
reg D;
wire Q;
D_FF UUT(.clk(clk), .D(D), .Q(Q));
initial begin
clk = 0;
forever #5 clk=~clk;
end
initial begin
D=1; #10
D=0; #10
D=1; #10
D=0; #10
D=1; #10
D=0; #10
D=1; #10
D=1;#10; 
$finish; 
end
endmodule
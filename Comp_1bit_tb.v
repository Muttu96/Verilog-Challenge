`timescale 10ns / 1ps
module COMP1_tb();
reg A,B;
wire E,G,L;
COMP1 dut(.A(A), .B(B),.E(E), .G(G), .L(L));

initial begin
A=1'b0; B=1'b0;
#10 A=1'b0; B=1'b1;
#10 A=1'b1; B=1'b0;
#10 A=1'b1; B=1'b1;
$finish;

end
endmodule
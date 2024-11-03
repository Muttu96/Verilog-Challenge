`timescale 10ns / 1ps
module COMP_4_tb();
reg [3:0]a,b;
wire E,G,L;
COMP_4 dut (.a(a), .b(b), .E(E), .G(G), .L(L));
initial begin
$monitor("Time: %0t | a: %b, b: %b | E: %b, G: %b, L: %b", $time, a, b, E, G, L);
a=4'b0000; b=4'b0000;
#10 a = 4'b0011; b = 4'b1001;
#10 a = 4'b1101; b = 4'b0101; 
#10 a = 4'b0110; b = 4'b0110; 
#10 a = 4'b0100; b = 4'b1010;
#10 a = 4'b1011; b = 4'b0011;
#10 a = 4'b1111; b = 4'b0111; 
#10 a = 4'b0001; b = 4'b0110; 
#10 a = 4'b1110; b = 4'b0100;
#10 a = 4'b0010; b = 4'b0010;
#10 a = 4'b0011; b = 4'b1000; 
#10 a = 4'b1001; b = 4'b0010; 
#10 a = 4'b0101; b = 4'b0101; 
#10 a = 4'b0010; b = 4'b1011; 
#10 a = 4'b1100; b = 4'b0011; 
#10 a = 4'b1111; b = 4'b1111; 


$finish;
end
endmodule
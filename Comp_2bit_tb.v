`timescale 10ns / 1ps
module COMP2_tb;
    reg [1:0] a, b;
    wire E, G, L;
 COMP2 uut (.a(a), .b(b), .E(E), .G(G), .L(L));

initial begin
$monitor("Time: %0t | a: %b, b: %b | E: %b, G: %b, L: %b", $time, a, b, E, G, L);
a = 2'b00; b = 2'b00; #10;
a = 2'b01; b = 2'b11; #10;
a = 2'b10; b = 2'b10; #10;
a = 2'b11; b = 2'b01; #10;
a = 2'b00; b = 2'b10; #10;
a = 2'b01; b = 2'b10; #10;
a = 2'b10; b = 2'b00; #10;
a = 2'b11; b = 2'b11; #10;
a = 2'b00; b = 2'b01; #10;
a = 2'b01; b = 2'b01; #10;
a = 2'b10; b = 2'b11; #10;

$finish;
end
endmodule
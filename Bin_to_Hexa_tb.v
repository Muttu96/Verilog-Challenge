`timescale 1ns / 1ps

module Bin_to_Hexa_tb();
reg [3:0] X;
wire [15:0] Y;

Bin_to_Hexa uut(.X(X), .Y(Y));

initial begin
X=4'B0000; #10;
X=4'B0001; #10;
X=4'B0010; #10;
X=4'B0011; #10;
X=4'B0100; #10;
X=4'B0101; #10;
X=4'B0110; #10;
X=4'B0111; #10;
X=4'B1000; #10;
X=4'B1001; #10;
X=4'B1010; #10;
X=4'B1011; #10;
X=4'B1100; #10;
X=4'B1101; #10;
X=4'B1110; #10;
X=4'B1111; #10;
$finish;

end

endmodule

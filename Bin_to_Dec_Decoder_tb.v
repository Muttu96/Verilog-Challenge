`timescale 1ns / 1ps

module Bin_to_Dec_Decoder_tb( );

reg [3:0] A;
reg C;
wire [9:0] B;

Bin_to_Dec_Decoder uut(.A(A), .C(C), .B(B));
initial begin
C=1'b1; A=4'b0; #10;
C=1'b0;
A=4'b0000; #10;
A=4'b0001; #10;
A=4'b0010; #10;
A=4'b0011; #10;
A=4'b0100; #10;
A=4'b0101; #10;
A=4'b0110; #10;
A=4'b0111; #10;
A=4'b1000; #10;
A=4'b1001; #10;
A=4'b1010; #10;
A=4'b1011; #10;
A=4'b1100; #10;
A=4'b1101; #10;
A=4'b1110; #10;
A=4'b1111; #10;

$finish;

end
endmodule

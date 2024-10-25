`timescale 1ns / 1ps

module Encoder_4X2_tb( );

reg [3:0] X;
wire [1:0] Y;

Encoder_4X2 uut(.X(X), .Y(Y));

initial begin
X=4'b0001; #10;
X=4'b0010; #10;
X=4'b0100; #10;
X=4'b1000; #10;


end
endmodule

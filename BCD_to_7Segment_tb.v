`timescale 1ns / 1ps


module BCD_to_7Segment_tb( );
reg E;
reg [3:0] B;
wire [6:0] S;

BCD_to_7Segment uut(.E(E), .B(B), .S(S));

initial begin
E=1'b0; B=4'b0000; #10;
E=1'b1;
B=4'b0000; #10;
B=4'b0001; #10;
B=4'b0010; #10;
B=4'b0011; #10;
B=4'b0100; #10;
B=4'b0101; #10;
B=4'b0110; #10;
B=4'b0111; #10;
B=4'b1000; #10;
B=4'b1001; #10;
$finish;
end
endmodule

`timescale 10ns / 1ps


module DeMux_1X2_tb();
reg A;
reg S;
wire  Y0, Y1;

DeMux_1X2 uut(.A(A), .S(S), .Y0(Y0), .Y1(Y1));

initial begin
A=1'b0;
S=1'b0;
#10;
A=1'b1;
S=1'b0;
#10;
A=1'b0;
S=1'b1;
#10;
A=1'b1;
S=1'b1;
#10;
end
endmodule

`timescale 10ns / 1ps

module DMux_1X4_tb();

reg A;
reg [1:0]S;
wire [3:0]Y;

DMux_1X4 uut(.A(A), .S(S), .Y(Y));

initial begin 
    A = 1'b0; S = 2'b00; #10;
    A = 1'b1; S = 2'b00; #10;
    A = 1'b0; S = 2'b01; #10;
    A = 1'b1; S = 2'b01; #10;
    A = 1'b0; S = 2'b10; #10;
    A = 1'b1; S = 2'b10; #10;
    A = 1'b0; S = 2'b11; #10;
    A = 1'b1; S = 2'b11; #10;
end

endmodule

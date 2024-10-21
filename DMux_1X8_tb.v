`timescale 1ns / 1ps

module DMux_1X8_tb();
reg A;
reg [2:0]S;
wire [7:0]Y;

DMux_1X8  uut(.A(A), .S(S), .Y(Y));

initial begin 
    A = 1'b0; S = 3'b000; #10;
    A = 1'b1; S = 3'b000; #10;
    A = 1'b0; S = 3'b001; #10;
    A = 1'b1; S = 3'b001; #10;
    A = 1'b0; S = 3'b010; #10;
    A = 1'b1; S = 3'b010; #10;
    A = 1'b0; S = 3'b011; #10;
    A = 1'b1; S = 3'b011; #10;
    A = 1'b0; S = 3'b100; #10;
    A = 1'b1; S = 3'b100; #10;
    A = 1'b0; S = 3'b101; #10;
    A = 1'b1; S = 3'b101; #10;
    A = 1'b0; S = 3'b110; #10;
    A = 1'b1; S = 3'b110; #10;
    A = 1'b0; S = 3'b111; #10;
    A = 1'b1; S = 3'b111; #10;

end


endmodule

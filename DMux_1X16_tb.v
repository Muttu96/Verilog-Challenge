`timescale 1ns / 1ps

module DMux_1X16_tb();
reg A;
reg [3:0]S;
wire [15:0]Y;

DMux_1X16 uut(.A(A), .S(S), .Y(Y));

initial begin

   $monitor("At time %0t: A = %b, S = %b, Y = %b", $time, A, S, Y);

   
        A = 1'b0; S = 4'b0010; #10; A = 1'b1; S = 4'b0010; #10;
        A = 1'b0; S = 4'b0011; #10; A = 1'b1; S = 4'b0011; #10;
        A = 1'b0; S = 4'b0100; #10; A = 1'b1; S = 4'b0100; #10;
        A = 1'b0; S = 4'b0101; #10; A = 1'b1; S = 4'b0101; #10;
        A = 1'b0; S = 4'b0110; #10; A = 1'b1; S = 4'b0110; #10;
 
        A = 1'b0; S = 4'b1011; #10; A = 1'b1; S = 4'b1011; #10;
        A = 1'b0; S = 4'b1100; #10; A = 1'b1; S = 4'b1100; #10;
        A = 1'b0; S = 4'b1101; #10; A = 1'b1; S = 4'b1101; #10;
        A = 1'b0; S = 4'b1110; #10; A = 1'b1; S = 4'b1110; #10;
        A = 1'b0; S = 4'b1111; #10; A = 1'b1; S = 4'b1111; #10;
        
        $stop;
end
endmodule

`timescale 1ns / 1ps

module P_E_8X3_tb();
reg [7:0] X;
reg E;
wire [2:0] Y;

P_E_8X3 uut(.X(X), .Y(Y), .E(E));

initial begin 

E=1'b1; X=8'bxxxxxxxx; #10;
E=1'b0; X=8'b00000000; #10;
E=1'b0; X=8'b00000001; #10;
E=1'b0; X=8'b00000010; #10;
E=1'b0; X=8'b00000100; #10;
E=1'b0; X=8'b00001010; #10;
E=1'b0; X=8'b00010001; #10;
E=1'b0; X=8'b00101010; #10;
E=1'b0; X=8'b01010010; #10;
E=1'b0; X=8'b10110010; #10;
E=1'b0; X=8'b00010111; #10;
E=1'b0; X=8'b11010010; #10;
E=1'b0; X=8'b11111111; #10;

$finish;

end

endmodule

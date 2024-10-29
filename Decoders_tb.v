`timescale 1ns / 1ps


module Decoders_tb;

    reg [1:0] Z;
    reg [3:0] X;
    wire [15:0] Y;

    Decoders dut (
        .Z(Z),
        .X(X),
        .Y(Y)
    );

    initial begin
        Z = 2'b00; X = 4'b0000; #10;
        Z = 2'b00; X = 4'b0001; #10;
        Z = 2'b00; X = 4'b0010; #10;
        Z = 2'b00; X = 4'b0011; #10;

        Z = 2'b01; X = 4'b0000; #10;
        Z = 2'b01; X = 4'b0001; #10;
        Z = 2'b01; X = 4'b0010; #10;
        Z = 2'b01; X = 4'b0011; #10;
        Z = 2'b01; X = 4'b0100; #10;
        Z = 2'b01; X = 4'b0101; #10;
        Z = 2'b01; X = 4'b0110; #10;
        Z = 2'b01; X = 4'b0111; #10;

        Z = 2'b10; X = 4'b0000; #10;
        Z = 2'b10; X = 4'b0001; #10;
        Z = 2'b10; X = 4'b0010; #10;
        Z = 2'b10; X = 4'b0011; #10;
        Z = 2'b10; X = 4'b0100; #10;
        Z = 2'b10; X = 4'b0101; #10;
        Z = 2'b10; X = 4'b0110; #10;
        Z = 2'b10; X = 4'b0111; #10;
        Z = 2'b10; X = 4'b1000; #10;
        Z = 2'b10; X = 4'b1001; #10;
        Z = 2'b10; X = 4'b1010; #10;
        Z = 2'b10; X = 4'b1011; #10;
        Z = 2'b10; X = 4'b1100; #10;
        Z = 2'b10; X = 4'b1101; #10;
        Z = 2'b10; X = 4'b1110; #10;
        Z = 2'b10; X = 4'b1111; #10;

        Z = 2'b11; X = 4'b0000; #10;

        $finish;
    end

endmodule
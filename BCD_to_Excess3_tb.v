`timescale 1ns / 1ps

module BCD_to_Ex3_tb;

    reg [3:0] A;
    wire [3:0] Y;

    BCD_to_Ex3 uut (.A(A),.Y(Y));

    initial begin
        for (A = 0; A < 10; A = A + 1) begin
            #10;
        end

        A = 4'd10; #10;
        A = 4'd11; #10;
        A = 4'd12; #10;
        A = 4'd13; #10;
        A = 4'd14; #10;
        A = 4'd15; #10;

        $finish;
    end


endmodule

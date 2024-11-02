`timescale 1ns / 1ps


module EX3_to_BCD_tb();

    reg [3:0] E;
    wire [3:0] B;

    EX3_to_BCD uut (.E(E),.B(B));

        initial begin
        E = 4'b0000; #10;
        E = 4'b0001; #10;
        E = 4'b0010; #10;
        E = 4'b0011; #10;
        E = 4'b0100; #10;
        E = 4'b0101; #10;
        E = 4'b0110; #10;
        E = 4'b0111; #10;
        E = 4'b1000; #10;
        E = 4'b1001; #10;
        E = 4'b1010; #10;
        E = 4'b1011; #10;
        E = 4'b1100; #10;
        E = 4'b1101; #10;
        E = 4'b1110; #10;
        E = 4'b1111; #10;
        $finish;
    end


endmodule

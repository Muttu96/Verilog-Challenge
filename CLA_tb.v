`timescale 1ns / 1ps


module tb_CLA;

    reg [3:0] a;
    reg [3:0] b;
    reg c0;
    wire [3:0] s;
    wire c4;

    CLA uut (.a(a), .b(b), .c0(c0), .s(s), .c4(c4));

    initial begin
        $monitor("time=%0t | a=%b b=%b c0=%b | s=%b c4=%b", $time, a, b, c0, s, c4);

        a = 4'b0001; b = 4'b0010; c0 = 0;
        #10;  a = 4'b1100; b = 4'b1010; c0 = 1;
        #10;  a = 4'b1111; b = 4'b1111; c0 = 0;
        #10;  a = 4'b0011; b = 4'b0110; c0 = 1;
        #10;  a = 4'b0000; b = 4'b0000; c0 = 0;
        #10;
        $finish;
    end

endmodule


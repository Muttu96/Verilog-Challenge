`timescale 1ns / 1ps

module Encoder_8X3_tb;
    
    reg [7:0] X;
    wire [2:0] Y;
    
    Encoder_8X3 uut (
        .X(X),
        .Y(Y)
    );
    
    initial begin
        $display("Time\tX\t\tY");
        $monitor("%g\t%b\t%b", $time, X, Y);
        
        X = 8'b00000001; #10;
        X = 8'b00000010; #10;
        X = 8'b00000100; #10;
        X = 8'b00001000; #10;
        X = 8'b00010000; #10;
        X = 8'b00100000; #10;
        X = 8'b01000000; #10;
        X = 8'b10000000; #10;
        
        $finish;
    end

endmodule

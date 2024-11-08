`timescale 1ns / 1ps

module SISO_Register_tb;
    reg clk;
    reg serial_in;
    wire serial_out;

    SISO_Register uut (
        .clk(clk),
        .serial_in(serial_in),
        .serial_out(serial_out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 1;
        #10; serial_in = 1;
        #10; serial_in = 0;
        #10; serial_in = 1;
        #10; serial_in = 0;
        #10; serial_in = 1;
        #10; serial_in = 0;
        #10; serial_in = 1;
        #10; serial_in = 0;
        #10; serial_in = 1;
        #10; serial_in = 0;
        
        #40;
        
       $finish;
    end
endmodule

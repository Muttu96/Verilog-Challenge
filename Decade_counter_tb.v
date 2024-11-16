`timescale 1ns / 1ps

module Decade_counter_4bit_tb;
    reg CLK;
    reg RESET;
    wire [3:0] Q;

    Decade_counter_4bit uut (.CLK(CLK), .RESET(RESET), .Q(Q) );

    initial begin
        RESET = 1;
        CLK = 0;
        forever #5 CLK = ~CLK;
    end

    initial begin
        #5 RESET = 0; #100;
        $finish;
    end

endmodule

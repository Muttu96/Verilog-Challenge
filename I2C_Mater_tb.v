`timescale 1ns / 1ps

module I2C_Master_tb;
    reg clk;
    reg reset;
    reg [7:0] data_in;
    wire scl;
    wire sda;

    I2C_Master uut (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .scl(scl),
        .sda(sda)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1;
        data_in = 8'h00; 
        #20;
        reset = 0;
        #10;
        data_in = 8'hA5; 
        #10;
        data_in = 8'h5A;
        #10;
        data_in = 8'hAA;
        #10;
         reset = 0;
        #10;
        data_in = 8'h55; 
        #10;
        data_in = 8'h3A;
        #10;
        data_in = 8'hCC;
        #10;
         reset = 0;
        #10;
        data_in = 8'hBD; 
        #10;
        data_in = 8'hDD;
        #10;
        data_in = 8'h95;
        #100;
        $stop;
    end
endmodule
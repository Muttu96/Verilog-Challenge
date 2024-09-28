`timescale 1ns / 1ps


module Mux2_tb();
reg  [3:0] x;
reg  [1:0] s;
wire y;

Mux2 uut(.x(x), .s(s), .y(y));
 initial begin 
 x = 4'b1010;
 s = 2'b00; 
 #100; s = 2'b01; 
 #100; s = 2'b10; 
 #100; s = 2'b11; 
 #100; s = 2'b01; 
 #100; s = 2'b11; 
 #100; s = 2'b10; 
 #100; s = 2'b01; 
 #100;
 
 end
endmodule

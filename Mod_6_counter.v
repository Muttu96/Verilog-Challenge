`timescale 1ns / 1ps

module Mod_6_counter(
input CLK,
input RESET,
output reg [3:0] Q
    );
    
    always @(posedge CLK or posedge RESET)
    begin
    if(RESET)
       Q<=4'b0000;
    else if(Q>=4'b0110)
       Q<=4'b0000;
    else
       Q=Q+1;    
    end
endmodule

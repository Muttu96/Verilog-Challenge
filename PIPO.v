`timescale 1ns / 1ps


module PIPO(
    input wire clk,
    input wire [3:0] D,    
    output reg [3:0] Q     
);
    initial Q[3:0]=1'b0;
    always @(posedge clk) begin
        Q <= D;  
    end
endmodule

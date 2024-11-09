`timescale 1ns / 1ps

module SIPO(
    input SI,
    input clk,
    output [3:0] Q
    );
    
    D_FF dff0 (.clk(clk), .D(SI),    .Q(Q[0]));
    D_FF dff1 (.clk(clk), .D(Q[0]), .Q(Q[1])); 
    D_FF dff2 (.clk(clk), .D(Q[1]), .Q(Q[2])); 
    D_FF dff3 (.clk(clk), .D(Q[2]), .Q(Q[3]));
    
endmodule

module D_FF(
    input D,
    input clk,
    output reg Q);
    
   always@(posedge clk)
   begin
   Q<=D;
   end
   endmodule
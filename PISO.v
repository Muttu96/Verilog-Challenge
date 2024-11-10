`timescale 1ns / 1ps

module PISO (
    input [3:0]A,
    input clk,
    input S_L,
    output wire S_O
);
    wire Q0, Q1, Q2;
    wire D1, D2, D3;
    
    
    assign D1 = (~S_L & A[1]) | (S_L & Q0);
    assign D2 = (~S_L & A[2]) | (S_L & Q1);
    assign D3 = (~S_L & A[3]) | (S_L & Q2);

    D_FF FF0 (.clk(clk), .D(A[0]), .Q(Q0));
    D_FF FF1 (.clk(clk), .D(D1), .Q(Q1));
    D_FF FF2 (.clk(clk), .D(D2), .Q(Q2));
    D_FF FF3 (.clk(clk), .D(D3), .Q(S_O));

    
endmodule

module D_FF (
    input wire clk,
    input wire D,
    output reg Q
);
    always @(posedge clk) begin
        Q <= D;
    end
endmodule

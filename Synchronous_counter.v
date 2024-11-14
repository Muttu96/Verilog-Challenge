`timescale 1ns / 1ps

module Synchronous_Up_Down_Counter (
    input clk,
    input reset,
    input UP_DOWN,
    output reg [3:0] Q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            Q <= 4'b0000;
            else if (UP_DOWN)
                Q <= Q + 1;
            else
                Q <= Q - 1;
        end
endmodule

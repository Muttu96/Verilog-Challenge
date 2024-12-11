`timescale 1ns / 1ps

module Dual_port_register_file (
    input clk,
    input reset,
    input we,
    input [4:0] ra1, ra2,
    input [4:0] wa,
    input [31:0] wd,
    output [31:0] rd1, rd2
);
    reg [31:0] regs [31:0];

    assign rd1 = regs[ra1];
    assign rd2 = regs[ra2];
    integer i;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            for (i = 0; i < 32; i = i + 1) begin
                regs[i] <= 32'b0;
            end
        end else if (we) begin
            regs[wa] <= wd;
        end
    end
endmodule


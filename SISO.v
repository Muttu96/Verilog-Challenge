`timescale 1ns / 1ps

module SISO_Register(
    input clk,
    input serial_in,
    output serial_out
);
    wire q1, q2, q3;

    D_FF ff1 (.clk(clk), .d(serial_in), .q(q1));
    D_FF ff2 (.clk(clk), .d(q1), .q(q2));
    D_FF ff3 (.clk(clk), .d(q2), .q(q3));
    D_FF ff4 (.clk(clk), .d(q3), .q(serial_out));
    
endmodule

module D_FF(
    input clk,
    input d,
    output reg q
);

    always @(posedge clk) begin

            q <= d;
    end
endmodule

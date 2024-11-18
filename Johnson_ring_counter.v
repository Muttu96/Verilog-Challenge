`timescale 1ns / 1ps

module Johnson_Counter (
    input clk,
    input reset,
    output [3:0] q
);
    wire d0, d1, d2, d3;

    assign d3 = ~q[0];
    assign d2 = q[3];
    assign d1 = q[2];
    assign d0 = q[1];

    D_FF ff0 (.clk(clk), .reset(reset), .d(d3), .q(q[3]));
    D_FF ff1 (.clk(clk), .reset(reset), .d(d2), .q(q[2]));
    D_FF ff2 (.clk(clk), .reset(reset), .d(d1), .q(q[1]));
    D_FF ff3 (.clk(clk), .reset(reset), .d(d0), .q(q[0]));
endmodule

module D_FF (
    input clk,
    input reset,
    input d,
    output reg q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule
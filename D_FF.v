`timescale 10ns / 1ps
module D_FF(
    input clk,
    input D,
    output reg Q
    );
    initial begin
    Q=0;
    end
    always @ (posedge clk)
    begin
    Q<=D;
    end
endmodule
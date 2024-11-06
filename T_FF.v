`timescale 10ns / 1ps

module T_FF(
    input clk,
    input T,
    output reg Q,
    output Qb
    );
    assign Qb=~Q;
    
    initial begin
    Q=0;
    end
    
    always @ (posedge clk)
    begin
    Q<=!T;
    end
endmodule
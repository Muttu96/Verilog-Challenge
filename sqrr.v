`timescale 1ns / 1ps


module sqrr(
    input a0,a1,a2,
    output y0,y1,y2,y3,y4,y5
    );
    assign y0 = a0;
    assign y1 = 1'b0;
    assign y2 = (!a0&a1);
    assign y3 = ((a2^a1)&a0);
    assign y4 = ((!a1|a0)&a2);
    assign y5 = (a2&a1);
endmodule

`timescale 10ns / 1ps

module AOI(y,a,b,c,d);
    input a;
    input b;
    input c;
    input d;
    output y;
    wire w1;
    wire w2;
    and g1(w1,a,b);
    and g2(w2,c,d);
    nor g3(y,w1,w2);   
endmodule

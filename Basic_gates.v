`timescale 10ns / 1ps

module Basic_gates(
    input x,
    input y,
    output a,b,c,d,e,f,g,h
    );
and(a,x,y);
or(b,x,y);
not(c,x);
not(d,y);
nand(e,x,y);
nor(f,x,y);
xor(g,x,y);
xnor(h,x,y);


endmodule

`timescale 1ns / 1ps

module Mux1(
    input x0,
    input x1,
    input s,
    output y
    );
    
    wire w;
not G(w,s);
bufif1 B1(y,x0,w);
bufif1 B2(y,x1,s);

endmodule

`timescale 1ns / 1ps

module multiplier_2bit(
    input a0,a1,
    input b0,b1,
    output c0,c1,c2,c3
    );
    wire w0,w1,w2,w3;
    
    assign c0= a0& b0;
    assign w0= a0& b1;
    assign w1= a1& b0;
    assign w2= a1& b1; 
    Half_Adder ha1(.s(c1), .c(w3), .b(w1), .a(w0));
    Half_Adder ha2(.s(c2), .c(c3), .a(w3), .b(w2));
endmodule

module Half_Adder(
    input a,
    input b,
    output s,
    output c
    );
    
assign s = (a^b);
assign c = (a&b);

endmodule
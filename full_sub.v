`timescale 1ns / 1ps

module full_sub(
    input x,
    input y,
    input z,
    output d,
    output b
    );
    
half_sub Hs1(.x(x), .y(y), .d(d1), .b(b1));
half_sub Hs2(.x(d1), .y(z), .d(d), .b(b2));   
or G1(b,b1,b2); 

endmodule

module half_sub(
    input x,
    input y,
    output d,
    output b
    );
    
assign d = (x^y);
assign b = ((!x)&y);

endmodule
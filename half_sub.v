`timescale 10ns / 1ps



module half_sub(
    input x,
    input y,
    output d,
    output b
    );
    
assign d = (x^y);
assign b = ((!x)&y);

endmodule

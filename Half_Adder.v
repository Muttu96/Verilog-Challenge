`timescale 10ns / 1ps

module Half_Adder(
    input a,
    input b,
    output s,
    output c
    );
    
assign s = (a^b);
assign c = (a&b);

endmodule

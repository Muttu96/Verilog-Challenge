`timescale 10ns / 1ps

module DeMux_1X2(
    input A,
    input S,
    output  Y0, Y1
    );
    
    assign Y0 = ~S&A,
           Y1 = S&A;  
endmodule

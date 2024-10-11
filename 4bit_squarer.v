`timescale 1ns / 1ps

module squarer(
    input [3:0] a, 
    output [7:0] square 
);

assign square = a * a; 

endmodule
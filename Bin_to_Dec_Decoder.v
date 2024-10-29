`timescale 1ns / 1ps

module Bin_to_Dec_Decoder(
    input [3:0] A,
    output reg [9:0] B,
    input C
    );
    
    always @(*) begin
    B=1'd0;
 
    if (C==1'b0) begin
    case(A)
    4'b0000: B=10'b0000000001;
    4'b0001: B=10'b0000000010;
    4'b0010: B=10'b0000000100;
    4'b0011: B=10'b0000001000;
    4'b0100: B=10'b0000010000;
    4'b0101: B=10'b0000100000;
    4'b0110: B=10'b0001000000;
    4'b0111: B=10'b0010000000;
    4'b1000: B=10'b0100000000;
    4'b1001: B=10'b1000000000;
    endcase
    
    end
    end
endmodule

`timescale 1ns / 1ps

module BCD_to_7Segment(
    input [3:0] B,
    input E,
    output reg [6:0] S
    );
  
    always @(*) begin
    if (E==1'b0)
    S=7'b0;
    else begin
    case(B)
    4'b0000: S=7'b0111111;
    4'b0001: S=7'b0000110;
    4'b0010: S=7'b1011011;
    4'b0011: S=7'b1001111;
    4'b0100: S=7'b1100110;
    4'b0101: S=7'b1101101;
    4'b0110: S=7'b1111101;
    4'b0111: S=7'b1000111;
    4'b1000: S=7'b1111111;
    4'b1001: S=7'b1100111;
    default: S=7'b0000000;
    endcase
    end
    end 
    
endmodule

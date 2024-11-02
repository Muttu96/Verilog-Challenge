`timescale 1ns / 1ps

module BCD_to_Ex3 (
    input  [3:0] A,
    output reg [3:0] Y
);

    reg [3:0] LUT [9:0];

    initial begin
        LUT[0] = 4'b0011; 
        LUT[1] = 4'b0100; 
        LUT[2] = 4'b0101; 
        LUT[3] = 4'b0110; 
        LUT[4] = 4'b0111; 
        LUT[5] = 4'b1000; 
        LUT[6] = 4'b1001; 
        LUT[7] = 4'b1010; 
        LUT[8] = 4'b1011; 
        LUT[9] = 4'b1100; 
    end

    always @(*) begin
        if (A < 4'd10) 
            Y = LUT[A]; 
        else
            Y = 4'b0000; 
    end

endmodule

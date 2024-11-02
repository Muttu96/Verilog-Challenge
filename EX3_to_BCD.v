`timescale 1ns / 1ps

module EX3_to_BCD(
    input  [3:0] E,
    output reg [3:0] B
);

    reg [3:0] LUT [9:0];

    initial begin
        LUT[0] = 4'b0000; 
        LUT[1] = 4'b0001; 
        LUT[2] = 4'b0010; 
        LUT[3] = 4'b0011; 
        LUT[4] = 4'b0100; 
        LUT[5] = 4'b0101; 
        LUT[6] = 4'b0110; 
        LUT[7] = 4'b0111; 
        LUT[8] = 4'b1000; 
        LUT[9] = 4'b1001; 
    end

    always @(*) begin
        if (E >= 4'b0011 && E <= 4'b1100) 
            B = LUT[E - 4'b0011]; 
        else 
            B = 4'b0000; 
    end

endmodule

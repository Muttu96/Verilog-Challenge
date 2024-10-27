`timescale 1ns / 1ps

module P_E_8X3(
    input [7:0] X,
    input E,
    output reg [2:0] Y
    );

    always @(*) begin
        if (!E) begin
            if (X[7])
                Y = 3'b111;
            else if (X[6])
                Y = 3'b110;
            else if (X[5])
                Y = 3'b101;
            else if (X[4])
                Y = 3'b100;
            else if (X[3])
                Y = 3'b011;
            else if (X[2])
                Y = 3'b010;
            else if (X[1])
                Y = 3'b001;
            else if (X[0])
                Y = 3'b000;
            else
                Y = 3'b000;
        end
        else begin
            Y = 3'b000;
        end
    end
endmodule

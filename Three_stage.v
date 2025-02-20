`timescale 1ns / 1ps

module pipeline_arithmetic (
    input clk, reset,
    input [7:0] A, B, 
    input [1:0] op_select, 
    output reg [15:0] result 
);

    reg [7:0] A_reg, B_reg;
    reg [1:0] op_reg;
    
    reg [15:0] intermediate_result;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            A_reg <= 0;
            B_reg <= 0;
            op_reg <= 0;
            intermediate_result <= 0;
            result <= 0;
        end
        else begin
            A_reg <= A;
            B_reg <= B;
            op_reg <= op_select;

            case (op_reg)
                2'b00: intermediate_result <= A_reg + B_reg; 
                2'b01: intermediate_result <= A_reg - B_reg; 
                2'b10: intermediate_result <= A_reg * B_reg; 
                2'b11: intermediate_result <= (B_reg != 0) ? (A_reg / B_reg) : 16'b0; 
                default: intermediate_result <= 16'b0;
            endcase

            result <= intermediate_result;
        end
    end
endmodule
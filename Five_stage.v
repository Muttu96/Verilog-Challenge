`timescale 1ns / 1ps

module five_stage_pipeline (
    input clk, reset,
    input [31:0] instruction, 
    input [31:0] data_in,    
    output reg [31:0] data_out 
);

    reg [31:0] IF_ID, ID_EX, EX_MEM, MEM_WB;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            IF_ID <= 32'b0;
            ID_EX <= 32'b0;
            EX_MEM <= 32'b0;
            MEM_WB <= 32'b0;
            data_out <= 32'b0;
        end else begin
            IF_ID <= instruction;
            ID_EX <= IF_ID + 1;
            EX_MEM <= ID_EX + 1; 
            MEM_WB <= (EX_MEM == 32'hA) ? data_in : EX_MEM; 
            data_out <= MEM_WB; 
        end
    end
endmodule
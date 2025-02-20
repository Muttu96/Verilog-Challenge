`timescale 1ns / 1ps

module two_stage_pipeline(
    input clk,
    input reset,
    input [31:0] instruction_in,  
    output reg [31:0] result_out  
);

    reg [31:0] IF_ID_instruction; 
    reg [31:0] ID_EX_instruction;  

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            IF_ID_instruction <= 32'b0; 
        end else begin
            IF_ID_instruction <= instruction_in;  
        end
    end

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            ID_EX_instruction <= 32'b0;  
        end else begin
            ID_EX_instruction <= IF_ID_instruction;  
        end
    end

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            result_out <= 32'b0;
        end else begin
            result_out <= ID_EX_instruction[31:16] + ID_EX_instruction[15:0];
        end
    end

endmodule
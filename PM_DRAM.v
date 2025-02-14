`timescale 1ns / 1ps

module page_mode_dram (
    input wire clk,
    input wire cs, 
    input wire we, 
    input wire [3:0] row, 
    input wire [3:0] col, 
    input wire [7:0] data_in, 
    output reg [7:0] data_out 
);

    reg [7:0] memory [15:0][15:0]; 

    always @(posedge clk) begin
        if (cs) begin
            if (we) begin
                memory[row][col] <= data_in; 
            end else begin
                data_out <= memory[row][col]; 
            end
        end
    end

    always @(negedge cs or posedge clk) begin
        if (!cs) begin
            data_out <= 8'h00; 
        end else if (!we) begin
            data_out <= memory[row][col]; 
        end
    end
endmodule

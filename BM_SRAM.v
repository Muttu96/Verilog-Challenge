`timescale 1ns / 1ps

module burst_mode_sram (
    input wire clk,
    input wire cs,
    input wire we,
    input wire [3:0] addr,
    input wire [3:0] burst_len,
    input wire [7:0] data_in,
    output reg [7:0] data_out
);

    reg [7:0] memory [15:0];
    reg [3:0] burst_counter;
    
    initial begin
        data_out = 8'h00;
    end

    always @(posedge clk) begin
        if (cs) begin
            if (we) begin
                for (burst_counter = 0; burst_counter < burst_len; burst_counter = burst_counter + 1) begin
                    memory[addr + burst_counter] <= data_in;
                end
            end else begin
                for (burst_counter = 0; burst_counter < burst_len; burst_counter = burst_counter + 1) begin
                    data_out <= memory[addr + burst_counter];
                end
            end
        end
    end
endmodule

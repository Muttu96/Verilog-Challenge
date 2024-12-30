`timescale 1ns / 1ps

module DRAM(
    input wire clk,               
    input wire we_a,              
    input wire we_b,              
    input wire enable_a,         
    input wire enable_b,         
    input wire refresh_en,      
    input wire [3:0] addr_a, 
    input wire [3:0] addr_b, 
    input wire [15:0] data_in_a, 
    input wire [15:0] data_in_b, 
    output reg [15:0] data_out_a, 
    output reg [15:0] data_out_b  
    );

    reg [15:0] dram [0:15]; 
    reg [3:0] refresh_counter;
    integer i;
    
    initial begin
        for (i = 0; i < 16 ; i = i + 1) begin
            dram[i] = 0;
        end 
        data_out_a = 0;
        data_out_b = 0;
        refresh_counter = 4'b0000;
    end

    always @(posedge clk) begin
        if (we_a) begin
            dram[addr_a] <= data_in_a;
        end
        if (enable_a) begin
            data_out_a <= dram[addr_a];
        end
    end

    always @(posedge clk) begin
        if (we_b) begin
            dram[addr_b] <= data_in_b;
        end
        if (enable_b) begin
            data_out_b <= dram[addr_b];
        end
    end

    always @(posedge clk) begin
        if (refresh_en) begin
            for (i = 0; i < 16; i = i + 1) begin
                dram[i] <= dram[i]; 
            end
            refresh_counter <= refresh_counter + 1;
        end
    end
endmodule

`timescale 1ns / 1ps

module five_stage_pipeline_tb;

    reg clk, reset;
    reg [31:0] instruction, data_in;
    wire [31:0] data_out;

    five_stage_pipeline dut (
        .clk(clk),
        .reset(reset),
        .instruction(instruction),
        .data_in(data_in),
        .data_out(data_out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        instruction = 32'h0;
        data_in = 32'h5;

        #10 reset = 0;

        #10 instruction = 32'h1;
        #10 instruction = 32'h2;
        #10 instruction = 32'h3;
        #10 instruction = 32'h4;
        #10 instruction = 32'hA; 
        #50;

        $stop;
    end
endmodule
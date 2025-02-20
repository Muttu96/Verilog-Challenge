`timescale 1ns / 1ps

module tb_two_stage_pipeline;

    reg clk;
    reg reset;
    reg [31:0] instruction_in;
    wire [31:0] result_out;

    two_stage_pipeline uut (
        .clk(clk),
        .reset(reset),
        .instruction_in(instruction_in),
        .result_out(result_out)
    );

    always begin
        #5 clk = ~clk;  
    end

    initial begin
        clk = 0;
        reset = 0;
        instruction_in = 32'h00000000;

        reset = 1;
        #10 reset = 0;

        instruction_in = 32'h00010002; 
        #10; 

        instruction_in = 32'h00020003;  
        #10;

        instruction_in = 32'h00040004;  
        #10;
   
        instruction_in = 32'h00010002;  
        #10;

        instruction_in = 32'h00020003; 
        #10;

        instruction_in = 32'h00030004;  
        #10;

        instruction_in = 32'h00040005;  
        #10;
  
        instruction_in = 32'hFFFF0001;  
        #10;

        instruction_in = 32'h000100FF;  
        #10;

        instruction_in = 32'h80000001;  
        #10;

        instruction_in = 32'h80010000;  
        #10;

        $finish;
    end

    initial begin
        $monitor("At time %t, result_out = %h", $time, result_out);
    end

endmodule
`timescale 1ns / 1ps

module shift_register_pipeline_operations_tb;

    reg clk, reset;
    reg [7:0] data_in;
    wire [7:0] data_out;

    shift_register_pipeline_operations dut (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .data_out(data_out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        data_in = 8'b00000000;

        #10 reset = 0;

        #10 data_in = 8'b11001100;  
        #10 data_in = 8'b10101010;  
        #10 data_in = 8'b11110000; 
        #10 data_in = 8'b00001111; 

        #50;
        $stop;
    end
endmodule
`timescale 1ns / 1ps

module pipeline_arithmetic_tb;
    reg clk, reset;
    reg [7:0] A, B;
    reg [1:0] op_select;
    wire [15:0] result;

    pipeline_arithmetic dut (
        .clk(clk),
        .reset(reset),
        .A(A),
        .B(B),
        .op_select(op_select),
        .result(result)
    );

    always #5 clk = ~clk;
    initial begin
        clk = 0;
        reset = 1;
        A = 0;
        B = 0;
        op_select = 2'b00;

        #10 reset = 0; 

        #10 A = 8'd5; B = 8'd3; op_select = 2'b00;
        
        #10 A = 8'd10; B = 8'd4; op_select = 2'b01;
        
        #10 A = 8'd12; B = 8'd2; op_select = 2'b10;
        
        #10 A = 8'd8; B = 8'd2; op_select = 2'b11;
        
        #10 A = 8'd15; B = 8'd0; op_select = 2'b11;

        #50;
        $stop;
    end
endmodule
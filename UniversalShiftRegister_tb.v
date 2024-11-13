`timescale 1ns / 1ps

module Universal_Shift_Register_tb();
    reg clk;
    reg reset;
    reg [1:0] select;
    reg [3:0] parallel_in;
    reg shift_left;
    reg shift_right;
    wire [3:0] data_out;
    
    Universal_Shift_Register uut (.clk(clk), .reset(reset), .select(select),.parallel_in(parallel_in),
        .shift_left(shift_left),  .shift_right(shift_right), .data_out(data_out));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        reset = 1; 
        select = 2'b00; 
        parallel_in = 4'b0000; 
        shift_left = 0; 
        shift_right = 0;
        #10 reset = 0; select = 2'b11; parallel_in = 4'b0110;
        #10 select = 2'b00;
        #10 select = 2'b01; shift_right= 1;
        #10 select = 2'b10; shift_left = 1;
        #10 select = 2'b00;
        #10 select = 2'b11; parallel_in = 4'b1100;
        #10 select = 2'b01; shift_right = 0;
        #10 select = 2'b10; shift_left = 0;
        #10 select = 2'b00;
        #10 $finish;
    end
endmodule


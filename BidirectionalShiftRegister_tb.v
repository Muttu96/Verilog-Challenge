`timescale 1ns / 1ps

module BidirectionalShiftRegister_tb;
    reg clk;
    reg reset;
    reg direction;
    reg shift_in;
    wire [3:0] data_out;
    
    BidirectionalShiftRegister uut (.clk(clk),  .reset(reset), .direction(direction), .shift_in(shift_in),  .data_out(data_out));

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        reset = 1;
        direction = 0;
        shift_in = 0;
        
        #10 reset = 0;
        #10 direction = 0; 
        #10 shift_in = 1;
        #10 shift_in = 0;
        #10 shift_in = 0;
        #10 shift_in = 0; 
        #20 reset = 1;
        #10 reset = 0;
        #10 direction = 1; 
        #10 shift_in = 1;
        #10 shift_in = 0;
        #10 shift_in = 0;
        #10 shift_in = 0;
        
        #10 $finish;
    end
endmodule

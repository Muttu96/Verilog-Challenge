`timescale 1ns / 1ps

module Phone_security_system_tb;

reg [15:0] pin_input;
reg clk;
reg reset;
wire access_granted;
wire access_denied;

Phone_security_system uut (
    .pin_input(pin_input),
    .clk(clk),
    .reset(reset),
    .access_granted(access_granted),
    .access_denied(access_denied)
);

initial begin
    clk = 0;
    reset = 0;
    pin_input = 16'b0000_0000_0000_0000;
    
    #5 reset = 1;
    #5 reset = 0;
    
    #5 pin_input = 16'b1000_0110_0100_0010;
    #10 pin_input = 16'b0000_0000_0000_0000;
    
    #10 pin_input = 16'b1000_0110_0100_0010;
    #10 pin_input = 16'b0000_0000_0000_0000;
    
    #10 pin_input = 16'b1000_0100_0011_0001;
    #10 pin_input = 16'b0000_0000_0000_0000;
    
    #10 pin_input = 16'b0011_1000_0100_1001;
    #10 pin_input = 16'b0000_0000_0000_0000;
    
     #10 pin_input = 16'b1011_1100_0100_1001;
     #10 pin_input = 16'b0000_0000_0000_0000;

    #30 pin_input = 16'b1000_0110_0100_0010; 
    #10 pin_input = 16'b0000_0000_0000_0000;  

    reset = 1;
    #10 reset = 0;
    
        pin_input = 16'b1000_0110_0100_0010;
    #10 pin_input = 16'b0000_0000_0000_0000;
    
    #10 $finish;
end

always begin
    #5 clk = ~clk;
end

endmodule
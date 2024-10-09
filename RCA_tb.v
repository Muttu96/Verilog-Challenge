`timescale 10ns / 1ps

module RCA_tb();
reg [3:0]a;
reg [3:0]b;
reg c0;
wire [3:0]s;
wire c4;
 
RCA uut (.a(a), .b(b), .c0(c0), .s(s), .c4(c4));
    
initial begin
$monitor("Time: %0t | a = %b | b = %b | c0 = %b | s = %b | c4 = %b", 
                 $time, a, b, c0, s, c4);
a = 4'b0000; b = 4'b0000; c0 = 1'b0;
#10; a = 4'b0001; b = 4'b0001; c0 = 1'b1;
#10; a = 4'b1011; b = 4'b0101; c0 = 1'b0; 
#10; a = 4'b1111; b = 4'b0001; c0 = 1'b1;
#10; a = 4'b1010; b = 4'b0010; c0 = 1'b0; 
#10; a = 4'b0100; b = 4'b0011; c0 = 1'b1; 
#10; a = 4'b0110; b = 4'b1001; c0 = 1'b1;


$stop;
end

endmodule



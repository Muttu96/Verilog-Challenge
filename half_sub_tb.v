`timescale 10ns / 1ps

module half_sub_tb();

reg x;
reg y;
wire d;
wire b;

half_sub hs(.x(x), .y(y), .d(d), .b(b));
initial begin
x=0; y=0;
#10; x=0; y=1; 
#10; x=1; y=0; 
#10; x=1; y=1; 
end
endmodule

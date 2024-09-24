`timescale 1ns / 1ps

module full_sub_tb();

reg x;
reg y;
reg z;
wire d;
wire b;

full_sub fs(.x(x), .y(y), .z(z), .d(d), .b(b));

initial begin 
x = 0; y = 0; z = 0;
#10; x = 0; y = 0; z = 1;
#10; x = 0; y = 1; z = 0;
#10; x = 0; y = 1; z = 1;
#10; x = 1; y = 0; z = 0;
#10; x = 1; y = 0; z = 1;
#10; x = 1; y = 1; z = 0;
#10; x = 1; y = 1; z = 1;
end
endmodule

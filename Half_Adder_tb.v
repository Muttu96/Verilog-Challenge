`timescale 1ns / 1ps

module Half_Adder_tb();

reg a;
reg b;
wire s;
wire c;

Half_Adder HA(.a(a), .b(b), .s(s), .c(c));

initial begin
a=0; b=0;
#10; a=0; b=1;
#10; a=1; b=0;
#10; a=1; b=1;
end

endmodule

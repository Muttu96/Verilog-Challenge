`timescale 10ns / 1ps



module Basic_gates_tb();

reg x;
reg y;
wire a,b,c,d,e,f,g,h ;

Basic_gates uut(.a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g), .h(h) );
initial begin

x=0; y=0;
#10; x=0; y=1;
#10; x=1; y=0;
#10; x=1; y=1;

end

endmodule

`timescale 1ns / 1ps

module Ring_counter_tb();
reg CLK;
reg RESET;
wire [3:0] Q;

Ring_counter uut(.CLK(CLK), .RESET(RESET), .Q(Q));

initial begin
CLK = 1'b0;
forever #5 CLK = ~CLK;
end

initial begin 
RESET = 1'b1;
#5; RESET = 1'b0;
#110;
$finish;
end
endmodule

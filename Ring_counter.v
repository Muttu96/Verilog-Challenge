`timescale 1ns / 1ps

module Ring_counter(
    input CLK,
    input RESET,
    output reg [3:0] Q
    );
    
    always@(posedge CLK or posedge RESET)
    begin
    if(RESET)
    Q <= 4'b0001;
   else 
    Q <= {Q[2:0], Q[3]};
    end
endmodule

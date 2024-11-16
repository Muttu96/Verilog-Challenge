`timescale 1ns / 1ps

module Decade_counter_4bit(
    input CLK,
    input RESET,
    output [3:0] Q
    );
    
   wire [3:0] T;
   assign T[0] = 1'b1;
   assign T[1] = Q[0];
   assign T[2] = Q[0] & Q[1]; 
   assign T[3] = (Q[0] & Q[1] & Q[2]) ;    
    
   T_FF t1(.CLK(CLK), .T(T[0]), .RESET(RESET), .Q(Q[0])); 
   T_FF t2(.CLK(CLK), .T(T[1]), .RESET(RESET), .Q(Q[1])); 
   T_FF t3(.CLK(CLK), .T(T[2]), .RESET(RESET), .Q(Q[2])); 
   T_FF t4(.CLK(CLK), .T(T[3]), .RESET(RESET), .Q(Q[3])); 
    
endmodule

module T_FF(
    input CLK,
    input T,
    input RESET,
    output reg Q
    );

     always @(posedge CLK or posedge RESET)
    begin
    if (RESET)
            Q <= 0;
        else if (T)
            Q <= ~Q;
            
    end
endmodule
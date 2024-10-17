`timescale 1ns / 1ps


module Mux1_tb();
    reg x0, x1, s; 
    wire y;
    Mux1 uut (.x0(x0), .x1(x1), .s(s), .y(y));

initial begin
      
        $monitor("Time = %0t | x0 = %b, x1 = %b, s = %b => y = %b", $time, x0, x1, s, y);
        
        x0 = 0; x1 = 0; s = 0;
        #10;
        x0 = 0; x1 = 1; s = 0;
        #10;
        x0 = 1; x1 = 0; s = 0;
        #10;
        x0 = 1; x1 = 1; s = 0;
        #10;
        x0 = 0; x1 = 0; s = 1;
        #10;
        x0 = 0; x1 = 1; s = 1;
        #10;
        x0 = 1; x1 = 0; s = 1;
        #10;
        x0 = 1; x1 = 1; s = 1;
        #10;
        $finish;
end

endmodule
`timescale 1ns / 1ps

module multiplier_2bit_tb();
    reg a0, a1;
    reg b0, b1;
    wire c0, c1, c2, c3;
    
    multiplier_2bit uut (.a0(a0), .a1(a1), .b0(b0), .b1(b1), .c0(c0), .c1(c1), .c2(c2), .c3(c3));
    
    initial begin
        $monitor("Time=%0t | a1 a0 = %b%b, b1 b0 = %b%b -> c3 c2 c1 c0 = %b%b%b%b",
                 $time, a1, a0, b1, b0, c3, c2, c1, c0);
        
        a1 = 0; a0 = 0; b1 = 0; b0 = 0; #10;
        a1 = 0; a0 = 0; b1 = 0; b0 = 1; #10;
        a1 = 0; a0 = 0; b1 = 1; b0 = 0; #10;
        a1 = 0; a0 = 0; b1 = 1; b0 = 1; #10;
        
        a1 = 0; a0 = 1; b1 = 0; b0 = 0; #10;
        a1 = 0; a0 = 1; b1 = 0; b0 = 1; #10;
        a1 = 0; a0 = 1; b1 = 1; b0 = 0; #10;
        a1 = 0; a0 = 1; b1 = 1; b0 = 1; #10;
        
        a1 = 1; a0 = 0; b1 = 0; b0 = 0; #10;
        a1 = 1; a0 = 0; b1 = 0; b0 = 1; #10;
        a1 = 1; a0 = 0; b1 = 1; b0 = 0; #10;
        a1 = 1; a0 = 0; b1 = 1; b0 = 1; #10;
        
        a1 = 1; a0 = 1; b1 = 0; b0 = 0; #10;
        a1 = 1; a0 = 1; b1 = 0; b0 = 1; #10;
        a1 = 1; a0 = 1; b1 = 1; b0 = 0; #10;
        a1 = 1; a0 = 1; b1 = 1; b0 = 1; #10;
        
        $finish;
    end

endmodule

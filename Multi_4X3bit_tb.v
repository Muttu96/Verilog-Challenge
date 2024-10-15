`timescale 10ns / 1ps

module Multi_4X3bit_tb();

    reg [2:0] a;      
    reg [3:0] b;    
    wire [6:0] c;    

    Multi_4X3bit uut (.a(a),.b(b),.c(c));

    initial begin
     $monitor("At time %t: a = %b, b = %b, c = %b", $time, a, b, c);
        a = 3'b000; b = 4'b0000;
        #10; a = 3'b001; b = 4'b0010; 
        #10; a = 3'b010; b = 4'b0011; 
        #10; a = 3'b011; b = 4'b0100; 
        #10; a = 3'b100; b = 4'b0011; 
        #10; a = 3'b101; b = 4'b0110; 
        #10; a = 3'b110; b = 4'b0101;
        #10; a = 3'b111; b = 4'b0111;
        #10;
        $finish;  
    end
    

endmodule

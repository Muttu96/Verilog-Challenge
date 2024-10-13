`timescale 10ns / 1ps

module add_sub_tb();

    reg m;                 
    reg [3:0] a, b;       
    wire [3:0] s;         
    wire cout;            
   
    add_sub uut (.m(m), .a(a), .b(b), .s(s), .cout(cout));
    
    initial begin
       
        $monitor("Time=%0d | m=%b | a=%b | b=%b | s=%b | cout=%b", $time, m, a, b, s, cout);
        
     
m = 0; a = 4'b0011; b = 4'b0000; 
#10;

m = 1; a = 4'b1000; b = 4'b0010;
#10;

m = 1; a = 4'b0010; b = 4'b0001; 
#10;

m = 0; a = 4'b1110; b = 4'b0110;
#10;

m = 0; a = 4'b0110; b = 4'b0101;
#10;

m = 1; a = 4'b1010; b = 4'b0111;
#10;

m = 1; a = 4'b0100; b = 4'b0010;
#10;

m = 0; a = 4'b1110; b = 4'b1001;
#10;

m = 1; a = 4'b1111; b = 4'b1010;
#10;

m = 0; a = 4'b1100; b = 4'b1101;
#10

m = 0; a = 4'b1010; b = 4'b1000;
#10;

m = 1; a = 4'b1110; b = 4'b0110;
#10;

m = 0; a = 4'b1011; b = 4'b0111;
#10;

m = 1; a = 4'b1101; b = 4'b1001;
#10;

m = 1; a = 4'b1111; b = 4'b1111;
#10;

      
        $finish;
    end
endmodule

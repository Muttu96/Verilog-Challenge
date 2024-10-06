`timescale 10ns / 1ps

module Full_Adder(
    input a,
    input b,
    input cin,
    output s,
    output cout
    );
    
wire s1,c1,c2;
    
Half_Adder HA1(.a(a), .b(b), .s(s1), .c(c1));
Half_Adder HA2(.a(s1), .b(cin), .s(s), .c(c2));   
or G1(cout,c1,c2); 
    
endmodule
    
module Half_Adder(
    input a,
    input b,
    output s,
    output c
    );
    
assign s = (a^b);
assign c = (a&b);

endmodule



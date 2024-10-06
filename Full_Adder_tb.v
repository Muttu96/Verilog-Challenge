`timescale 10ns / 1ps


module Full_Adder_tb();
reg a,b,cin;
wire s,cout;

Full_Adder FA(.a(a), .b(b), .cin(cin), .s(s), .cout(cout));
initial begin 
a=0; b=0; cin=0;
#10 a=0; b=0; cin=1;
#10 a=0; b=1; cin=0;
#10 a=0; b=1; cin=1;
#10 a=1; b=0; cin=0;
#10 a=1; b=0; cin=1;
#10 a=1; b=1; cin=0;
#10 a=1; b=1; cin=1;
#10 a=1; b=0; cin=0;
#10 a=1; b=0; cin=1;
#10;a=0; b=0; cin=0;
#10 a=0; b=0; cin=1;
#10 a=0; b=1; cin=0;
#10 a=0; b=1; cin=1;
#10 a=1; b=1; cin=0;
#10 a=1; b=1; cin=1;
end
endmodule

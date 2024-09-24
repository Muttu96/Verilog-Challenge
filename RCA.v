`timescale 10ns / 1ps

module RCA(
    input [3:0] a,
    input [3:0] b,
    input c0,
    output [3:0] s,
    output c4
    );
 wire c1,c2,c3;
 
FA FA1(s[0],c1,a[0],b[0],c0);
FA FA2(s[1],c2,a[1],b[1],c1);
FA FA3(s[2],c3,a[2],b[2],c2);
FA FA4(s[3],c4,a[3],b[3],c3);
    
endmodule

module FA(s,c0,x,y,z);
output s,c0;
input x,y,z;

assign s=(x^y^z);
assign c0=((x&y)|(y&z)|(x&z));

endmodule
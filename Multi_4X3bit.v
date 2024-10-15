`timescale 10ns / 1ps



module Multi_4X3bit(
    input [2:0] a,
    input [3:0] b,
    output [6:0] c
    );
    wire [15:0] w;
    wire cin=1'b0;
    and G1(c[0],b[0],a[0]);
    and G2(w[1],b[1],a[0]);
    and G3(w[2],b[2],a[0]);
    and G4(w[3],b[3],a[0]);
    and G5(w[4],b[0],a[1]);
    and G6(w[5],b[1],a[1]);
    and G7(w[6],b[2],a[1]);
    and G8(w[7],b[3],a[1]);
    and G9(w[12],b[0],a[2]);
    and G10(w[13],b[1],a[2]);
    and G11(w[14],b[2],a[2]);
    and G12(w[15],b[3],a[2]);
    
RCA m1(.s({w[10:8],c[1]}), .c4(w[11]), .a({1'b0,w[3:1]}), .b(w[7:4]), .c0(cin)); 
RCA m2(.s(c[5:2]), .c4(c[6]), .a({1'b0,w[10:8]}), .b(w[15:12]), .c0(w[11]));
    
    
endmodule


module RCA(
    input [3:0] a,
    input [3:0] b,
    input c0,
    output [3:0] s,
    output c4
    );
 wire c1,c2,c3;
 
    FA FA1(.s(s[0]), .c0(c1), .x(a[0]), .y(b[0]), .z(c0));
    FA FA2(.s(s[1]), .c0(c2), .x(a[1]), .y(b[1]), .z(c1));
    FA FA3(.s(s[2]), .c0(c3), .x(a[2]), .y(b[2]), .z(c2));
    FA FA4(.s(s[3]), .c0(c4), .x(a[3]), .y(b[3]), .z(c3));
    
endmodule

module FA(s,c0,x,y,z);
output s,c0;
input x,y,z;

assign s=(x^y^z);
assign c0=((x&y)|(y&z)|(x&z));

endmodule

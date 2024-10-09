`timescale 10ns / 1ps

module add_sub(
    input m,                   
    input [3:0] a, b,        
    output [3:0] s,           
    output cout             
    );

    wire [3:0] p, q, r, g;             
    wire cin, coutb, t, l;                  

    xor G1(p[0], b[0], m);
    xor G2(p[1], b[1], m);
    xor G3(p[2], b[2], m);
    xor G4(p[3], b[3], m);
    not G5(t,coutb);
    and G6(l,t,m);
    xor G7(r[0], q[0], l);
    xor G8(r[1], q[1], l);
    xor G9(r[2], q[2], l);
    xor G10(r[3], q[3], l);

    assign g[3:0]=4'b0000;  
    assign cin = m;
    
    RAC RAC1(q, coutb, a, p, cin);
    RAC RAC2(s, cout, r, g, l);
    


endmodule

module RAC(s, cout, a, b, cin);

    output [3:0] s;          
    output cout;             
    input [3:0] a, b;       
    input cin;             

    wire c1, c2, c3;         

    FA FA1(s[0], c1, a[0], b[0], cin);
    FA FA2(s[1], c2, a[1], b[1], c1);
    FA FA3(s[2], c3, a[2], b[2], c2);
    FA FA4(s[3], cout, a[3], b[3], c3);

endmodule

module FA(s, c, x, y, z);

    output s, c;             
    input x, y, z;        

    assign s = x ^ y ^ z;   
    assign c = (x & y) | (y & z) | (x & z);
    
endmodule
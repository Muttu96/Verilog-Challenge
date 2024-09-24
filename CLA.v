`timescale 1ns / 1ps


module CLA(
    input [3:0] a,
    input [3:0] b,
    input c0,
    output [3:0] s,
    output c4
    );
    
    wire [3:0]p,g;
    wire [4:1]c;
    
    assign p[0] = (a[0]^b[0]);
    assign p[1] = (a[1]^b[1]);
    assign p[2] = (a[2]^b[2]);
    assign p[3] = (a[3]^b[3]);
    
    assign g[0] = (a[0]&b[0]);
    assign g[1] = (a[1]&b[1]);
    assign g[2] = (a[2]&b[2]);
    assign g[3] = (a[3]&b[3]);
    
    assign c[1] = (g[0]|(p[0]&c0));
    assign c[2] = (g[1]|(p[1]&g[0])|(p[1]&p[0]&c0));
    assign c[3] = (g[2]|(p[2]&g[1])|(p[2]&p[1]&g[0])|p[2]&p[1]&p[0]&c0);
    assign c4   = (g[3]|(p[3]|g[2])|(p[3]&p[2]&g[1])|(p[3]&p[2]&p[1]&g[0])|(p[3]&p[2]&p[1]&p[0]&c0));

    assign s[0] = (p[0]^c0);
    assign s[1] = (p[1]^c[1]);
    assign s[2] = (p[2]^c[2]);
    assign s[3] = (p[3]^c[3]);
    
endmodule

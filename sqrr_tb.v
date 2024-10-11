`timescale 1ns / 1ps

module sqrr_tb;

reg a0;
reg a1;
reg a2;

wire y0;
wire y1;
wire y2;
wire y3;
wire y4;
wire y5;

sqrr uut (.a0(a0), .a1(a1), .a2(a2), .y0(y0), .y1(y1), .y2(y2), .y3(y3), .y4(y4), .y5(y5));

initial begin

    $monitor("Time=%0t | a0=%b a1=%b a2=%b -> y0=%b y1=%b y2=%b y3=%b y4=%b y5=%b", $time, a0, a1, a2, y0, y1, y2, y3, y4, y5);
  
    a0 = 0; a1 = 0; a2 = 0;
    #10; a0 = 1; a1 = 0; a2 = 0;
    #10; a0 = 0; a1 = 1; a2 = 0;
    #10; a0 = 1; a1 = 1; a2 = 0;
    #10; a0 = 0; a1 = 0; a2 = 1;
    #10; a0 = 1; a1 = 0; a2 = 1;
    #10; a0 = 0; a1 = 1; a2 = 1;
    #10; a0 = 1; a1 = 1; a2 = 1;
   #20;
    $finish;
end

endmodule

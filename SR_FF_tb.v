module SR_FF_tb;

reg S;
reg R;
reg clk;
wire Q;
wire Qn;

SR_FF uut (
    .S(S),
    .R(R),
    .clk(clk),
    .Q(Q),
    .Qn(Qn)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    S = 0; R = 0; #10;
    S = 0; R = 1; #10;
    S = 1; R = 0; #10;
    S = 1; R = 1; #10;
    $stop;
end

endmodule

module SR_FF(
    input S,
    input R,
    input clk,
    output reg Q,
    output Qn
);

assign Qn = ~Q;
initial begin
Q=1'b0;
end

always @(posedge clk) begin
    if (S == 1'b0 && R == 1'b0)
        Q <= Q;
    else if (S == 1'b0 && R == 1'b1)
        Q <= 1'b0;
    else if (S == 1'b1 && R == 1'b0)
        Q <= 1'b1;
    else
        Q <= 1'bx;
end

endmodule

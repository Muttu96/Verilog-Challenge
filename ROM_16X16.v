module ROM_16x16 (
    input [3:0] address,
    output reg [15:0] data
);

reg [15:0] ROM [0:15];

initial begin
    ROM[0] = 16'b0000000000000001;
    ROM[1] = 16'b0000000000000010;
    ROM[2] = 16'b0000000000000100;
    ROM[3] = 16'b0000000000001000;
    ROM[4] = 16'b0000000000010000;
    ROM[5] = 16'b0000000000100000;
    ROM[6] = 16'b0000000001000000;
    ROM[7] = 16'b0000000010000000;
    ROM[8] = 16'b0000000100000000;
    ROM[9] = 16'b0000001000000000;
    ROM[10] = 16'b0000010000000000;
    ROM[11] = 16'b0000100000000000;
    ROM[12] = 16'b0001000000000000;
    ROM[13] = 16'b0010000000000000;
    ROM[14] = 16'b0100000000000000;
    ROM[15] = 16'b1000000000000000;
end

always @(*) begin
    data = ROM[address];
end

endmodule
module ROM_16x16_tb;

reg [3:0] address;
wire [15:0] data;

ROM_16x16 uut (
    .address(address),
    .data(data)
);

initial begin

    address = 4'b0000; #10;
    address = 4'b0001; #10;
    address = 4'b0010; #10;
    address = 4'b0011; #10;
    address = 4'b0100; #10;
    address = 4'b0101; #10;
    address = 4'b0110; #10;
    address = 4'b0111; #10;
    address = 4'b1000; #10;
    address = 4'b1001; #10;
    address = 4'b1010; #10;
    address = 4'b1011; #10;
    address = 4'b1100; #10;
    address = 4'b1101; #10;
    address = 4'b1110; #10;
    address = 4'b1111; #10;

    $finish;
end

endmodule

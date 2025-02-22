module ALU_8bit_tb;
    reg [7:0] a, b;
    reg [4:0] command;
    reg enable;
    wire [15:0] y;

    ALU_8bit uut (
        .a(a),
        .b(b),
        .command(command),
        .enable(enable),
        .y(y)
    );

    initial begin
        $monitor("a=%d b=%d command=%b enable=%b y=%d", a, b, command, enable, y);
        enable = 1;
        a = 8'd15; b = 8'd10; command = 5'b00000; #10;
        a = 8'd25; b = 8'd5; command = 5'b00001; #10;
        a = 8'd7; b = 8'd3; command = 5'b00010; #10;
        a = 8'd40; b = 8'd8; command = 5'b00011; #10;
        a = 8'd12; b = 8'd4; command = 5'b00100; #10;
        a = 8'd18; b = 8'd6; command = 5'b00101; #10;
        a = 8'd22; b = 8'd9; command = 5'b00110; #10;
        a = 8'd30; b = 8'd15; command = 5'b00111; #10;
        a = 8'd9; b = 8'd3; command = 5'b01000; #10;
        a = 8'd10; b = 8'd5; command = 5'b01001; #10;
        a = 8'd5; b = 8'd2; command = 5'b01010; #10;
        a = 8'd8; b = 8'd4; command = 5'b01011; #10;
        a = 8'd20; b = 8'd6; command = 5'b01100; #10;
        a = 8'd14; b = 8'd0; command = 5'b01101; #10;
        a = 8'd16; b = 8'd12; command = 5'b01110; #10;
        a = 8'd11; b = 8'd0; command = 5'b01111; #10;
        a = 8'd19; b = 8'd02; command = 5'b10000; #10;
        a = 8'd13; b = 8'd29; command = 5'b10001; #10;
        a = 8'd17; b = 8'd0; command = 5'b10010; #10;
        a = 8'd21; b = 8'd69; command = 5'b10011; #10;
        a = 8'd29; b = 8'd8; command = 5'b10100; #10;
        a = 8'd23; b = 8'd7; command = 5'b10101; #10;
        a = 8'd27; b = 8'd20; command = 5'b10110; #10;
        a = 8'd31; b = 8'd10; command = 5'b10111; #10;
        enable = 0; #10;
        $finish;
    end
endmodule

`timescale 1ns / 1ps

module alu_tb;
    reg [3:0] a, b;
    reg [3:0] command;
    reg enable;
    wire [7:0] y;

    ALU_4bit uut (
        .a(a),
        .b(b),
        .command(command),
        .enable(enable),
        .y(y)
    );

    reg [31:0] string_cmd;  

    always @(*) begin
        case (command)
            4'b0000: string_cmd = 32'h414444;  // "ADD"
            4'b0001: string_cmd = 32'h535542;  // "SUB"
            4'b0010: string_cmd = 32'h414E44;  // "AND"
            4'b0011: string_cmd = 32'h4F5220;  // "OR"
            4'b0100: string_cmd = 32'h584F52;  // "XOR"
            4'b0101: string_cmd = 32'h4E414E;  // "NAND"
            4'b0110: string_cmd = 32'h4E4F52;  // "NOR"
            4'b0111: string_cmd = 32'h584E52;  // "XNOR"
            4'b1000: string_cmd = 32'h53484C;  // "SHL"
            4'b1001: string_cmd = 32'h534852;  // "SHR"
            4'b1010: string_cmd = 32'h494E43;  // "INC"
            4'b1011: string_cmd = 32'h444543;  // "DEC"
            4'b1100: string_cmd = 32'h425546;  // "BUF"
            4'b1101: string_cmd = 32'h425542;  // "BUB"
            4'b1110: string_cmd = 32'h4E4F54;  // "NOT"
            4'b1111: string_cmd = 32'h4E4F42;  // "NOB"
            default: string_cmd = 32'h3F3F3F;  // "???"
        endcase
    end

    initial begin
        $dumpfile("alu_tb.vcd");
        $dumpvars(0, alu_tb);

        $monitor("Time=%0t | A=%b | B=%b | Command=%h (%s) | Enable=%b | Y=%b", 
                 $time, a, b, command, string_cmd, enable, y);

        enable = 1;

        a = 4'b1010; b = 4'b0101;
        for (command = 4'b0000; command <= 4'b1111; command = command + 1) begin
            #10;
        end

        a = 4'b1111; b = 4'b0001;
        for (command = 4'b0000; command <= 4'b1111; command = command + 1) begin
            #10;
        end

        a = 4'b0110; b = 4'b0011;
        for (command = 4'b0000; command <= 4'b1111; command = command + 1) begin
            #10;
        end

        enable = 0;
        #10;

        $finish;
    end
endmodule

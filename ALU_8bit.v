`timescale 1ns / 1ps

module ALU_8bit(
    input [7:0] a, b,
    input [4:0] command,
    input enable,
    output reg [15:0] y
);

    reg [15:0] out;

    parameter ADD = 5'b00000,
              SUB = 5'b00001,
              MUL = 5'b00010,
              DIV = 5'b00011,
              AND_OP = 5'b00100,
              OR_OP  = 5'b00101,
              XOR_OP = 5'b00110,
              NAND_OP = 5'b00111,
              NOR_OP = 5'b01000,
              XNOR_OP = 5'b01001,
              SHL = 5'b01010,
              SHR = 5'b01011,
              MOD = 5'b01100,
              INC = 5'b01101,
              DEC = 5'b01110,
              NOT_A = 5'b01111,
              NOT_B = 5'b10000,
              BUF_A = 5'b10001,
              BUF_B = 5'b10010,
              CMP = 5'b10011,
              MAX = 5'b10100,
              MIN = 5'b10101,
              ABS_A = 5'b10110,
              ABS_B = 5'b10111;

    always @(*) begin
        case (command)
            ADD: out = a + b;
            SUB: out = a - b;
            MUL: out = a * b;
            DIV: out = (b != 0) ? a / b : 16'hFFFF;
            AND_OP: out = a & b;
            OR_OP: out = a | b;
            XOR_OP: out = a ^ b;
            NAND_OP: out = ~(a & b);
            NOR_OP: out = ~(a | b);
            XNOR_OP: out = ~(a ^ b);
            SHL: out = a << 1;
            SHR: out = a >> 1;
            MOD: out = (b != 0) ? a % b : 16'hFFFF;
            INC: out = a + 1;
            DEC: out = a - 1;
            NOT_A: out = ~a;
            NOT_B: out = ~b;
            BUF_A: out = a;
            BUF_B: out = b;
            CMP: out = (a == b) ? 16'b1 : 16'b0;
            MAX: out = (a > b) ? a : b;
            MIN: out = (a < b) ? a : b;
            ABS_A: out = (a[7] == 1) ? -a : a;
            ABS_B: out = (b[7] == 1) ? -b : b;
            default: out = 16'h0000;
        endcase

        if (enable)
            y = out;
        else 
            y = 16'hZZZZ;
    end

endmodule
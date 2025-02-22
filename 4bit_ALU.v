`timescale 1ns / 1ps

module ALU_4bit(
    input [3:0] a, b,
    input [3:0] command,
    input enable,
    output reg [7:0] y
);

    reg [7:0] out;

    parameter ADD = 4'b0000,
              SUB = 4'b0001,
              AND_OP = 4'b0010,
              OR_OP  = 4'b0011,
              XOR_OP = 4'b0100,
              NAND_OP = 4'b0101,
              NOR_OP = 4'b0110,
              XNOR_OP = 4'b0111,
              SHL = 4'b1000,
              SHR = 4'b1001,
              INC = 4'b1010,
              DEC = 4'b1011,
              BUF_A = 4'b1100,
              BUF_B = 4'b1101,
              NOT_A = 4'b1110,
              NOT_B = 4'b1111;

    always @(*) begin
        case (command)
            ADD: out = a + b;
            SUB: out = a - b;
            AND_OP: out = a & b;
            OR_OP: out = a | b;
            XOR_OP: out = a ^ b;
            NAND_OP: out = ~(a & b);
            NOR_OP: out = ~(a | b);
            XNOR_OP: out = ~(a ^ b);
            SHL: out = a << 1;
            SHR: out = a >> 1;
            INC: out = a + 1;
            DEC: out = a - 1;
            BUF_A: out = a;
            BUF_B: out = b;
            NOT_A: out = ~a;
            NOT_B: out = ~b;
            default: out = 8'h00;
        endcase

        if (enable)
            y = out;
        else 
            y = 8'hZZ;
    end

endmodule
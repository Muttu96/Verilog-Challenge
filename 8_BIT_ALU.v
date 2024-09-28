`timescale 1ns / 1ps


module alu(
    input [7:0] a, b,            // 8-bit inputs a and b
    input [3:0] command,         // 4-bit command input
    input enable,                // Enable signal
    output reg [15:0] y          // 16-bit output
);

    // Widen internal register to 32 bits to avoid truncation
    reg [31:0] out;

    parameter ADD  = 4'b0000, 
              INC  = 4'b0001, 
              SUB  = 4'b0010, 
              DEC  = 4'b0011, 
              MUL  = 4'b0100, 
              DIV  = 4'b0101, 
              SHL  = 4'b0110, 
              SHR  = 4'b0111, 
              AND  = 4'b1000, 
              OR   = 4'b1001, 
              INV  = 4'b1010, 
              NAND = 4'b1011, 
              NOR  = 4'b1100, 
              XOR  = 4'b1101, 
              XNOR = 4'b1110, 
              BUF  = 4'b1111; 

    always @(*) begin
        case (command)
            ADD   : out = a + b;
            INC   : out = a + 1;
            SUB   : out = a - b;
            DEC   : out = a - 1;
            MUL   : out = a * b;         // No truncation; result stored in 32-bit register
            DIV   : out = (b != 0) ? (a / b) : 16'hFFFF; // Handle divide-by-zero
            SHL   : out = a << 1;
            SHR   : out = a >> 1;
            INV   : out = ~a;
            AND   : out = a & b;
            OR    : out = a | b;
            NAND  : out = ~(a & b);
            NOR   : out = ~(a | b);
            XOR   : out = a ^ b;
            XNOR  : out = a ~^ b;
            BUF   : out = a;
            default: out = 16'h0000; // Default case for safety
        endcase

        // Control output based on enable signal
        if (enable) 
            y = out[15:0]; // Truncate to 16 bits for output
        else 
            y = 16'hZZZZ; // High impedance when not enabled
    end

endmodule
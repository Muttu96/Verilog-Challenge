module PLA (
    input wire A,
    input wire B,
    input wire C,
    input wire D,
    output wire F1,
    output wire F2,
    output wire F3,
    output wire F4
);

wire P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16;

assign P1 = A & B & C & D;
assign P2 = A & B & C & ~D;
assign P3 = A & B & ~C & D;
assign P4 = A & B & ~C & ~D;
assign P5 = A & ~B & C & D;
assign P6 = A & ~B & C & ~D;
assign P7 = A & ~B & ~C & D;
assign P8 = A & ~B & ~C & ~D;
assign P9 = ~A & B & C & D;
assign P10 = ~A & B & C & ~D;
assign P11 = ~A & B & ~C & D;
assign P12 = ~A & B & ~C & ~D;
assign P13 = ~A & ~B & C & D;
assign P14 = ~A & ~B & C & ~D;
assign P15 = ~A & ~B & ~C & D;
assign P16 = ~A & ~B & ~C & ~D;

assign F1 = P1 | P2 | P3 | P4;
assign F2 = P5 | P6 | P7 | P8;
assign F3 = P9 | P10 | P11 | P12;
assign F4 = P13 | P14 | P15 | P16;

endmodule

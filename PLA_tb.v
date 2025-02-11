module PLA_tb;

reg A;
reg B;
reg C;
reg D;
wire F1;
wire F2;
wire F3;
wire F4;

integer i;

PLA uut (
    .A(A),
    .B(B),
    .C(C),
    .D(D),
    .F1(F1),
    .F2(F2),
    .F3(F3),
    .F4(F4)
);

initial begin
    A = 0; B = 0; C = 0; D = 0;
    #10 A = 1; B = 0; C = 0; D = 0;
    #10 A = 0; B = 1; C = 0; D = 0;
    #10 A = 0; B = 0; C = 1; D = 0;
    #10 A = 0; B = 0; C = 0; D = 1;
    #10 A = 1; B = 1; C = 0; D = 0;
    #10 A = 0; B = 1; C = 1; D = 0;
    #10 A = 1; B = 0; C = 0; D = 1;
    #10 A = 1; B = 1; C = 1; D = 1;

    // Random test cases
    for (i = 0; i < 16; i = i + 1) begin
        #10 {A, B, C, D} = $random;
    end

    #10 $finish;
end

initial begin
    $monitor("Time = %0d : A = %b, B = %b, C = %b, D = %b -> F1 = %b, F2 = %b, F3 = %b, F4 = %b",
             $time, A, B, C, D, F1, F2, F3, F4);
end

endmodule

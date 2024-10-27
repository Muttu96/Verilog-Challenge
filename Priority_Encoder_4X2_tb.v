module Priority_encoder_4x2_tb();

    reg [3:0] X;
    reg E;
    wire [1:0] Y;

    priority_encoder_4x2 uut (
        .X(X),
        .E(E),
        .Y(Y)
    );

    initial begin

        E = 0; X = 4'b0000; #10;

        E = 0; X = 4'b0001; #10;

        E = 0; X = 4'b0010; #10;

        E = 0; X = 4'b0101; #10;

        E = 0; X = 4'b0101; #10;
     
        E = 0; X = 4'b1010; #10;
      
        E = 0; X = 4'b0110; #10;

        E = 1; X = 4'b1111; #10;
      
      $finish;
      
    end

endmodule

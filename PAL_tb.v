module PAL_tb;
    reg A, B, C, D;       
    wire F1, F2, F3, F4, F5; 

   
    PAL uut (
        .A(A), 
        .B(B), 
        .C(C), 
        .D(D), 
        .F1(F1), 
        .F2(F2), 
        .F3(F3), 
        .F4(F4), 
        .F5(F5)
    );

    initial begin
      
        $display("A B C D | F1 F2 F3 F4 F5");

 
        for (integer i = 0; i < 16; i = i + 1) begin
            {A, B, C, D} = i; 
            #10;            
            $display("%b %b %b %b | %b  %b  %b  %b  %b", A, B, C, D, F1, F2, F3, F4, F5);
        end

        $finish; 
    end
endmodule

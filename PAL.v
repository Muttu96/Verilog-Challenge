module PAL (
    input wire A, B, C, D,   
    output wire F1, F2, F3, F4, F5  
);

    wire P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15;

    assign P1 = A & B;                   
    assign P2 = ~A & ~C & D;            
    assign P3 = A & C & ~D;           
    assign P4 = ~B & C;                    
    assign P5 = B & C & ~D;                
    assign P6 = A & ~B;                    
    assign P7 = B & ~C;                 
    assign P8 = A & C & D;                  
    assign P9 = ~A & B & D;              
    assign P10 = ~A & ~B;                
    assign P11 = ~A & ~D;                
    assign P12 = A & B & C;                
    assign P13 = ~B & ~C;                   
    assign P14 = ~A & D;                 
    assign P15 = A & ~B & ~D;             

    assign F1 = P1 | P2 | P3;              
    assign F2 = P4 | P5 | P6 | P7;        
    assign F3 = P8 | P9 | P10;          
    assign F4 = P11 | P12 | P13;         
    assign F5 = P14 | P15 | P3 | P6;     
endmodule

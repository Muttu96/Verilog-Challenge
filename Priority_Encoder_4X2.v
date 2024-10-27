module priority_encoder_4x2 (
    input [3:0] X,
    input E,
    output reg [1:0] Y
);

always @(*) 
begin
    if (!E) 
    begin
        case (1'b1)
            X[3]: Y = 2'b11;
            X[2]: Y = 2'b10;
            X[1]: Y = 2'b01;
            X[0]: Y = 2'b00;
       
        endcase
    end 
    else 
    begin
        Y = 2'b00;
    end
end

endmodule

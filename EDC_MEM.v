module hamming_encoder (
    input [3:0] data_in,
    output [6:0] encoded_data
);
    assign encoded_data[0] = data_in[0] ^ data_in[1] ^ data_in[3];
    assign encoded_data[1] = data_in[0] ^ data_in[2] ^ data_in[3];
    assign encoded_data[2] = data_in[0];
    assign encoded_data[3] = data_in[1] ^ data_in[2] ^ data_in[3];
    assign encoded_data[4] = data_in[1];
    assign encoded_data[5] = data_in[2];
    assign encoded_data[6] = data_in[3];
endmodule

module hamming_decoder (
    input [6:0] encoded_data,
    output reg [3:0] data_out,
    output reg error_detected
);
    wire [2:0] syndrome;

    assign syndrome[0] = encoded_data[0] ^ encoded_data[2] ^ encoded_data[4] ^ encoded_data[6];
    assign syndrome[1] = encoded_data[1] ^ encoded_data[2] ^ encoded_data[5] ^ encoded_data[6];
    assign syndrome[2] = encoded_data[3] ^ encoded_data[4] ^ encoded_data[5] ^ encoded_data[6];

    always @(*) begin
        error_detected = (syndrome != 3'b000);
        data_out = {encoded_data[6], encoded_data[5], encoded_data[4], encoded_data[2]};

        if (error_detected) begin
            case (syndrome)
                3'b001: data_out[0] = ~data_out[0];
                3'b010: data_out[1] = ~data_out[1];
                3'b011: data_out[2] = ~data_out[2];
                3'b100: data_out[3] = ~data_out[3];
            endcase
        end
    end
endmodule

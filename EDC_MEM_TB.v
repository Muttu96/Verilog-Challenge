module tb_hamming_code;
    reg [3:0] data_in;
    wire [6:0] encoded_data;
    reg [6:0] faulty_data;
    wire [3:0] decoded_data;
    wire error_detected;

    hamming_encoder encoder (
        .data_in(data_in),
        .encoded_data(encoded_data)
    );

    hamming_decoder decoder (
        .encoded_data(faulty_data),
        .data_out(decoded_data),
        .error_detected(error_detected)
    );

    initial begin
        $dumpfile("tb_hamming_code.vcd");
        $dumpvars(0, tb_hamming_code);

        data_in = 4'b0001; #10;
        faulty_data = encoded_data;
        #10;
        $display("Data In: %b, Encoded: %b, Decoded: %b, Error: %b", data_in, faulty_data, decoded_data, error_detected);
        
        data_in = 4'b1101; #10;
        faulty_data = encoded_data;
        #10;
        $display("Data In: %b, Encoded: %b, Decoded: %b, Error: %b", data_in, faulty_data, decoded_data, error_detected);
        
        data_in = 4'b1010; #10;
        faulty_data = encoded_data;
        #10;
        $display("Data In: %b, Encoded: %b, Decoded: %b, Error: %b", data_in, faulty_data, decoded_data, error_detected);
        
        data_in = 4'b0110; #10;
        faulty_data = encoded_data;
        #10;
        $display("Data In: %b, Encoded: %b, Decoded: %b, Error: %b", data_in, faulty_data, decoded_data, error_detected);

        data_in = 4'b1111; #10;
        faulty_data = encoded_data;
        faulty_data[3] = ~faulty_data[3]; // Introduce an error
        #10;
        $display("Data In: %b, Faulty Encoded: %b, Decoded: %b, Error: %b", data_in, faulty_data, decoded_data, error_detected);

        $finish;
    end
endmodule

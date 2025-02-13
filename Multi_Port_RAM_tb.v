`timescale 1ns / 1ps

module multiport_ram_tb;

    reg clk;
    reg [3:0] addr_a, addr_b, addr_c, addr_d;
    reg [7:0] data_in_a, data_in_b, data_in_c, data_in_d;
    reg we_a, we_b, we_c, we_d;
    wire [7:0] data_out_a, data_out_b, data_out_c, data_out_d;

    // Instantiate the multiport RAM
    multiport_ram uut (
        .clk(clk),
        .addr_a(addr_a),
        .addr_b(addr_b),
        .addr_c(addr_c),
        .addr_d(addr_d),
        .data_in_a(data_in_a),
        .data_in_b(data_in_b),
        .data_in_c(data_in_c),
        .data_in_d(data_in_d),
        .we_a(we_a),
        .we_b(we_b),
        .we_c(we_c),
        .we_d(we_d),
        .data_out_a(data_out_a),
        .data_out_b(data_out_b),
        .data_out_c(data_out_c),
        .data_out_d(data_out_d)
    );

    // Generate clock signal
    always #5 clk = ~clk;

    initial begin
        // Initialize inputs
        clk = 0;
        addr_a = 0; addr_b = 0; addr_c = 0; addr_d = 0;
        data_in_a = 0; data_in_b = 0; data_in_c = 0; data_in_d = 0;
        we_a = 0; we_b = 0; we_c = 0; we_d = 0;

        // Test write and read operations
        #10;
        addr_a = 4'h3; data_in_a = 8'hAA; we_a = 1; // Write AA to address 3
        #10;
        addr_a = 4'h3; we_a = 0; // Read from address 3
        #10;
        addr_b = 4'h7; data_in_b = 8'h55; we_b = 1; // Write 55 to address 7
        #10;
        addr_b = 4'h7; we_b = 0; // Read from address 7
        #10;
        addr_c = 4'hA; data_in_c = 8'h77; we_c = 1; // Write 77 to address A
        #10;
        addr_c = 4'hA; we_c = 0; // Read from address A
        #10;
        addr_d = 4'hF; data_in_d = 8'h99; we_d = 1; // Write 99 to address F
        #10;
        addr_d = 4'hF; we_d = 0; // Read from address F

        // Finish simulation
        #20;
        $finish;
    end
endmodule
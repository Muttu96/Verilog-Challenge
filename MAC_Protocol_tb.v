`timescale 1ns / 1ps

module mac_controller_tb;
    reg clk;
    reg reset;
    reg [7:0] data_in;
    reg tx_req;
    wire [7:0] data_out;
    wire tx_done;
    wire mac_tx;
    reg mac_rx;

    mac_controller uut (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .tx_req(tx_req),
        .data_out(data_out),
        .tx_done(tx_done),
        .mac_tx(mac_tx),
        .mac_rx(mac_rx)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        data_in = 8'b0;
        tx_req = 0;
        mac_rx = 1;  
        #20;
        
        reset = 0;
        #10;

        // First Transmission
        data_in = 8'hA5;
        tx_req = 1;
        #10;
        tx_req = 0;
        
        repeat (8) begin
            #10;
            mac_rx = mac_tx;
        end

        #50;

        // Second Transmission
        data_in = 8'h3C;
        tx_req = 1;
        #10;
        tx_req = 0;

        repeat (8) begin
            #10;
            mac_rx = mac_tx;
        end

        #50;
        
        $display("Testbench Completed");
        $stop;
    end

    always @(posedge clk) begin
        $display("Time = %0t | Data Out = %b | TX Done = %b | MAC_TX = %b | MAC_RX = %b", 
                 $time, data_out, tx_done, mac_tx, mac_rx);
    end
endmodule

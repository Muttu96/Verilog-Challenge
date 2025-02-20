module can_controller_tb;
    reg clk;
    reg reset;
    reg [7:0] data_in;
    reg tx_req;
    wire [7:0] data_out;
    wire tx_done;
    wire can_tx;
    reg can_rx;

    can_controller uut (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .tx_req(tx_req),
        .data_out(data_out),
        .tx_done(tx_done),
        .can_tx(can_tx),
        .can_rx(can_rx)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        data_in = 8'b0;
        tx_req = 0;
        can_rx = 1;  
        #10;
        reset = 0;
        
        data_in = 8'hA5;
        tx_req = 1;
        #10;
        tx_req = 0;
        
        repeat (8) begin
            #10;
            can_rx = can_tx;
        end
        
        #50;
        
        data_in = 8'h3C;
        tx_req = 1;
        #10;
        tx_req = 0;
        
        repeat (8) begin
            #10;
            can_rx = can_tx;
        end
        
        #50;
        
        $stop;
    end

    always @(posedge clk) begin
        $display("Time = %0t | Data Out = %b | TX Done = %b | CAN_TX = %b | CAN_RX = %b", 
                 $time, data_out, tx_done, can_tx, can_rx);
    end
endmodule

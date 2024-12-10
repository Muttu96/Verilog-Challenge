`timescale 1ns / 1ps

module ElevatorController_tb;

    reg clk;
    reg reset;
    reg Emergency;
    reg [3:0] floor_request;

    wire [3:0] current_floor;
    wire [1:0] direction;
    wire door_status;

    ElevatorController uut (
        .clk(clk),
        .reset(reset),
        .Emergency(Emergency),
        .floor_request(floor_request),
        .current_floor(current_floor),
        .direction(direction),
        .door_status(door_status)
    );

    initial clk = 0;
    always #5 clk = ~clk; 
    
    initial begin
        $monitor(
            "Time = %0d ns | Reset = %b | Emergency = %b | Floor Request = %d | Current Floor = %d | Direction = %b | Door Status = %b",
            $time, reset, Emergency, floor_request, current_floor, direction, door_status
        );
    end

    initial begin
        reset = 1;
        Emergency = 0;
        floor_request = 0;

        #5;
        reset = 0;

        floor_request = 4'd5;
        #20;

        floor_request = 4'd0;
        #20;

        floor_request = 4'd2;
        #40;

        floor_request = 4'd4;
        #40;

        floor_request = 4'd7;
        #20;

        Emergency = 1;
        #20;
        Emergency = 0;
        #20;

        floor_request = current_floor;
        #20;

        floor_request = 4'd3;
        #20;

        floor_request = 4'd0;
        #20;

        $stop;
    end

endmodule

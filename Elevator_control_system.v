module ElevatorController (
    input clk,
    input reset,
    input Emergency,
    input [3:0] floor_request,
    output reg [3:0] current_floor,
    output reg [1:0] direction,
    output reg door_status
);
    parameter [1:0] IDLE = 2'b00, UP = 2'b01, DOWN = 2'b10;
    parameter [3:0] MAX_FLOOR = 4'b1111, MIN_FLOOR = 4'b0000;

    reg [1:0] state, next_state;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            current_floor <= MIN_FLOOR;
            direction <= 2'b00;
            door_status <= 1'b0;
        end else begin
            state <= next_state;

            if (state == UP && current_floor < floor_request && current_floor < MAX_FLOOR) begin
                current_floor <= current_floor + 1;
            end else if (state == DOWN && current_floor > floor_request && current_floor > MIN_FLOOR) begin
                current_floor <= current_floor - 1;
            end
        end
    end

    always @(*) begin
        next_state = state;
        direction = 2'b00;
        door_status = 1'b0;

        case (state)
            IDLE: begin
                if (Emergency) begin
                    next_state = IDLE;
                    door_status = 1'b1;
                end else if (floor_request > current_floor && floor_request <= MAX_FLOOR) begin
                    next_state = UP;
                    direction = 2'b10;
                end else if (floor_request < current_floor && floor_request >= MIN_FLOOR) begin
                    next_state = DOWN;
                    direction = 2'b01;
                end else if (floor_request == current_floor) begin
                    next_state = IDLE;
                    door_status = 1'b1;
                end
            end

            UP: begin
                direction = 2'b10;
                if (Emergency) begin
                    next_state = IDLE;
                    door_status = 1'b1;
                end else if (current_floor == floor_request) begin
                    next_state = IDLE;
                    door_status = 1'b1;
                end else begin
                    next_state = UP;
                end
            end

            DOWN: begin
                direction = 2'b01;
                if (Emergency) begin
                    next_state = IDLE;
                    door_status = 1'b1;
                end else if (current_floor == floor_request) begin
                    next_state = IDLE;
                    door_status = 1'b1;
                end else begin
                    next_state = DOWN;
                end
            end

            default: begin
                next_state = IDLE;
                direction = 2'b00;
                door_status = 1'b0;
            end
        endcase
    end

endmodule

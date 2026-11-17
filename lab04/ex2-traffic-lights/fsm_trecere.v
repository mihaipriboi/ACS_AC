module fsm_trecere(
    output reg p_rosu,      // red for pedestrians
    output reg p_verde,     // green for pedestrians
    output reg m_rosu,      // red for cars
    output reg m_galben,    // yellow for cars
    output reg m_verde,     // green for cars
    output reg [7:0] T,     // timeout count
    input done,             // timeout expired
    input clk);             // clock input

    localparam S_CARS   = 2'd0,     // phase 0: green for cars, red for pedestrians
               S_YELLOW = 2'd1,     // phase 1: yellow for cars, red for pedestrians
               S_PEDS   = 2'd2;     // phase 2: red for cars, green for pedestrians

    // phase durations, in seconds
    localparam T_CARS   = 8'd50,
               T_YELLOW = 8'd5,
               T_PEDS   = 8'd40;

    reg [1:0] state = S_CARS;
    reg [1:0] next_state;

    always @(posedge clk)
        state <= next_state;

    always @(*) begin
        p_rosu   = 0;
        p_verde  = 0;
        m_rosu   = 0;
        m_galben = 0;
        m_verde  = 0;
        case (state)
            S_CARS: begin
                p_rosu  = 1;
                m_verde = 1;
                T = T_CARS;
                next_state = done ? S_YELLOW : S_CARS;
            end
            S_YELLOW: begin
                p_rosu   = 1;
                m_galben = 1;
                T = T_YELLOW;
                next_state = done ? S_PEDS : S_YELLOW;
            end
            S_PEDS: begin
                p_verde = 1;
                m_rosu  = 1;
                T = T_PEDS;
                next_state = done ? S_CARS : S_PEDS;
            end
            default: begin
                T = T_CARS;
                next_state = S_CARS;
            end
        endcase
    end

endmodule

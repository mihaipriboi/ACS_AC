module trecere(
    output p_rosu,          // red for pedestrians
    output p_verde,         // green for pedestrians
    output m_rosu,          // red for cars
    output m_galben,        // yellow for cars
    output m_verde,         // green for cars
    input clk);             // clock input

    wire       done;        // current phase is over
    wire [7:0] T;           // current phase duration, in seconds

    counter c(
        .done(done),
        .T(T),
        .clk(clk));

    fsm_trecere fsm(
        .p_rosu(p_rosu),
        .p_verde(p_verde),
        .m_rosu(m_rosu),
        .m_galben(m_galben),
        .m_verde(m_verde),
        .T(T),
        .done(done),
        .clk(clk));

endmodule

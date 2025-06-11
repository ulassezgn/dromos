module generator_ij_span
(
    input wire gik_i,
    input wire pik_i,
    input wire gk_1j_i,
    output wire gij_o
);
    assign gij_o = gik_i || (pik_i && gk_1j_i);
endmodule 
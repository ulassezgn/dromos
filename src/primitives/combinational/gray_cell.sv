module gray_cell
(
    input wire pik_i,
    input wire gik_i,
    input wire gk_1j_i,
    output wire gij_o
);
    generator_ij_span GEN(gik_i, pik_i, gk_1j_i, gij_o);
endmodule
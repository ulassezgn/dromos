module black_cell
(
    input wire pik_i,
    input wire gik_i,
    input wire pk_1j_i,
    input wire gk_1j_i,
    output wire gij_o,
    output wire pij_o
);
    generator_ij_span GEN(gik_i, pik_i, gk_1j_i, gij_o);
    propagator_ij_span PROP(pik_i, pk_1j_i, pij_o);
endmodule
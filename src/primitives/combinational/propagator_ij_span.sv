module propagator_ij_span
(
    input wire pik_i;
    input wire pk_1j_i;
    output wire pij_o;
)
assign pij_o = pik_i && pk_1j_i;
endmodule
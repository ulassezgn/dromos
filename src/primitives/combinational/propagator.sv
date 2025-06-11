module propagator
(
    input wire a_i,
    input wire b_i,
    output wire p_o
);
    assign p_o = a_i ^ b_i;
endmodule
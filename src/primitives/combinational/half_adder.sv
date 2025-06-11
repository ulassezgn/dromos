module half_adder
(
    input wire a_i,
    input wire b_i,
    output wire s_o,
    output wire c_o
);
    xor G1(s_o, a_i, b_i);
    and G2(c_o, a_i, b_i);
endmodule
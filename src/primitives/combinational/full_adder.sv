module full_adder
(
    input wire a_i;
    input wire b_i;
    input wire c_i;
    output wire s_o;
    output wire c_o;
)
    wire w1, w2, w3, w4, w5;
    and G1(w1, a_i, c_i);
    and G2(w2, b_i, c_i);
    and G3(w3, a_i, b_i);
    or G4(w4, w1, w2);
    or G5(c_o, w3, w4);

    xor G6(w5, a_i, b_i);
    xor G7(s_o, w5, c_i);
endmodule

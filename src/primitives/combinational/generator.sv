module generator
(
    input wire a_i,
    input wire b_i,
    output wire g_o
);
    assign g_o = a_i && b_i;
endmodule
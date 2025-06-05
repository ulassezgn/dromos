module brent_kung_adder_64b(
    input wire [63:0] op1_i,
    input wire [63:0] op2_i,
    input wire carry_i,
    output wire [63:0] sum_o,
    output wire carry_o
);

    wire [64:0] prop, gen, carry;

    pre_processing_64b PRE(op1_i, op2_i, carry_i, prop, gen);
    carry_tree_bk_64b TREE(prop[63:0], gen[63:0], carry[63:0]);
    post_processing_param #(64) POST(prop[64:1], carry[63:0], sum_o);
    gray_cell COUT(prop[64], gen[64], carry[63], carry[64]);

    assign carry_o = carry[64];    

endmodule
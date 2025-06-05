module brent_kung_adder_32b(
    input wire [31:0] op1_i,
    input wire [31:0] op2_i,
    input wire carry_i,
    output wire [31:0] sum_o,
    output wire carry_o
);

    wire [32:0] prop, gen, carry;

    pre_processing_32b PRE(op1_i, op2_i, carry_i, prop, gen);
    carry_tree_bk_32b TREE(prop[31:0], gen[31:0], carry[31:0]);
    post_processing_param #(32) POST(prop[32:1], carry[31:0], sum_o);
    gray_cell COUT(prop[32], gen[32], carry[31], carry[32]);

    assign carry_o = carry[32];    

endmodule
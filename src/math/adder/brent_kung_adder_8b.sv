module brent_kung_adder_8b(
    input wire [7:0] op1_i,
    input wire [7:0] op2_i,
    input wire carry_i,
    output wire [7:0] sum_o,
    output wire carry_o
);

    wire [8:0] prop, gen, carry;

    pre_processing_8b PRE(op1_i, op2_i, carry_i, prop, gen);
    carry_tree_bk_8b TREE(prop[7:0], gen[7:0], carry[7:0]);
    post_processing_param #(8) POST(prop[8:1], carry[7:0], sum_o);
    gray_cell COUT(prop[8], gen[8], carry[7], carry[8]);

    assign carry_o = carry[8];    

endmodule
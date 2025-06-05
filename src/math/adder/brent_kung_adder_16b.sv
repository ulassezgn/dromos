module brent_kung_adder_16b(
    input wire [15:0] op1_i,
    input wire [15:0] op2_i,
    input wire carry_i,
    output wire [15:0] sum_o,
    output wire carry_o
);

    wire [16:0] prop, gen, carry;

    pre_processing_16b PRE(op1_i, op2_i, carry_i, prop, gen);
    carry_tree_bk_16b TREE(prop[15:0], gen[15:0], carry[15:0]);
    post_processing_param #(16) POST(prop[16:1], carry[15:0], sum_o);
    gray_cell COUT(prop[16], gen[16], carry[15], carry[16]);

    assign carry_o = carry[16];    

endmodule
module brent_kung_adder_4b(
    input wire [3:0] op1_i,
    input wire [3:0] op2_i,
    input wire carry_i,
    output wire [3:0] sum_o,
    output wire carry_o
);

    wire [4:0] prop, gen, carry;

    pre_processing_4b PRE(op1_i, op2_i, carry_i, prop, gen);
    carry_tree_bk_4b TREE(prop[3:0], gen[3:0], carry[3:0]);
    post_processing_param #(4) POST(prop[4:1], carry[3:0], sum_o);
    gray_cell COUT(prop[4], gen[4], carry[3], carry[4]);

    assign carry_o = carry[4];    

endmodule
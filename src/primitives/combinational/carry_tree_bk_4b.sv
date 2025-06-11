module carry_tree_bk_4b
(
    input wire [3:0] prop_i,
    input wire [3:0] gen_i,
    output wire [3:0] carry_o
);
    wire gen_1_0, gen_2_0, gen_3_2, gen_3_0;
    wire prop_3_2;


    assign carry_o[0] = gen_i[0];
    assign carry_o[1] = gen_1_0;
    assign carry_o[2] = gen_2_0;
    assign carry_o[3] = gen_3_0;

    black_cell BC3(prop_i[3], gen_i[3], prop_i[2], gen_i[2], gen_3_2, prop_3_2);

    gray_cell GC1(prop_i[1], gen_i[1], gen_i[0], gen_1_0);
    gray_cell GC2(prop_i[2], gen_i[2], gen_1_0, gen_2_0);
    gray_cell GC3(prop_3_2, gen_3_2, gen_1_0, gen_3_0);
    
endmodule


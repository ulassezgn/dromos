module carry_tree_bk_8b
(
    input wire [7:0] prop_i;
    input wire [7:0] gen_i;
    output wire [7:0] carry_o;
);
    wire [7:0] gen_to_0;
    assign gen_to_0[0] = gen_i[0];

    wire prop_3_2, gen_3_2, prop_5_4, gen_5_4, prop_7_6, gen_7_6, prop_7_4, gen_7_4;

    generate
        genvar i;
        for(i = 0; i < 32; i = i + 1) begin : tree_block
            assign carry_o[i] = gen_to_0[i];
        end
    endgenerate

    /*   Black Cell Stage-1   */
    black_cell BC3(prop_i[3], gen_i[3], prop_i[2], gen_i[2], gen_3_2, prop_3_2);
    black_cell BC5(prop_i[5], gen_i[5], prop_i[4], gen_i[4], gen_5_4, prop_5_4);
    black_cell BC7(prop_i[7], gen_i[7], prop_i[6], gen_i[6], gen_7_6, prop_7_6);    

    /*   Black Cell Stage-2   */
    black_cell BC7_ST2(prop_7_6, gen_7_6, prop_5_4, gen_5_4, gen_7_4, prop_7_4);

      /*   All Gray Cells   */
    gray_cell GC1(prop_i[1], gen_i[1], gen_to_0[0], gen_to_0[1]);
    gray_cell GC2(prop_i[2], gen_i[2], gen_to_0[1], gen_to_0[2]);
    gray_cell GC3(prop_3_2, gen_3_2, gen_to_0[1], gen_to_0[3]);
    gray_cell GC4(prop_i[4], gen_i[4], gen_to_0[3], gen_to_0[4]);
    gray_cell GC5(prop_5_4, gen_5_4, gen_to_0[3], gen_to_0[5]);
    gray_cell GC6(prop_i[6], gen_i[6], gen_to_0[5], gen_to_0[6]);
    gray_cell GC7(prop_7_4, gen_7_4, gen_to_0[3], gen_to_0[7]);

endmodule
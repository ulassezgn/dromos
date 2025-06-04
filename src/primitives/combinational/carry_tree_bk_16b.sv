module carry_tree_bk_16b(
    input wire [15:0] prop_i,
    input wire [15:0] gen_i,
    output wire [15:0] carry_o
);
    wire [15:0] gen_to_0;

    wire prop_3_2, gen_3_2, prop_5_4, gen_5_4, prop_7_6, gen_7_6, prop_7_4, gen_7_4, prop_9_8, gen_9_8, prop_11_10, gen_11_10, prop_11_8, gen_11_8;
    wire prop_13_12, gen_13_12, prop_15_14, gen_15_14, prop_15_12, gen_15_12, prop_15_8, gen_15_8;
    assign gen_to_0[0] = gen_i[0];
    genvar i;
    generate
        for(i = 0; i < 16; i = i + 1) begin : tree_block
            assign carry_o[i] = gen_to_0[i];
        end
    endgenerate
    
    /*   Black Cell Stage-1   */
    black_cell BC3(prop_i[3], gen_i[3], prop_i[2], gen_i[2], gen_3_2, prop_3_2);    
    black_cell BC5(prop_i[5], gen_i[5], prop_i[4], gen_i[4], gen_5_4, prop_5_4);    
    black_cell BC7(prop_i[7], gen_i[7], prop_i[6], gen_i[6], gen_7_6, prop_7_6);    
    black_cell BC9(prop_i[9], gen_i[9], prop_i[8], gen_i[8], gen_9_8, prop_9_8);    
    black_cell BC11(prop_i[11], gen_i[11], prop_i[10], gen_i[10], gen_11_10, prop_11_10);    
    black_cell BC13(prop_i[13], gen_i[13], prop_i[12], gen_i[12], gen_13_12, prop_13_12);    
    black_cell BC15(prop_i[15], gen_i[15], prop_i[14], gen_i[14], gen_15_14, prop_15_14);   

    /*   Black Cell Stage-2   */
    black_cell BC7_ST2(prop_7_6, gen_7_6, prop_5_4, gen_5_4, gen_7_4, prop_7_4);
    black_cell BC11_ST2(prop_11_10, gen_11_10, prop_9_8, gen_9_8, gen_11_8, prop_11_8);
    black_cell BC15_ST2(prop_15_14, gen_15_14, prop_13_12, gen_13_12, gen_15_12, prop_15_12);

    /*   Black Cell Stage-3   */
    black_cell BC15_ST3(prop_15_12, gen_15_12, prop_11_8, gen_11_8, gen_15_8, prop_15_8);
    

    /*   All Gray Cells   */
    gray_cell GC1(prop_i[1], gen_i[1], gen_to_0[0], gen_to_0[1]);
    gray_cell GC2(prop_i[2], gen_i[2], gen_to_0[1], gen_to_0[2]);
    gray_cell GC3(prop_3_2, gen_3_2, gen_to_0[1], gen_to_0[3]);
    gray_cell GC4(prop_i[4], gen_i[4], gen_to_0[3], gen_to_0[4]);
    gray_cell GC5(prop_5_4, gen_5_4, gen_to_0[3], gen_to_0[5]);
    gray_cell GC6(prop_i[6], gen_i[6], gen_to_0[5], gen_to_0[6]);
    gray_cell GC7(prop_7_4, gen_7_4, gen_to_0[3], gen_to_0[7]);
    gray_cell GC8(prop_i[8], gen_i[8], gen_to_0[7], gen_to_0[8]);
    gray_cell GC9(prop_9_8, gen_9_8, gen_to_0[7], gen_to_0[9]);
    gray_cell GC10(prop_i[10], gen_i[10], gen_to_0[9], gen_to_0[10]);
    gray_cell GC11(prop_11_8, gen_11_8, gen_to_0[7], gen_to_0[11]);
    gray_cell GC12(prop_i[12], gen_i[12], gen_to_0[11], gen_to_0[12]);
    gray_cell GC13(prop_13_12, gen_13_12, gen_to_0[11], gen_to_0[13]);
    gray_cell GC14(prop_i[14], gen_i[14], gen_to_0[13], gen_to_0[14]);
    gray_cell GC15(prop_15_8, gen_15_8, gen_to_0[7], gen_to_0[15]);
endmodule
module carry_tree_bk_32b(prop_i, gen_i, carry_o);
    input wire [31:0] prop_i;
    input wire [31:0] gen_i;

    output wire [31:0] carry_o;

    wire [31:0] gen_to_0;

    wire prop_3_2, gen_3_2, prop_5_4, gen_5_4, prop_7_6, gen_7_6, prop_7_4, gen_7_4, prop_9_8, gen_9_8, prop_11_10, gen_11_10, prop_11_8, gen_11_8;
    wire prop_13_12, gen_13_12, prop_15_14, gen_15_14, prop_15_12, gen_15_12, prop_15_8, gen_15_8, prop_17_16, gen_17_16, prop_19_18, gen_19_18, prop_19_16, gen_19_16;
    wire prop_21_20, gen_21_20, prop_23_22, gen_23_22, prop_23_20, gen_23_20, prop_23_16, gen_23_16, prop_25_24, gen_25_24, prop_27_26, gen_27_26, prop_27_24, gen_27_24;
    wire prop_29_28, gen_29_28, prop_31_30, gen_31_30, prop_31_28, gen_31_28, prop_31_24, gen_31_24, prop_31_16, gen_31_16;

    assign gen_to_0[0] = gen_i[0];
    genvar i;
    generate
        for(i = 0; i < 32; i = i + 1) begin : tree_block
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
    black_cell BC17(prop_i[17], gen_i[17], prop_i[16], gen_i[16], gen_17_16, prop_17_16);
    black_cell BC19(prop_i[19], gen_i[19], prop_i[18], gen_i[18], gen_19_18, prop_19_18);
    black_cell BC21(prop_i[21], gen_i[21], prop_i[20], gen_i[20], gen_21_20, prop_21_20);
    black_cell BC23(prop_i[23], gen_i[23], prop_i[22], gen_i[22], gen_23_22, prop_23_22);
    black_cell BC25(prop_i[25], gen_i[25], prop_i[24], gen_i[24], gen_25_24, prop_25_24);
    black_cell BC27(prop_i[27], gen_i[27], prop_i[26], gen_i[26], gen_27_26, prop_27_26);
    black_cell BC29(prop_i[29], gen_i[29], prop_i[28], gen_i[28], gen_29_28, prop_29_28);
    black_cell BC31(prop_i[31], gen_i[31], prop_i[30], gen_i[30], gen_31_30, prop_31_30);

    /*   Black Cell Stage-2   */
    black_cell BC7_ST2(prop_7_6, gen_7_6, prop_5_4, gen_5_4, gen_7_4, prop_7_4);
    black_cell BC11_ST2(prop_11_10, gen_11_10, prop_9_8, gen_9_8, gen_11_8, prop_11_8);
    black_cell BC15_ST2(prop_15_14, gen_15_14, prop_13_12, gen_13_12, gen_15_12, prop_15_12);
    black_cell BC19_ST2(prop_19_18, gen_19_18, prop_17_16, gen_17_16, gen_19_16, prop_19_16);
    black_cell BC23_ST2(prop_23_22, gen_23_22, prop_21_20, gen_21_20, gen_23_20, prop_23_20);
    black_cell BC27_ST2(prop_27_26, gen_27_26, prop_25_24, gen_25_24, gen_27_24, prop_27_24);
    black_cell BC31_ST2(prop_31_30, gen_31_30, prop_29_28, gen_29_28, gen_31_28, prop_31_28);

    /*   Black Cell Stage-3   */
    black_cell BC15_ST3(prop_15_12, gen_15_12, prop_11_8, gen_11_8, gen_15_8, prop_15_8);
    black_cell BC23_ST3(prop_23_20, gen_23_20, prop_19_16, gen_19_16, gen_23_16, prop_23_16);
    black_cell BC31_ST3(prop_31_28, gen_31_28, prop_27_24, gen_27_24, gen_31_24, prop_31_24);

    /*   Black Cell Stage-4   */
    black_cell BC31_ST4(prop_31_24, gen_31_24, prop_23_16, gen_23_16, gen_31_16, prop_31_16);


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
    gray_cell GC16(prop_i[16], gen_i[16], gen_to_0[15], gen_to_0[16]);
    gray_cell GC17(prop_17_16, gen_17_16, gen_to_0[15], gen_to_0[17]);
    gray_cell GC18(prop_i[18], gen_i[18], gen_to_0[17], gen_to_0[18]);
    gray_cell GC19(prop_19_16, gen_19_16, gen_to_0[15], gen_to_0[19]);
    gray_cell GC20(prop_i[20], gen_i[20], gen_to_0[19], gen_to_0[20]);
    gray_cell GC21(prop_21_20, gen_21_20, gen_to_0[19], gen_to_0[21]);
    gray_cell GC22(prop_i[22], gen_i[22], gen_to_0[21], gen_to_0[22]);
    gray_cell GC23(prop_23_16, gen_23_16, gen_to_0[15], gen_to_0[23]);
    gray_cell GC24(prop_i[24], gen_i[24], gen_to_0[23], gen_to_0[24]);
    gray_cell GC25(prop_25_24, gen_25_24, gen_to_0[23], gen_to_0[25]);
    gray_cell GC26(prop_i[26], gen_i[26], gen_to_0[25], gen_to_0[26]);
    gray_cell GC27(prop_27_24, gen_27_24, gen_to_0[23], gen_to_0[27]);
    gray_cell GC28(prop_i[28], gen_i[28], gen_to_0[27], gen_to_0[28]);
    gray_cell GC29(prop_29_28, gen_29_28, gen_to_0[27], gen_to_0[29]);
    gray_cell GC30(prop_i[30], gen_i[30], gen_to_0[29], gen_to_0[30]);
    gray_cell GC31(prop_31_16, gen_31_16, gen_to_0[15], gen_to_0[31]);
endmodule

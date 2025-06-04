module carry_tree_bk_64b(
    input wire [63:0] prop_i,
    input wire [63:0] gen_i,
    output wire [63:0] carry_o
);

    wire [63:0] gen_to_0;
    
    wire prop_3_2, gen_3_2, prop_5_4, gen_5_4, prop_7_6, gen_7_6, prop_7_4, gen_7_4, prop_9_8, gen_9_8, prop_11_10, gen_11_10, prop_11_8, gen_11_8;
    wire prop_13_12, gen_13_12, prop_15_14, gen_15_14, prop_15_12, gen_15_12, prop_15_8, gen_15_8, prop_17_16, gen_17_16, prop_19_18, gen_19_18, prop_19_16, gen_19_16;
    wire prop_21_20, gen_21_20, prop_23_22, gen_23_22, prop_23_20, gen_23_20, prop_23_16, gen_23_16, prop_25_24, gen_25_24, prop_27_26, gen_27_26, prop_27_24, gen_27_24;
    wire prop_29_28, gen_29_28, prop_31_30, gen_31_30, prop_33_32, gen_33_32, prop_31_28, gen_31_28, prop_31_24, gen_31_24, prop_31_16, gen_31_16;
    wire prop_35_34, gen_35_34, prop_37_36, gen_37_36, prop_39_38, gen_39_38, prop_41_40, gen_41_40, prop_43_42, gen_43_42, prop_45_44, gen_45_44;
    wire prop_47_46, gen_47_46, prop_49_48, gen_49_48, prop_51_50, gen_51_50, prop_53_52, gen_53_52, prop_55_54, gen_55_54, prop_57_56, gen_57_56;
    wire prop_59_58, gen_59_58, prop_61_60, gen_61_60, prop_63_62, gen_63_62;
    wire prop_35_32, gen_35_32, prop_39_36, gen_39_36, prop_43_40, gen_43_40, prop_47_44, gen_47_44, prop_51_48, gen_51_48, prop_55_52, gen_55_52;
    wire prop_59_56, gen_59_56, prop_63_60, gen_63_60;
    wire prop_39_32, gen_39_32, prop_47_40, gen_47_40, prop_55_48, gen_55_48, prop_63_56, gen_63_56;
    wire prop_47_32, gen_47_32, prop_63_48, gen_63_48;
    wire prop_63_32, gen_63_32;

    assign gen_to_0[0] = gen_i[0];

    genvar i;
    generate
        for(i = 0; i < 64; i = i + 1) begin : tree_block
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
    black_cell BC33(prop_i[33], gen_i[33], prop_i[32], gen_i[32], gen_33_32, prop_33_32);
    black_cell BC35(prop_i[35], gen_i[35], prop_i[34], gen_i[34], gen_35_34, prop_35_34);
    black_cell BC37(prop_i[37], gen_i[37], prop_i[36], gen_i[36], gen_37_36, prop_37_36);
    black_cell BC39(prop_i[39], gen_i[39], prop_i[38], gen_i[38], gen_39_38, prop_39_38);
    black_cell BC41(prop_i[41], gen_i[41], prop_i[40], gen_i[40], gen_41_40, prop_41_40);
    black_cell BC43(prop_i[43], gen_i[43], prop_i[42], gen_i[42], gen_43_42, prop_43_42);
    black_cell BC45(prop_i[45], gen_i[45], prop_i[44], gen_i[44], gen_45_44, prop_45_44);
    black_cell BC47(prop_i[47], gen_i[47], prop_i[46], gen_i[46], gen_47_46, prop_47_46);
    black_cell BC49(prop_i[49], gen_i[49], prop_i[48], gen_i[48], gen_49_48, prop_49_48);
    black_cell BC51(prop_i[51], gen_i[51], prop_i[50], gen_i[50], gen_51_50, prop_51_50);
    black_cell BC53(prop_i[53], gen_i[53], prop_i[52], gen_i[52], gen_53_52, prop_53_52);
    black_cell BC55(prop_i[55], gen_i[55], prop_i[54], gen_i[54], gen_55_54, prop_55_54);
    black_cell BC57(prop_i[57], gen_i[57], prop_i[56], gen_i[56], gen_57_56, prop_57_56);
    black_cell BC59(prop_i[59], gen_i[59], prop_i[58], gen_i[58], gen_59_58, prop_59_58);
    black_cell BC61(prop_i[61], gen_i[61], prop_i[60], gen_i[60], gen_61_60, prop_61_60);
    black_cell BC63(prop_i[63], gen_i[63], prop_i[62], gen_i[62], gen_63_62, prop_63_62);

    /*   Black Cell Stage-2   */
    black_cell BC7_ST2(prop_7_6, gen_7_6, prop_5_4, gen_5_4, gen_7_4, prop_7_4);
    black_cell BC11_ST2(prop_11_10, gen_11_10, prop_9_8, gen_9_8, gen_11_8, prop_11_8);
    black_cell BC15_ST2(prop_15_14, gen_15_14, prop_13_12, gen_13_12, gen_15_12, prop_15_12);
    black_cell BC19_ST2(prop_19_18, gen_19_18, prop_17_16, gen_17_16, gen_19_16, prop_19_16);
    black_cell BC23_ST2(prop_23_22, gen_23_22, prop_21_20, gen_21_20, gen_23_20, prop_23_20);
    black_cell BC27_ST2(prop_27_26, gen_27_26, prop_25_24, gen_25_24, gen_27_24, prop_27_24);
    black_cell BC31_ST2(prop_31_30, gen_31_30, prop_29_28, gen_29_28, gen_31_28, prop_31_28);
    black_cell BC35_ST2(prop_35_34, gen_35_34, prop_33_32, gen_33_32, gen_35_32, prop_35_32);
    black_cell BC39_ST2(prop_39_38, gen_39_38, prop_37_36, gen_37_36, gen_39_36, prop_39_36);
    black_cell BC43_ST2(prop_43_42, gen_43_42, prop_41_40, gen_41_40, gen_43_40, prop_43_40);
    black_cell BC47_ST2(prop_47_46, gen_47_46, prop_45_44, gen_45_44, gen_47_44, prop_47_44);
    black_cell BC51_ST2(prop_51_50, gen_51_50, prop_49_48, gen_49_48, gen_51_48, prop_51_48);
    black_cell BC55_ST2(prop_55_54, gen_55_54, prop_53_52, gen_53_52, gen_55_52, prop_55_52);
    black_cell BC59_ST2(prop_59_58, gen_59_58, prop_57_56, gen_57_56, gen_59_56, prop_59_56);
    black_cell BC63_ST2(prop_63_62, gen_63_62, prop_61_60, gen_61_60, gen_63_60, prop_63_60);


    /*   Black Cell Stage-3   */
    black_cell BC15_ST3(prop_15_12, gen_15_12, prop_11_8, gen_11_8, gen_15_8, prop_15_8);
    black_cell BC23_ST3(prop_23_20, gen_23_20, prop_19_16, gen_19_16, gen_23_16, prop_23_16);
    black_cell BC31_ST3(prop_31_28, gen_31_28, prop_27_24, gen_27_24, gen_31_24, prop_31_24);
    black_cell BC39_ST3(prop_39_36, gen_39_36, prop_35_32, gen_35_32, gen_39_32, prop_39_32);
    black_cell BC47_ST3(prop_47_44, gen_47_44, prop_43_40, gen_43_40, gen_47_40, prop_47_40);
    black_cell BC55_ST3(prop_55_52, gen_55_52, prop_51_48, gen_51_48, gen_55_48, prop_55_48);
    black_cell BC63_ST3(prop_63_60, gen_63_60, prop_59_56, gen_59_56, gen_63_56, prop_63_56);

    /*   Black Cell Stage-4   */
    black_cell BC31_ST4(prop_31_24, gen_31_24, prop_23_16, gen_23_16, gen_31_16, prop_31_16);
    black_cell BC47_ST4(prop_47_40, gen_47_40, prop_39_32, gen_39_32, gen_47_32, prop_47_32);
    black_cell BC63_ST4(prop_63_56, gen_63_56, prop_55_48, gen_55_48, gen_63_48, prop_63_48);

    /*   Black Cell Stage-5   */
    black_cell BC63_ST5(prop_63_48, gen_63_48, prop_47_32, gen_47_32, gen_63_32, prop_63_32);

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
    gray_cell GC32(prop_i[32], gen_i[32], gen_to_0[31], gen_to_0[32]);
    gray_cell GC33(prop_33_32, gen_33_32, gen_to_0[31], gen_to_0[33]);
    gray_cell GC34(prop_i[34], gen_i[34], gen_to_0[33], gen_to_0[34]);
    gray_cell GC35(prop_35_32, gen_35_32, gen_to_0[31], gen_to_0[35]);
    gray_cell GC36(prop_i[36], gen_i[36], gen_to_0[35], gen_to_0[36]);
    gray_cell GC37(prop_37_36, gen_37_36, gen_to_0[35], gen_to_0[37]);
    gray_cell GC38(prop_i[38], gen_i[38], gen_to_0[37], gen_to_0[38]);
    gray_cell GC39(prop_39_32, gen_39_32, gen_to_0[31], gen_to_0[39]);
    gray_cell GC40(prop_i[40], gen_i[40], gen_to_0[39], gen_to_0[40]);
    gray_cell GC41(prop_41_40, gen_41_40, gen_to_0[39], gen_to_0[41]);
    gray_cell GC42(prop_i[42], gen_i[42], gen_to_0[41], gen_to_0[42]);
    gray_cell GC43(prop_43_40, gen_43_40, gen_to_0[42], gen_to_0[43]);
    gray_cell GC44(prop_i[44], gen_i[44], gen_to_0[43], gen_to_0[44]);
    gray_cell GC45(prop_45_44, gen_45_44, gen_to_0[43], gen_to_0[45]);
    gray_cell GC46(prop_i[46], gen_i[46], gen_to_0[45], gen_to_0[46]);
    gray_cell GC47(prop_47_32, gen_47_32, gen_to_0[31], gen_to_0[47]);
    gray_cell GC48(prop_i[48], gen_i[48], gen_to_0[47], gen_to_0[48]);
    gray_cell GC49(prop_49_48, gen_49_48, gen_to_0[48], gen_to_0[49]);
    gray_cell GC50(prop_i[50], gen_i[50], gen_to_0[49], gen_to_0[50]);
    gray_cell GC51(prop_51_48, gen_51_48, gen_to_0[47], gen_to_0[51]);
    gray_cell GC52(prop_i[52], gen_i[52], gen_to_0[51], gen_to_0[52]);
    gray_cell GC53(prop_53_52, gen_53_52, gen_to_0[51], gen_to_0[53]);
    gray_cell GC54(prop_i[54], gen_i[54], gen_to_0[53], gen_to_0[54]);
    gray_cell GC55(prop_55_48, gen_55_48, gen_to_0[47], gen_to_0[55]);
    gray_cell GC56(prop_i[56], gen_i[56], gen_to_0[55], gen_to_0[56]);
    gray_cell GC57(prop_57_56, gen_57_56, gen_to_0[55], gen_to_0[57]);
    gray_cell GC58(prop_i[58], gen_i[58], gen_to_0[57], gen_to_0[58]);
    gray_cell GC59(prop_59_56, gen_59_56, gen_to_0[55], gen_to_0[59]);
    gray_cell GC60(prop_i[60], gen_i[60], gen_to_0[59], gen_to_0[60]);
    gray_cell GC61(prop_61_60, gen_61_60, gen_to_0[59], gen_to_0[61]);
    gray_cell GC62(prop_i[62], gen_i[62], gen_to_0[61], gen_to_0[62]);
    gray_cell GC63(prop_63_32, gen_63_32, gen_to_0[31], gen_to_0[63]);

endmodule
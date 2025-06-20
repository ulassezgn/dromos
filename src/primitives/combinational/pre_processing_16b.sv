module pre_processing_16b
(
    input wire [15:0] operand1_i,
    input wire [15:0] operand2_i,
    input wire carry_i,
    
    output wire [16:0] prop_o,
    output wire [16:0] gen_o
);
    assign prop_o = 1'b0;
    assign gen_o[0] = carry_i;

    genvar i;
    generate
        for(i = 1; i < 17; i = i + 1) begin : pre_processing_block
            propagator PROP(operand1_i[i-1], operand2_i[i-1], prop_o[i]);
            generator GEN(operand1_i[i-1], operand2_i[i-1], gen_o[i]);
        end
    endgenerate
endmodule

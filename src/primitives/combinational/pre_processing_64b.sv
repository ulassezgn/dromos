module pre_processing_64b
(
    input wire [63:0] operand1_i,
    input wire [63:0] operand2_i,
    input wire carry_i,

    output wire [64:0] prop_o,
    output wire [64:0] gen_o
);
    assign prop_o[0] = 1'b0;
    assign gen_o[0] = carry_i;

    genvar i;
    generate
        for(i = 1; i < 65; i = i + 1) begin : pre_processing_block
            propagator PROP(operand1_i[i-1], operand2_i[i-1], prop_o[i]);
            generator GEN(operand1_i[i-1], operand2_i[i-1], gen_o[i]);
        end
    endgenerate
endmodule
module carry_lookahead_adder_4b
(
    input wire [3:0] operand1_i;
    input wire [3:0] operand2_i;
    input wire carry_i;

    output wire [3:0] sum_o;
    output wire carry_o;
)

    wire [3:0] generator_w;
    wire [3:0] partial_sum_w;
    wire [2:0] carry_intermediate;

    genvar i;
    generate
        for(i = 0; i < 4; i = i + 1) begin : generator_partial_block
            and G1(generator_w[i], operand1_i[i], operand2_i[i]);
            xor G2(partial_sum_w[i], operand1_i[i], operand2_i[i]);
        end
    endgenerate

    assign carry_intermediate[0] = generator_w[0] | (partial_sum_w[0] & carry_i);
    assign carry_intermediate[1] = generator_w[1] | (partial_sum_w[1] & (generator_w[0] | (partial_sum_w[0] & carry_i)));
    assign carry_intermediate[2] = generator_w[2] | (partial_sum_w[2] & (generator_w[1] | (partial_sum_w[1] & (generator_w[0] | (partial_sum_w[0] & carry_i)))));
    assign carry_o = generator_w[3] | (partial_sum_w[3] & ( generator_w[2] | (partial_sum_w[2] & (generator_w[1] | (partial_sum_w[1] & (generator_w[0] | (partial_sum_w[0] & carry_i)))))));

    generate
        for(i = 0; i < 4; i = i + 1) begin : sum_block
            assign sum_o[i] = operand1_i[i] ^ operand2_i[i] ^ carry_intermediate[i];
        end
    endgenerate
endmodule
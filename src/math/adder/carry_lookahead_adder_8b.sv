module carry_lookahead_adder_8b
(
    input wire [7:0] operand1_i;
    input wire [7:0] operand2_i;
    input wire carry_i;

    output wire [7:0] sum_o;
    output wire carry_o;
)
    wire [7:0] generator_w;
    wire [7:0] partial_sum_w;
    wire [6:0] carry_intermediate;

    genvar i;
    generate
        for(i = 0; i < 8; i = i + 1) begin : generator_partial_block
            and G1(generator_w[i], operand1_i[i], operand2_i[i]);
            xor G2(partial_sum_w[i], operand1_i[i], operand2_i[i]);
        end
    endgenerate

    assign carry_intermediate[0] = generator_w[0] | (partial_sum_w[0] & carry_i);
    assign carry_intermediate[1] = generator_w[1] | (partial_sum_w[1] & (generator_w[0] | (partial_sum_w[0] & carry_i)));
    assign carry_intermediate[2] = generator_w[2] | (partial_sum_w[2] & (generator_w[1] | (partial_sum_w[1] & (generator_w[0] | (partial_sum_w[0] & carry_i)))));
    assign carry_intermediate[3] = generator_w[3] | (partial_sum_w[3] & (generator_w[2] | (partial_sum_w[2] & (generator_w[1] | (partial_sum_w[1] & (generator_w[0] | (partial_sum_w[0] & carry_i)))))));
    assign carry_intermediate[4] = generator_w[4] | (partial_sum_w[4] & (generator_w[3] | (partial_sum_w[3] & (generator_w[2] | (partial_sum_w[2] & (generator_w[1] | (partial_sum_w[1] & (generator_w[0] | (partial_sum_w[0] & carry_i)))))))));
    assign carry_intermediate[5] = generator_w[5] | (partial_sum_w[5] & (generator_w[4] | (partial_sum_w[4] & (generator_w[3] | (partial_sum_w[3] & (generator_w[2] | (partial_sum_w[2] & (generator_w[1] | (partial_sum_w[1] & (generator_w[0] | (partial_sum_w[0] & carry_i)))))))))));
    assign carry_intermediate[6] = generator_w[6] | (partial_sum_w[6] & (generator_w[5] | (partial_sum_w[5] & (generator_w[4] | (partial_sum_w[4] & (generator_w[3] | (partial_sum_w[3] & (generator_w[2] | (partial_sum_w[2] & (generator_w[1] | (partial_sum_w[1] & (generator_w[0] | (partial_sum_w[0] & carry_i)))))))))))));
    assign carry_o = generator_w[7] | (partial_sum_w[7] & (generator_w[6] | (partial_sum_w[6] & (generator_w[5] | (partial_sum_w[5] & (generator_w[4] | (partial_sum_w[4] & (generator_w[3] | (partial_sum_w[3] & (generator_w[2] | (partial_sum_w[2] & (generator_w[1] | (partial_sum_w[1] & (generator_w[0] | (partial_sum_w[0] & carry_i)))))))))))))));

    assign sum_o[0] = operand1_i[0] ^ operand2_i[0] ^ carry_i;
    generate
        for(i = 1; i < 8; i = i + 1) begin : sum_block
            assign sum_o[i] = operand1_i[i] ^ operand2_i[i] ^ carry_intermediate[i-1];
        end
    endgenerate
endmodule
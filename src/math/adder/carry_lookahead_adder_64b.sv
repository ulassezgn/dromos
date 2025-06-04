module carry_lookahead_adder_64b
(
    input wire [63:0] operand1_i;
    input wire [63:0] operand2_i;
    input wire carry_i;

    output wire [63:0] sum_o;
    output wire carry_o;
)

    wire carry_intermediate;

    adder_carry_lookahead_32b M1(operand1_i[31:0], operand2_i[31:0], carry_i, sum_o[31:0], carry_intermediate);
    adder_carry_lookahead_32b M2(operand1_i[63:32], operand2_i[63:32], carry_intermediate, sum_o[63:32], carry_o);

endmodule
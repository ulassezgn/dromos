module carry_lookahead_adder_32b
(
    input wire [31:0] operand1_i;
    input wire [31:0] operand2_i;
    input wire carry_i;

    output wire [31:0] sum_o;
    output wire carry_o;
)

    wire carry_intermediate;

    carry_lookahead_adder_16b M1(operand1_i[15:0], operand2_i[15:0], carry_i, sum_o[15:0], carry_intermediate);
    carry_lookahead_adder_16b M2(operand1_i[31:16], operand2_i[31:16], carry_intermediate, sum_o[31:16], carry_o);

endmodule
module carry_lookahead_adder_16b
(
    input wire [15:0] operand1_i;
    input wire [15:0] operand2_i;
    input wire carry_i;

    output wire [15:0] sum_o;
    output wire carry_o;
)

    wire carry_intermediate;

    carry_lookahead_adder_8b M1(operand1_i[7:0], operand2_i[7:0], carry_i, sum_o[7:0], carry_intermediate);
    carry_lookahead_adder_8b M2(operand1_i[15:8], operand2_i[15:8], carry_intermediate, sum_o[15:8], carry_o);

endmodule
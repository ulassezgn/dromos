module carry_save_adder_param
#(
    BIT_WIDTH = 32;
)
(
    input wire [BIT_WIDTH-1:0] operand1_i;
    input wire [BIT_WIDTH-1:0] operand2_i;
    input wire [BIT_WIDTH-1:0] carry_i;

    output wire [BIT_WIDTH-1:0] sum_o;
    output wire [BIT_WIDTH-1:0] carry_o;
)

    genvar i;
    generate
        for(i = 0; i < BIT_WIDTH; i = i + 1) begin : FA_block
            full_adder FA(operand1_i[i], operand2_i[i], carry_i[i], sum_o[i], carry_o[i]);
        end
    endgenerate

endmodule
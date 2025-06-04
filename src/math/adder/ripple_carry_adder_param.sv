module ripple_carry_adder
#(
    parameter BIT_WIDTH = 32;
)
(
    input wire [BIT_WIDTH-1:0] operand1_i;
    input wire [BIT_WIDTH-1:0] operand2_i;
    input wire carry_i;
    
    output wire carry_o;
    output wire [BIT_WIDTH-1:0] sum_o;
)

    wire [BIT_WIDTH:0] carry_intermediate;

    assign carry_o = carry_intermediate[BIT_WIDTH];
    assign carry_intermediate[0] = carry_i;

    genvar i;
    generate
        for(i = 0; i < BIT_WIDTH; i = i + 1) begin : gen_add
            full_adder FA(operand1_i[i], operand2_i[i], carry_intermediate[i], sum_o[i], carry_intermediate[i+1]);
        end
    endgenerate

endmodule
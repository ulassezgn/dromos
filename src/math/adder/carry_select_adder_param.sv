module carry_select_adder
#(
    parameter BIT_WIDTH = 32;
)
(
    input wire [BIT_WIDTH-1:0] operand1_i;
    input wire [BIT_WIDTH-1:0] operand2_i;
    input wire carry_i;

    output wire [BIT_WIDTH-1:0] sum_o;
    output wire carry_o;
)
    localparam BIT_WIDTH_UNIT_MODULE = 4;
    localparam ITER_NUM = 8;

    
    wire [ITER_NUM-2:0] carry_out_in_0;
    wire [ITER_NUM-2:0] carry_out_in_1;
    wire [ITER_NUM-1:0] carry_intermediate;
    wire [BIT_WIDTH-1:0] sum_out_in_0;
    wire [BIT_WIDTH-1:0] sum_out_in_1;

    assign carry_o = carry_intermediate[ITER_NUM-1];
    ripple_carry_adder #(BIT_WIDTH_UNIT_MODULE) M1(operand1_i[BIT_WIDTH_UNIT_MODULE-1:0], operand2_i[BIT_WIDTH_UNIT_MODULE-1:0], carry_i, sum_o[BIT_WIDTH_UNIT_MODULE-1:0], carry_intermediate[0]);
    genvar i,j;
    generate
        for(i = 1; i < ITER_NUM; i = i + 1) begin : adders_block
            ripple_carry_adder #(BIT_WIDTH_UNIT_MODULE) A1(operand1_i[(i+1)*BIT_WIDTH_UNIT_MODULE-1:i*BIT_WIDTH_UNIT_MODULE], operand2_i[(i+1)*BIT_WIDTH_UNIT_MODULE-1:i*BIT_WIDTH_UNIT_MODULE], 1'b0, sum_out_in_0[(i+1)*BIT_WIDTH_UNIT_MODULE-1:i*BIT_WIDTH_UNIT_MODULE], carry_out_in_0[i-1]);
            ripple_carry_adder #(BIT_WIDTH_UNIT_MODULE) A2(operand1_i[(i+1)*BIT_WIDTH_UNIT_MODULE-1:i*BIT_WIDTH_UNIT_MODULE], operand2_i[(i+1)*BIT_WIDTH_UNIT_MODULE-1:i*BIT_WIDTH_UNIT_MODULE], 1'b1, sum_out_in_1[(i+1)*BIT_WIDTH_UNIT_MODULE-1:i*BIT_WIDTH_UNIT_MODULE], carry_out_in_1[i-1]);
            mux_2_1 MUX1(carry_intermediate[i-1], {carry_out_in_1[i-1], carry_out_in_0[i-1]}, carry_intermediate[i]); 
            for(j = 0; j < BIT_WIDTH_UNIT_MODULE; j = j + 1) begin : mux_block
                mux_2_1 MUX2(carry_intermediate[i-1], {sum_out_in_1[i * BIT_WIDTH_UNIT_MODULE + j], sum_out_in_0[i * BIT_WIDTH_UNIT_MODULE + j]}, sum_o[i * BIT_WIDTH_UNIT_MODULE + j]);
            end
        end
    endgenerate

endmodule
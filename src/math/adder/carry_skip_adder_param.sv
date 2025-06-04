module carry_skip_adder
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
    localparam ITER_NUM = BIT_WIDTH / BIT_WIDTH_UNIT_MODULE;

    wire [BIT_WIDTH-1:0] prop_w;
    wire [ITER_NUM:0] carry_intermediate_in;
    wire [ITER_NUM-1:0] carry_intermediate_out;

    assign carry_intermediate_in[0] = carry_i;
    assign carry_o = carry_intermediate_in[ITER_NUM];
    assign prop_w = operand1_i ^ operand2_i;

    wire [ITER_NUM-1:0] mux_selects_w;

    genvar i;
    generate
        for(i = 0; i < ITER_NUM; i = i + 1) begin : prop_block
            assign mux_selects_w[i] = &prop_w[(i+1)*BIT_WIDTH_UNIT_MODULE-1:i*BIT_WIDTH_UNIT_MODULE];
        end
    endgenerate

    generate
        for(i = 0; i < ITER_NUM; i = i + 1) begin : units_block
            ripple_carry_adder #(BIT_WIDTH_UNIT_MODULE) M(operand1_i[(i+1)*BIT_WIDTH_UNIT_MODULE-1:i*BIT_WIDTH_UNIT_MODULE], operand2_i[(i+1)*BIT_WIDTH_UNIT_MODULE-1:i*BIT_WIDTH_UNIT_MODULE], carry_intermediate_in[i], sum_o[(i+1)*BIT_WIDTH_UNIT_MODULE-1:i*BIT_WIDTH_UNIT_MODULE], carry_intermediate_out[i]);
            mux_2_1 MUX(mux_selects_w[i], {carry_intermediate_in[i], carry_intermediate_out[i]}, carry_intermediate_in[i+1]);
        end
    endgenerate
endmodule
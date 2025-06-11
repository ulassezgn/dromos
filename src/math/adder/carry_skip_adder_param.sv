module carry_skip_adder
#(
    parameter BIT_WIDTH = 32,
    parameter BLOCK_WIDTH = 4
)
(
    input wire [BIT_WIDTH-1:0] a,
    input wire [BIT_WIDTH-1:0] b,
    input wire cin,

    output wire [BIT_WIDTH-1:0] sum,
    output wire cout

);
    localparam NUM_BLOCKS = (BIT_WIDTH + BLOCK_WIDTH - 1) / BLOCK_WIDTH;

    wire [NUM_BLOCKS:0] carry;
    assign carry[0] = cin;

    wire [BIT_WIDTH-1:0] propagate;
    assign propagate = a ^ b;

    wire [NUM_BLOCKS-1:0] propagate_block;
    wire [NUM_BLOCKS-1:0] carry_out_block;

    genvar i;
    generate
        for (i = 0; i < NUM_BLOCKS; i = i + 1) begin : block_gen
            localparam LO = i * BLOCK_WIDTH;
            localparam HI = ((i+1)*BLOCK_WIDTH > BIT_WIDTH) ? (BIT_WIDTH-1) : ((i+1)*BLOCK_WIDTH - 1);
            localparam WIDTH = HI - LO + 1;

            wire [WIDTH-1:0] a_blk = a[HI:LO];
            wire [WIDTH-1:0] b_blk = b[HI:LO];
            wire [WIDTH-1:0] p_blk = propagate[HI:LO];
            wire [WIDTH-1:0] s_blk;

            ripple_carry_adder_param #(.BIT_WIDTH(WIDTH)) u_ripple(
                .a      (a_blk),
                .b      (b_blk),
                .cin    (carry[i]),
                .sum_o  (s_blk),
                .cout   (carry_out_block[i]);
            );

            assign sum[HI:LO] = s_blk;

            assign propagate_block[i] = (WIDTH == BLOCK_WIDTH) ? &p_blk : 1'b0;

            mux_2_1 u_mux (
                .sel (propagate_block[i]),
                .in  ({carry[i], carry_out_block[i]}),
                .out (carry[i+1])
            );
        end
    endgenerate

    assign cout = carry[NUM_BLOCKS];
endmodule
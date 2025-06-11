`timescale 1ns/1ps
import arithm_pkg::*;

module cla_parametric
#(
    DATA_WIDTH = 32
)
(
    input wire [DATA_WIDTH-1:0] a,
    input wire [DATA_WIDTH-1:0] b,
    input wire cin,

    output wire [DATA_WIDTH-1:0] sum,
    output wire cout
);

    localparam NUM_BLOCKS = (DATA_WIDTH + 3) / 4; 

    wire [NUM_BLOCKS:0] carry; // carry[0] = cin, carry[NUM_BLOCKS] = cout
    assign carry[0] = cin;

    genvar i;
    generate
        for(i = 0; i < NUM_BLOCKS; i = i + 1) begin : cla_blocks
            localparam LO = i*4;
            localparam HI = (i+1)*4 - 1;
            localparam WIDTH = (HI >= DATA_WIDTH) ? (DATA_WIDTH - LO) : 4;

            wire [3:0] a_block = (WIDTH == 4) ? a[HI:LO] : {{(4-WIDTH){1'b0}}, a[DATA_WIDTH-1:LO]}; 
            wire [3:0] b_block = (WIDTH == 4) ? b[HI:LO] : {{(4-WIDTH){1'b0}}, b[DATA_WIDTH-1:LO]};

            wire [3:0] sum_block;

            carry_lookahead_adder_4b cla_inst (
                .a    (a_block),
                .b    (b_block),
                .cin  (carry[i]),
                .sum  (sum_block),
                .cout (carry[i+1])
            );

            assign sum[HI:LO] = sum_block[WIDTH-1:0];
        end
    endgenerate
    
    assign cout = carry[NUM_BLOCKS];
endmodule
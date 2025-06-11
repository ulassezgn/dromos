module ripple_carry_adder_param
#(
    parameter BIT_WIDTH = 32
)
(
    input wire [BIT_WIDTH-1:0] a,
    input wire [BIT_WIDTH-1:0] b,
    input wire cin,
    
    output wire cout,
    output wire [BIT_WIDTH-1:0] sum_o
);

    wire [BIT_WIDTH:0] c_intermediate;

    assign cout = c_intermediate[BIT_WIDTH];
    assign c_intermediate[0] = cin;

    genvar i;
    generate
        for(i = 0; i < BIT_WIDTH; i = i + 1) begin : gen_add
            full_adder FA(a[i], b[i], c_intermediate[i], sum_o[i], c_intermediate[i+1]);
        end
    endgenerate

endmodule
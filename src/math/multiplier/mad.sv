module mad #(
    parameter INPUT_WIDTH  = 16,
    localparam OUTPUT_WIDTH = 2 * INPUT_WIDTH
)(
    input  wire [INPUT_WIDTH-1:0]   a,
    input  wire [INPUT_WIDTH-1:0]   b,
    input  wire [OUTPUT_WIDTH-1:0]  c,
    output wire [OUTPUT_WIDTH-1:0]  r
);

    wire [OUTPUT_WIDTH-1:0] partial_product;

    // Çarpma
    parallel_array_multiplier_param #(
        .A_WIDTH(INPUT_WIDTH),
        .B_WIDTH(INPUT_WIDTH)
    ) mul_inst (
        .a(a),
        .b(b),
        .p(partial_product)
    );

    // CLA toplama (partial_product + c)
    cla_parametric #(
        .DATA_WIDTH(OUTPUT_WIDTH)
    ) cla_add (
        .a    (partial_product),
        .b    (c),
        .cin  (1'b0),
        .sum  (r),
        .cout ()
    );

endmodule

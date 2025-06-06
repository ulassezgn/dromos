module post_processing_param
    #(
        parameter BIT_WIDTH = 32
    )
    (
        input wire [BIT_WIDTH-1:0] prop_i,
        input wire [BIT_WIDTH-1:0] carry_i,
        output wire [BIT_WIDTH-1:0] sum_o
    );

    assign sum_o = prop_i ^ carry_i;
endmodule

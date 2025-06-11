`timescale 1ns/1ps
module xdot
#(
    localparam VEC_WIDTH = 4,
    localparam INPUT_WIDTH = 16,
    localparam OUTPUT_WIDTH = 2*INPUT_WIDTH
)
(
    input wire [INPUT_WIDTH-1:0] x_in [VEC_WIDTH],
	input wire [INPUT_WIDTH-1:0] y_in [VEC_WIDTH],

    output wire [OUTPUT_WIDTH-1:0] z_out
);

    wire [OUTPUT_WIDTH-1:0] r_intermediate [VEC_WIDTH];

    assign z_out = r_intermediate[VEC_WIDTH-1];
    generate
        genvar i;
        for(i = 0; i < VEC_WIDTH; i = i + 1) begin
            if(i == 0) begin 
                mad #(INPUT_WIDTH)  (
                    .a(x_in[0]),
                    .b(y_in[0]),
                    .c('0),
                    .r(r_intermediate[0])
                );
            end else begin
                mad #(INPUT_WIDTH)  (
                    .a(x_in[i]),
                    .b(y_in[i]),
                    .c(r_intermediate[i-1]),
                    .r(r_intermediate[i])
                );                
            end
        end
    endgenerate
endmodule
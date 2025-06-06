`timescale 1ns/1ps
module counter_param 
#(
    parameter DATA_WIDTH = 32
)
(
    input wire clk_i,
    input wire rstn_i,
    input wire inc_i,
    output reg [DATA_WIDTH-1:0] value_o
);
    always @(posedge clk_i, negedge rstn_i) begin
        if(rstn_i == 0) begin
            value_o <= {DATA_WIDTH{1'b0}};
        end else begin
            if(inc_i == 1) begin
                value_o <= value_o + {{DATA_WIDTH-1{1'b0}}, {1'b1}};
            end else begin
                value_o <= value_o;
            end
        end
    end
endmodule
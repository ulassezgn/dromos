`timescale 1ns/1ps
import arithm_pkg::*;

module sync_fifo
#(
    parameter DATA_WIDTH = 8,
    parameter DEPTH = 16
)
(
    input wire clk_i,
    input wire rstn_i,

    input wire valid_i, // write enable signal
    input wire [DATA_WIDTH-1:0] wr_data_i,
    output wire ready_i, // !full signal

    input wire ready_o,
    output wire [DATA_WIDTH-1:0] rd_data_o,
    output wire valid_o 
);

    localparam ADDR_WIDTH = log2ceil(DEPTH);

    wire wr_en;
    wire inc_wr_ptr, inc_rd_ptr;
    reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];
    wire [ADDR_WIDTH-1:0] wr_ptr, rd_ptr, next_wr_ptr;

    // reg [DATA_WIDTH-1:0] rd_reg;
    counter_param #(ADDR_WIDTH) wr_ptr_cnt(clk_i, rstn_i, inc_wr_ptr, wr_ptr);
    counter_param #(ADDR_WIDTH) rd_ptr_cnt(clk_i, rstn_i, inc_rd_ptr, rd_ptr);
    
    assign next_wr_ptr = (wr_ptr == DEPTH-1) ? '0 : (wr_ptr + 1);
    assign rd_data_o = mem[rd_ptr];

    always @(posedge clk_i, negedge rstn_i) begin
        if(rstn_i == 0) begin
            mem <= '{default:0};
            rd_reg <= 0;
        end else begin
            if(wr_en) begin
                mem[wr_ptr] <= wr_data_i;
            end
            // if(inc_rd_ptr) begin
            //     rd_reg <= rd_data_o;
            // end else begin
            //     rd_reg <= rd_reg;
            // end
        end
    end

    assign ready_i = ~(next_wr_ptr == rd_ptr) || inc_rd_ptr;
    assign valid_o = ~(wr_ptr == rd_ptr);
    assign inc_wr_ptr = wr_en;
    assign inc_rd_ptr = ready_o && valid_o;
    assign wr_en = ready_i && valid_i;

endmodule
`timescale 1ns/1ps
import arithm_pkg::*;
import conversion_pkg::*;

module async_fifo
#(
    parameter DATA_WIDTH = 32,
    parameter DEPTH = 8
)
(
    // Write side (producer) clock & reset
    input wire wr_clk_i,
    input wire wr_rstn_i,
    input wire wr_valid_i,
    input wire [DATA_WIDTH-1:0] wr_data_i,
    output wire wr_ready_i,

    // Read side (consumer) clock & reset
    input wire rd_clk_i,
    input wire rd_rstn_i,
    input wire rd_ready_o,
    output wire [DATA_WIDTH-1:0] rd_data_o,
    output wire rd_valid_o

);

    localparam ADDR_WIDTH = log2ceil(DEPTH);

    wire inc_wr_ptr_bin, inc_rd_ptr_bin;
    wire [ADDR_WIDTH-1:0] wr_ptr_bin, rd_ptr_bin, wr_ptr_gray, rd_ptr_gray;
    wire [ADDR_WIDTH-1:0] wr_ptr_gray_next;

    reg [ADDR_WIDTH-1:0] rd_ptr_gray_sync1_wr, rd_ptr_gray_sync2_wr;
    reg [ADDR_WIDTH-1:0] wr_ptr_gray_sync1_rd, wr_ptr_gray_sync2_rd;

    reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];
    counter_param #(ADDR_WIDTH) wr_ptr_cnt_bin(wr_clk_i, wr_rstn_i, inc_wr_ptr_bin, wr_ptr_bin);
    counter_param #(ADDR_WIDTH) rd_ptr_cnt_bin(rd_clk_i, rd_rstn_i, inc_rd_ptr_bin, rd_ptr_bin);
    
    assign wr_ptr_gray = bin2gray(wr_ptr_bin);
    assign wr_ptr_gray_next = bin2gray(wr_ptr_bin + 1);

    assign rd_ptr_gray = bin2gray(rd_ptr_bin);

    assign rd_data_o = mem[rd_ptr_bin];

    always @(posedge wr_clk_i, negedge wr_rstn_i) begin
        if(!wr_rstn_i) begin
            rd_ptr_gray_sync1_wr <= '0;
            rd_ptr_gray_sync2_wr <= '0;
        end else begin
            rd_ptr_gray_sync1_wr <= rd_ptr_gray;
            rd_ptr_gray_sync2_wr <= rd_ptr_gray_sync1_wr;
            if(wr_valid_i && wr_ready_i)
                mem[wr_ptr_bin] <= wr_data_i;
        end
    end

    always @(posedge rd_clk_i, negedge rd_rstn_i) begin
        if(!rd_rstn_i) begin 
            wr_ptr_gray_sync1_rd <= '0;
            wr_ptr_gray_sync2_rd <= '0;
        end else begin
            wr_ptr_gray_sync1_rd <= wr_ptr_gray;
            wr_ptr_gray_sync2_rd <= wr_ptr_gray_sync1_rd;
        end
    end

    assign inc_wr_ptr_bin = wr_ready_i && wr_valid_i;
    assign inc_rd_ptr_bin = rd_ready_o && rd_valid_o;

    assign wr_ready_i = (wr_ptr_gray_next != rd_ptr_gray_sync2_wr);
    assign rd_valid_o = (bin2gray(rd_ptr_bin) != wr_ptr_gray_sync2_rd);

endmodule
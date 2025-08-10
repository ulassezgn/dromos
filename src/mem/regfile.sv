// 32x32b register file with x0 hardwired to 0
// Async read, sync write, simple write-first bypass

`timescale 1ns/1ps

module regfile #(
    parameter int XLEN = 32
)   (
    input logic             clk_i,
    input logic             rstn_i,

    input logic             we_i,
    input logic [4:0]       waddr_i,
    input logic [XLEN-1:0]  wdata_i,

    input logic [4:0]       raddr_a_i,
    output logic [XLEN-1:0] rdata_a_i, 

    input logic [4:0]       raddr_b_i,
    output logic [XLEN-1:0] rdata_b_i
);

    logic [XLEN-1:0] regs [31:0];
    
    // synchronous write, x0 is read-only zero
    always_ff @(posedge clk, negedge rstn_i) begin
        if(!rstn_i) begin
            integer i;
            for(i = 0; i < 32; i = i + 1) regs[i] <= '0;
        end else if (we_i && (waddr_i != 5'd0)) begin
            regs[waddr_i] <= wdata_i;
        end
    end

     // async read with simple write-first bypass for port A
    always_comb begin
        if(raddr_a_i == 5'd0) rdata_a_i = '0;
        else if(we_i && (waddr_i == raddr_a_i) && (waddr_i != 5'd0)) rdata_a_i = wdata_i;
        else rdata_a_i = regs[waddr_i];
    end

    // async read with simple write-first bypass for port B
    always_comb begin
        if(raddr_b_i == 5'd0) rdata_b_i = '0;
        else if(we_i && (waddr_i == raddr_b_i) && (waddr_i != 5'd0)) rdata_b_i = wdata_i;
        else rdata_b_i = regs[waddr_i];
    end


endmodule
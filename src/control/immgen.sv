`timescale 1ns/1ps
import imm_pkg::*;

module immgen #(
    parameter int XLEN = 32
) (
    input logic [XLEN-1:0] instr_i,

    output logic [XLEN-1:0] imm_i,
    output logic [XLEN-1:0] imm_s, 
    output logic [XLEN-1:0] imm_b,
    output logic [XLEN-1:0] imm_u,
    output logic [XLEN-1:0] imm_j
);

    assign imm_i = {(XLEN-12){instr_i[31]}, instr_i[31:20]};
    assign imm_s = {(XLEN-12){instr_i[31]}, instr_i[31:25], instr_i[11:7]};
    assign imm_u = {{instr_i[31:12]}, 12'b0};
    assign imm_b = {(XLEN-12){instr_i[31]}, instr_i[31], instr_i[7], instr_i[30:25], instr_i[11:8], 1'b0};
    assign imm_j = {(XLEN-21){instr_i[31]}, instr_i[31], instr_i[19:12], instr_i[20], instr_i[30:21], 1'b0};

endmodule
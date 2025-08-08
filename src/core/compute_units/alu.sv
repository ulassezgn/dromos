// Minimal RV32I-friendly ALU

`timescale 1ns/1ps
import alu_pkg::*;
import arithm_pkg::*;

module alu #(
    parameter int XLEN = 32
)   (
    input logic [XLEN-1:0]  a,
    input logic [XLEN-1:0]  b,
    input alu_op_e          alu_op,
    output logic [XLEN-1:0] y,
    output logic            cmp_eq,
    output logic            cmp_lt,
    output logic            cmp_ltu
);

    localparam int SHAMT_W = log2ceil(XLEN);

    logic lt_signed, lt_unsigned;

    assign cmp_eq       = (a == b);
    assign lt_signed    = ($signed(a) < $signed(b));
    assign lt_unsigned  = (a < b);
    assign cmp_lt       = lt_signed;
    assign cmp_ltu      = lt_unsigned;
    always_comb begin
        unique case (alu_op)
            ALU_ADD:    y = a + b;
            ALU_SUB:    y = a - b;
            ALU_AND:    y = a & b;
            ALU_OR:     y = a | b;
            ALU_XOR:    y = a ^ b;
            ALU_SLL:    y = a << b[SHAMT_W-1:0];
            ALU_SRL:    y = a >> b[SHAMT_W-1:0];
            ALU_SRA:    y = $signed(a) >>> b[SHAMT_W-1:0];
            ALU_SLT:    y = {{(XLEN-1){1'b0}}, lt_signed}
            ALU_SLTU:   y = {{(XLEN-1){1'b0}}, lt_unsigned}
            ALU_COPYB:  y = b;
            default:    y = '0;
        endcase
    end
endmodule
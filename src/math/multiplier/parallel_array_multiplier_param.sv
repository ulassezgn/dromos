`timescale 1ns/1ps
import arithm_pkg::*;

module parallel_array_multiplier_param
#(
	parameter WIDTH_A = 16,
	parameter WIDTH_B = 16
)
(
	input wire [WIDTH_A-1:0] A,
	input wire [WIDTH_B-1:0] B,
	output wire [WIDTH_A+WIDTH_B-1:0] Y
);

	wire [WIDTH_A+WIDTH_B-1:0] partial [0:WIDTH_B-1];

	genvar i;
	generate
		for(i = 0; i < WIDTH_B; i = i + 1) begin: gen_partials
			assign partial[i] = B[i] ? (A << i) : {(WIDTH_A + WIDTH_B){1'b0}};
		end
	endgenerate


	localparam ELM_NUM = WIDTH_B;
	localparam MAX_LEVELS = log2ceil(ELM_NUM);

	wire [WIDTH_A+WIDTH_B-1:0] tree [0:MAX_LEVELS][0:ELM_NUM-1];
	
	generate
		for(i = 0; i < ELM_NUM; i = i + 1) begin: assign_initial
			assign tree[0][i] = partial[i];
		end
	endgenerate

	genvar level, j;
	generate
		for(level = 0; level < MAX_LEVELS; level = level + 1) begin : levels
			localparam integer ELM_NUM_IN_CURR_LVL = (ELM_NUM + (1 << level) -1) >> level;
			localparam integer ELM_NUM_IN_NEXT_LVL = (ELM_NUM_IN_CURR_LVL + 1) >> 1;
		
			for(j = 0; j < ELM_NUM_IN_NEXT_LVL; j = j+1) begin: adder_stage
				if((2*j + 1) < ELM_NUM_IN_CURR_LVL) begin
					cla_parametric #(WIDTH_A+WIDTH_B) adder_inst(.a(tree[level][2*j]), .b(tree[level][2*j+1]), .cin(1'b0), .sum(tree[level+1][j])); 
				end else begin
					assign tree[level+1][j] = tree[level][2*j];
				end
			end
		end
	endgenerate

	assign Y = tree[MAX_LEVELS][0];
endmodule
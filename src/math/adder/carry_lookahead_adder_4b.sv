module carry_lookahead_adder_4b (
    input  wire [3:0] a,     // Operand A
    input  wire [3:0] b,     // Operand B
    input  wire       cin,   // Carry-in
    output wire [3:0] sum,   // Sum output
    output wire       cout   // Carry-out
);

    // Generate and propagate
    wire [3:0] g;  // generate = a & b
    wire [3:0] p;  // propagate = a ^ b
    wire [4:0] c;  // internal carry wires

    assign g = a & b;
    assign p = a ^ b;

    // Carry lookahead logic
    assign c[0] = cin;

    assign c[1] = g[0] | (p[0] & c[0]);
    assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c[0]);
    assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | 
                            (p[2] & p[1] & p[0] & c[0]);
    assign c[4] = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | 
                            (p[3] & p[2] & p[1] & g[0]) |
                            (p[3] & p[2] & p[1] & p[0] & c[0]);

    // Final sum and carry out
    assign sum  = p ^ c[3:0];
    assign cout = c[4];

endmodule

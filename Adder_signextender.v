module signextender (input [15:0] a,output [31:0] b);
assign b = {{16{a[15]}},a};
 
endmodule

module full_adder (
    input  wire a,
    input  wire b,
    input  wire cin,
    output wire sum,
    output wire cout
);
    wire ab_sum, a1, a2, a3;
 
    xor(ab_sum, a, b);
    xor(sum, ab_sum, cin);
 
    and(a1, a, b);
    and(a2, b, cin);
    and(a3, a, cin);
    or(cout, a1, a2, a3);
endmodule
 

module ripple_adder_33 (
    input  wire [32:0] a,
    input  wire [32:0] b,
    input  wire        cin,
    output wire [32:0] sum,
    output wire        cout
);
    wire [33:0] carry;  // Carry signals between stages
    assign carry[0] = cin;
    genvar i;
    generate
        for (i = 0; i < 33; i = i + 1) begin : adder_stage
            full_adder fa (
                .a    (a[i]),
                .b    (b[i]),
                .cin  (carry[i]),
                .sum  (sum[i]),
                .cout (carry[i+1])
            );
        end
    endgenerate
    assign cout = carry[33];
endmodule

module smartadder(input [31:0] pc,input [31:0] jump,output [31:0] c);
wire [32:0] pci={1'b0,pc};
wire [32:0] jumpi={jump[31],jump};
wire [32:0] sum;
wire cout;
ripple_adder_33 good(pci,jumpi,1'b0,sum,cout);
assign c=sum[31:0];
endmodule
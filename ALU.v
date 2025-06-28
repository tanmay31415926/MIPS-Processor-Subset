
 
 
module alu0_30(
    input a,
    input b,
    input Binvert,
    input [1:0] Operation,
    input CarryIn,
    input Less,
    output Result,
    output CarryOut
);
    wire b_input;
    wire and_result;
    wire or_result;
    wire sum;
    wire carry1;
    wire carry2;
    wire p;
 
    mux2_1 b_mux(b_input,b,~b,Binvert);
 
    and a1(and_result,a,b);
 
    or o1(or_result,a,b);
 
    xor x1(p,a,b_input);
    xor x2(sum,p,CarryIn);
    and a2(carry1,a,b_input);
    and a3(carry2,CarryIn,p);
    or o2(CarryOut,carry1,carry2);
 
   mux4_1 res_mux(
        .out(Result),
        .a(and_result),
        .b(or_result),
        .c(sum),
        .d(Less),
        .sel(Operation)
    );
 
endmodule
 
 
module alu31(
    input a,
    input b,
    input Binvert,
    input [1:0] Operation,
    input CarryIn,
    output Result,
    output CarryOut,
    output Set,
    output Overflow
);
    wire b_input;
    wire and_result;
    wire or_result;
    wire sum;
    wire carry1;
    wire carry2;
    wire p;
 
    mux2_1 b_mux(b_input,b,~b,Binvert);
 
    and a1(and_result,a,b);
 
    or o1(or_result,a,b);
 
    xor x1(p,a,b_input);
    xor x2(sum,p,CarryIn);
 
    and a2(carry1,a,b_input);
    and a3(carry2,CarryIn,p);
    or o2(CarryOut,carry1,carry2);
 
    xor x3(Overflow,CarryIn,CarryOut);
    assign Set = sum;
 
    mux4_1 res_mux(
        .out(Result),
        .a(and_result),
        .b(or_result),
        .c(sum),
        .d(1'b0),
        .sel(Operation)
    );
endmodule
 
 
 
 
module ALU(
    input [31:0] a,
    input [31:0] b,
    input [2:0] ALUControl,
    output [31:0] Result,
    output Zero,
    output Overflow
);
    wire [31:0] carry;
    wire set;
    wire Binvert;
 
    assign Binvert = ALUControl[2];
 
    alu0_30 alu0(
        .a(a[0]),
        .b(b[0]),
        .Binvert(Binvert),
        .Operation(ALUControl[1:0]),
        .CarryIn(Binvert),
        .Less(set),
        .Result(Result[0]),
        .CarryOut(carry[0])
    );
 
    genvar i;
    generate
        for (i = 1; i < 31; i = i + 1) begin: alu_loop
            alu0_30 alu1(
                .a(a[i]),
                .b(b[i]),
                .Binvert(Binvert),
                .Operation(ALUControl[1:0]),
                .CarryIn(carry[i-1]),
                .Less(1'b0),
                .Result(Result[i]),
                .CarryOut(carry[i])
            );
        end
    endgenerate
 
    alu31 alu31(
        .a(a[31]),
        .b(b[31]),
        .Binvert(Binvert),
        .Operation(ALUControl[1:0]),
        .CarryIn(carry[30]),
        .Result(Result[31]),
        .CarryOut(carry[31]),
        .Set(set),
        .Overflow(Overflow)
    );
 
    assign Zero = (Result == 32'b0);
endmodule
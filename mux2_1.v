
module mux2_1(
    output out,
    input a,
    input b,
    input sel
);
    assign out = sel ? b : a;
endmodule

module mux_32bit(output [31:0] out, input [31:0] a, input [31:0] b, input sel);
    assign out = sel ? b : a;
endmodule


module mux_5bit(output [4:0] out, input [4:0] a, input [4:0] b, input sel);      
    assign out = sel ? b : a;
    endmodule 
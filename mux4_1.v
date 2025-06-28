module mux4_1(
    output out,
    input a,
    input b,
    input c,
    input d,
    input [1:0] sel
);
    wire m1, m2;
 
    mux2_1 mux1(m1, a, b, sel[0]);
    mux2_1 mux2(m2, c, d, sel[0]);
    mux2_1 mux3(out, m1, m2, sel[1]);
 
endmodule
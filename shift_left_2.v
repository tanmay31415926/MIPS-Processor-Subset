module shift_left_2_28bit (
    input  wire [25:0] in,
    output wire [27:0] out
);
 
    assign out = {in, 2'b00}; 
 
endmodule


module shift_left_2_32bit (
    input  wire [31:0] in,
    output wire [31:0] out
);
 
    assign out = {in[29:0], 2'b00}; 
 
endmodule
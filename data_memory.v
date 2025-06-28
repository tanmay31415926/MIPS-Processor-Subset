module data_memory (
    input  wire        clk,
    input  wire        mem_read,
    input  wire        mem_write,
    input  wire [31:0] address,
    input  wire [31:0] write_data,
    output wire [31:0] read_data,
    [31:0] mem1, [31:0] mem2
);
 
    reg [31:0] memory [0:255];  // 256 words = 1 KB data memory
    assign mem1 = memory[100];
    assign mem2 = memory[200];
    assign read_data = (mem_read) ? memory[address[9:2]] : 32'b0;
    initial begin
//    
    memory[26]=32'd5;
    memory[0]=32'd10;
    memory[25]=32'd14;
    end
    
    // Write operation on positive clock edge
    always @(posedge clk) begin
        if (mem_write) begin
            memory[address[9:2]] <= write_data;
        end
    end
 
endmodule
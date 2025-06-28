module register_file #(
    parameter REG_WIDTH = 32,
    parameter REG_COUNT = 32,
    parameter REG_ADDR_WIDTH = 5  
)(
    input wire clk,
    input wire [REG_ADDR_WIDTH-1:0] read_reg1,
    input wire [REG_ADDR_WIDTH-1:0] read_reg2,
    input wire [REG_ADDR_WIDTH-1:0] write_reg,
    input wire [REG_WIDTH-1:0] write_data,
    input wire writeEnable,
    output wire [REG_WIDTH-1:0] read_data1,
    output wire [REG_WIDTH-1:0] read_data2,
    [31:0] reg1, [31:0] reg2,[31:0] reg3,[31:0] reg4,[31:0] reg5
);
 
    
    reg [REG_WIDTH-1:0] registers [0:REG_COUNT-1];
    initial begin registers[0] = 32'd0;registers[1]=32'd1;end
    assign read_data1 = registers[read_reg1];
    assign read_data2 = registers[read_reg2];
 
    assign reg1 = registers[2];
    assign reg2 = registers[3];
    assign reg3 = registers[4];
    assign reg4 = registers[6];
    assign reg5 = registers[7];
    always @(posedge clk) begin
        if ( writeEnable) begin
            registers[write_reg] <= write_data;
        end
    end
 
endmodule

module single_reg (clk,new_addr,pc);
input clk;
input [31:0] new_addr;
output reg [31:0] pc;
initial begin
    pc <= 32'b0;
end
always @(posedge clk)   
    pc <= new_addr;
  
endmodule
 
 
 
 
 
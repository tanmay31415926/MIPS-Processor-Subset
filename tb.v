`timescale 1ns / 1ps

module Top_Module_tb;

    // Clock signal
    reg clk;

    // Wires to observe the outputs
    wire [31:0] reg1, reg2, reg3, reg4, reg5;
    wire [31:0] mem1, mem2,pc,pc4;
 wire [31:0] new_addr1,new_addr2,new_addr3;
 wire regWrite, regDest, jump, jal, branch, MemToReg, MemWrite, ALUsrc, zerodetect;
    // Instantiate the DUT (Device Under Test)
    Top_Module DUT(
    clk, reg1, reg2, reg3, reg4, reg5, mem1, mem2, pc, new_addr1, new_addr2, new_addr3, pc4,
    regWrite, regDest, jump, jal, branch, MemToReg, MemWrite, ALUsrc, zerodetect
    );


    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns clock period
    end

    // Run simulation and monitor outputs
    initial begin
        $display("Time\tReg1\tReg2\tReg3\tReg4\tReg5\tMem1\tMem2");
        $monitor("%0t\t%0d\t%0d\t%0d\t%0d\t%0d\t%0d\t%0d",
                 $time, reg1, reg2, reg3, reg4, reg5, mem1, mem2);

        #1000;  // Run simulation for 200ns
        $finish;
    end

endmodule

# Objective
The objective is to design and implement a single-cycle 32-bit MIPS processor using Verilog. The processor supports a core subset of MIPS instructions including arithmetic, logic, memory access, and control flow operations. This report elaborates on the datapath design, individual modules, supported instructions, and testing methodology for the processor.

# Supported Instructions

The processor supports the following MIPS instructions: 
• Memory Access: lw, sw
• Arithmetic/Logical: add, sub, and, or, slt
• Control Transfer: beq, j, jal, jr


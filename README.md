# 1 Objective

The objective of this assignment is to design and implement a single-cycle 32-bit MIPS processor using Verilog. The processor supports a core subset of MIPS instructions including arithmetic, logic, memory access, and control flow operations. This report elaborates on the datapath design, individual modules, supported instructions, and testing methodology for the processor.

# 2 Supported Instructions

The processor supports the following MIPS instructions:

- **Memory Access**: `lw`, `sw`
- **Arithmetic/Logical**: `add`, `sub`, `and`, `or`, `slt`
- **Control Transfer**: `beq`, `j`, `jal`, `jr`

**R-type**: Used for arithmetic/logical operations and `jr`.  
**Format**: `opcode(6) rs(5) rt(5) rd(5) shamt(5) funct(6)`  
**Example**:  
```assembly
add $t0, $s1, $s2 → 000000 10001 10010 01000 00000 100000

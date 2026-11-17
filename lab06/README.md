# Lab 6 - Arithmetic Logic Unit (ALU)

The 16-bit ALU of the didactic computer: arithmetic, logic and shift operations, and the condition flags they set.

**Handout:** [`materials/labs/lab06-alu.pdf`](../materials/labs/lab06-alu.pdf)

## Exercises

| # | Exercise | Description | Files |
|---|----------|-------------|-------|
| 1 | [ALU ADC](ex1-alu-adc/) | ADC (`in1 + in2 + carry`) in the ALU, with the P, S, Z, O, C flags | `alu.v`, `alu_test.v` |
| 2 | [ALU operations](ex2-alu-ops/) | SBB1, NOT, OR, XOR, SHL and SAR in the ALU, with their flags, plus a self-checking testbench | `alu.v`, `alu_test.v` |

## Key concepts

- **ALU:** a 4-bit opcode selects the operation on one or two 16-bit operands. The result goes on the bus only while Enable is active, so instructions like `cmp` and `test` can update just the flags.
- **Flags:** C is the carry/borrow out of the MSB (unsigned overflow), S is the MSB of the result, Z is set when the result is 0, P is set for an even number of 1 bits (`~^result`), and O is the signed overflow.
- **Operations:** ADC, SBB1 and SBB2 set all flags; NOT, AND, OR and XOR set S, Z and P and always clear C and O; SHL/SAL, SHR and SAR put the shifted-out bit in C.
- **Shifts:** logical shifts (`<<`, `>>`) fill the free positions with zeros; SAR (`>>>`) replicates the sign bit and only works on `signed` operands.

# Lab 1 - Combinational Verilog (Structural)

Introduction to Verilog: modules, built-in gate primitives, wires, and module instantiation.

**Handout:** [`materials/labs/lab01-verilog-combinational-structural.pdf`](../materials/labs/lab01-verilog-combinational-structural.pdf)  
**Review:** [`materials/labs/lab00-review-digital-logic.pdf`](../materials/labs/lab00-review-digital-logic.pdf) (adders in section 3)

## Exercises

| # | Exercise | Description | Files |
|---|----------|-------------|-------|
| 1 | [Full adder](ex1-full-adder/) | Full adder built from two half adders, structural description only | `full_adder.v`, `full_adder_test.v` |
| 2 | [4-bit adder](ex2-adder4/) | 4-bit ripple-carry adder built from the ex1 full adders, self-contained in one file | `adder4.v`, `adder4_test.v` |
| 3 | [N-bit adder](ex3-adder-n/) | N-bit adder built from 1-bit and 4-bit adders; N is assigned per student on Moodle | `adder.v` |
| 4 | [1-bit comparator](ex4-comp1/) | 1-bit comparator with three outputs; the relations are assigned per student on Moodle | `comp1.v` |

## Key concepts

- **Module:** a black box with ports; outputs are declared before inputs.
- **Primitives:** `and`, `or`, `xor`, `nand`, `nor`, `xnor`, `not`, `buf`. The output comes first: `and a1(out, in1, in2);`
- **Wires:** connect primitives and module instances, e.g. `wire [7:0] bus;`
- **Instantiation:** `half_adder ha0(.sum(s), .c_out(c), .a(a), .b(b));`

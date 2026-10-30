# Lab 3 - Combinational Verilog (Procedural)

Procedural behavioral description: `reg` variables, control constructs, and `always` blocks for combinational logic.

**Handout:** [`materials/labs/lab03-verilog-combinational-reg-always.pdf`](../materials/labs/lab03-verilog-combinational-reg-always.pdf)

## Exercises

| # | Exercise | Description | Files |
|---|----------|-------------|-------|
| 1 | [4-bit multiplier](ex1-multiplier4/) | 4-bit multiplier with an 8-bit product, written without the multiplication operator | `multiplier.v`, `multiplier_test.v` |
| 2 | [7-segment display](ex2-seven-seg/) | 7-segment decoder for the digits 0-9, written as a ROM in a combinational `always` block | `seven_seg.v`, `seven_seg_test.v` |

## Key concepts

- **`reg`:** a variable that can hold a value and be assigned inside `always`/`initial` blocks. Declaring one does not synthesize a hardware register.
- **`always @(*)`:** the block re-runs whenever any signal it reads changes. Prefer `*` over an explicit sensitivity list, which can miss signals and infer memory.
- **Control constructs:** `if`/`else`, `case`, `for`, `while`, `repeat`. Loops are synthesizable only with a fixed number of iterations.
- **Blocking assignments (`=`):** run in order, like C, and describe combinational logic. Every run of the block must assign every output, otherwise the circuit becomes sequential.
- **`wire` vs `reg`:** a `wire` is only driven by `assign` outside blocks; a `reg` is only assigned inside `always`/`initial`.

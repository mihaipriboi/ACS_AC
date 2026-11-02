# Lab 4 - Sequential Verilog

Sequential logic: edge-triggered `always` blocks, non-blocking assignments, flip-flops, and finite-state machines.

**Handout:** [`materials/labs/lab04-verilog-sequential-flipflops-debouncer.pdf`](../materials/labs/lab04-verilog-sequential-flipflops-debouncer.pdf)  
**Review:** [`materials/labs/lab00-review-digital-logic.pdf`](../materials/labs/lab00-review-digital-logic.pdf) (the "ba" sequence recognizer in section 6.1)

## Exercises

| # | Exercise | Description | Files |
|---|----------|-------------|-------|
| 1 | [FSM 'ba'](ex1-fsm-ba/) | Moore FSM that recognizes the "ba" sequence on a 1-bit character input | `ba.v`, `ba_test.v` |

## Key concepts

- **Edge-triggered `always`:** `always @(posedge clk)` runs on the rising edge of `clk`; `negedge` selects the falling edge.
- **Non-blocking assignments (`<=`):** all right-hand sides are evaluated first, then assigned together, so their order doesn't matter. Use `<=` for sequential logic and `=` for combinational logic.
- **D flip-flop:** holds its input between two clock edges; the reset can be checked synchronously or asynchronously.
- **FSM structure:** a sequential block holds the state, and a combinational block handles every state's outputs and transitions. Don't mix the two in one sensitivity list.
- **Debouncing:** a switch or button connects and disconnects several times before settling, which can cause false transitions unless the signal is debounced.

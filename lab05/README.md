# Lab 5 - Sequential Verilog (FSMs and Memory)

Finite-state machines (Mealy and Moore), registers, and RAM.

**Handout:** [`materials/labs/lab05-verilog-sequential-fsm-memory.pdf`](../materials/labs/lab05-verilog-sequential-fsm-memory.pdf)

## Exercises

| # | Exercise | Description | Files |
|---|----------|-------------|-------|
| 1a | [Mealy FSM](ex1a-mealy-fsm/) | 4-state Mealy FSM with a 2-bit input and an active-low reset, given by its state table | `mealy_fsm.v`, `mealy_fsm_test.v` |
| 1b | [Moore FSM](ex1b-moore-fsm/) | 3-state Moore FSM with a 1-bit input and an active-low reset; `y` is 1 only in S2 | `moore_fsm.v`, `moore_fsm_test.v` |
| 2 | [Sequential multiplier](ex2-sequential-multiplier/) | Parameterized register with `oe`/`we`, plus an FSM that stores `a` and `b`, multiplies them into a third register, and displays the product | `register.v`, `sequential_multiplier.v`, `sequential_multiplier_test.v` |
| 3 | [RAM reader](ex3-ram-reader/) | FSM that reads a provided block RAM at address `am_out` while `read` is high, with the data on `ram_out` within one clock cycle | `ram.v`, `ram_reader.v`, `ram_reader_test.v` |

## Key concepts

- **Mealy machine:** the outputs depend on both the current state and the inputs.
- **Moore machine:** the outputs depend only on the current state; the next state still depends on the inputs.
- **FSM structure:** a sequential block (`always @(posedge clk or negedge reset)`) holds the current state, and a combinational block (`always @(*)`) computes the next state and the outputs.
- **Register:** a group of n flip-flops that stores n bits; it supports reading (driving its stored value on the output) and writing (storing the value on the bus).
- **RAM:** volatile memory split into cells with addresses from 0 to N-1; larger than registers, but slower to access.

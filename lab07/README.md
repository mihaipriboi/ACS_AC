# Lab 7 - Simulation and Synthesis

Simulating Verilog designs with testbenches, and synthesizing them for an FPGA.

**Handout:** [`materials/labs/lab07-simulation-and-synthesis-fpga.pdf`](../materials/labs/lab07-simulation-and-synthesis-fpga.pdf)

## Exercises

| # | Exercise | Description | Files |
|---|----------|-------------|-------|
| 1 | [Syntax errors](ex1-syntax-errors/) | Fix the syntax errors in a per-student module (here: an FSM that reads a ROM and computes the sum and maximum) | `sintaxa.v` |

## Key concepts

- **Compile, elaborate, simulate:** compiling only proves the code is syntactically correct; elaboration builds the module hierarchy; simulation checks the behavior against expected outputs.
- **Testbench:** a module with a stimulus generator, an instance of the design under test (DUT), and a monitor that checks the outputs.
- **Timing in simulation:** `#n` delays, with the unit and precision set by `` `timescale ``; `$monitor`, `$display` and `$finish` control the output and the end of the simulation.
- **Waveforms:** `$dumpfile` / `$dumpvars` write a VCD file to inspect the signals graphically.
- **FPGA:** configurable logic blocks, interconnect and I/O, configured with a bitstream produced by synthesis and implementation.

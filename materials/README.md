# Course Materials

Everything in this folder was downloaded from Moodle and renamed for clarity. The documents themselves are in **Romanian** (except the English books and board manual).

## Lab handouts – [`labs/`](labs/)

| # | File | Topic | Main contents |
|---|------|-------|---------------|
| 0 | [lab00-review-digital-logic.pdf](labs/lab00-review-digital-logic.pdf) | Review | Logic gates, 4:1 MUX, half/full adders, ripple-carry adder, D flip-flop, FSMs ("ba" sequence detector, traffic light) |
| 1 | [lab01-verilog-combinational-structural.pdf](labs/lab01-verilog-combinational-structural.pdf) | Combinational Verilog | Why Verilog, modules, primitives (`and`, `or`, `xor`, …), wires & buses |
| 2 | [lab02-verilog-combinational-assign-parameters-testbenches.pdf](labs/lab02-verilog-combinational-assign-parameters-testbenches.pdf) | Combinational Verilog | `assign`, constants, operators, `parameter`, `` `define ``, testbenches (`initial`, `$display`) |
| 3 | [lab03-verilog-combinational-reg-always.pdf](labs/lab03-verilog-combinational-reg-always.pdf) | Combinational Verilog | `reg`, `if`/`case`, `always @(*)` |
| 4 | [lab04-verilog-sequential-flipflops-debouncer.pdf](labs/lab04-verilog-sequential-flipflops-debouncer.pdf) | Sequential Verilog | `always @(posedge clk)`, non-blocking assignments, D flip-flop, debouncer |
| 5 | [lab05-verilog-sequential-fsm-memory.pdf](labs/lab05-verilog-sequential-fsm-memory.pdf) | Sequential Verilog | Mealy & Moore FSMs, registers, RAM |
| 6 | [lab06-alu.pdf](labs/lab06-alu.pdf) | ALU | 16-bit ALU of the didactic computer, flags (C, S, Z, P, O), shifts |
| 7 | [lab07-simulation-and-synthesis-fpga.pdf](labs/lab07-simulation-and-synthesis-fpga.pdf) | Simulation & synthesis | Simulation flow, waveforms, FPGA architecture & configuration |
| 8 | [lab08-design-and-verification.pdf](labs/lab08-design-and-verification.pdf) | Design & verification | Hardware design methodology, clock synchronization, verification |
| 9 | [lab09-didactic-computer-architecture.pdf](labs/lab09-didactic-computer-architecture.pdf) | Didactic computer | 16-bit CISC architecture, registers, bus, memory, I/O |
| 10 | [lab10-didactic-computer-control-unit.pdf](labs/lab10-didactic-computer-control-unit.pdf) | Didactic computer | Control unit FSM, instruction encoding, register-direct addressing |
| 11 | [lab11-didactic-computer-addressing-modes.pdf](labs/lab11-didactic-computer-addressing-modes.pdf) | Didactic computer | Addressing modes |

## Lecture notes – [`lecture-notes/`](lecture-notes/)

*Arhitectura Calculatoarelor* – N. Țăpuș, T. Moisa, C. Morărescu.

| # | File | Topic |
|---|------|-------|
| 1 | [ac01-introduction.pdf](lecture-notes/ac01-introduction.pdf) | Introduction: structural & functional computer models, functional units, addressing modes |
| 2 | [ac02-describing-digital-systems-ahpl.pdf](lecture-notes/ac02-describing-digital-systems-ahpl.pdf) | Describing digital systems, the AHPL language |
| 3 | [ac03-data-representation.pdf](lecture-notes/ac03-data-representation.pdf) | Number codes, fixed/floating point, sign representation, alphanumeric data |
| 4 | [ac04-arithmetic-operations.pdf](lecture-notes/ac04-arithmetic-operations.pdf) | Fixed- and floating-point arithmetic |
| 5 | [ac05-didactic-computer-structure.pdf](lecture-notes/ac05-didactic-computer-structure.pdf) | Didactic computer: structure, instruction set, encoding, fetch/execute |
| 6 | [ac06-didactic-computer-assembly.pdf](lecture-notes/ac06-didactic-computer-assembly.pdf) | Assembly programming for the didactic computer |
| 7 | [ac07-io-subsystem-dma.pdf](lecture-notes/ac07-io-subsystem-dma.pdf) | I/O subsystem, programmed I/O, DMA, serial interface |
| 8 | [ac08-interrupt-system.pdf](lecture-notes/ac08-interrupt-system.pdf) | Interrupt system design |
| 9 | [ac09-microprogramming.pdf](lecture-notes/ac09-microprogramming.pdf) | Microprogrammed control unit |

## Books – [`books/`](books/)

| File | Description |
|------|-------------|
| [padmanabhan-design-through-verilog-hdl.pdf](books/padmanabhan-design-through-verilog-hdl.pdf) | T. R. Padmanabhan, B. Bala Tripura Sundari – *Design Through Verilog HDL* (IEEE Press, full book) |
| [harris-ch4-hardware-description-languages.pdf](books/harris-ch4-hardware-description-languages.pdf) | Harris & Harris – *Digital Design and Computer Architecture*, Ch. 4: HDLs (Verilog & VHDL side by side) |

## FPGA board – [`board/`](board/)

| File | Description |
|------|-------------|
| [nexys4ddr-reference-manual.pdf](board/nexys4ddr-reference-manual.pdf) | Digilent Nexys4 DDR reference manual (Artix-7 `XC7A100T-1CSG324C`) |
| [nexys4ddr-master.xdc](board/nexys4ddr-master.xdc) | Vivado constraints file (pin mapping); originally `Nexys4DDR_Master.xdc.txt` |

## Guides – [`guides/`](guides/)

| File | Description |
|------|-------------|
| [vivado-verification-and-debugging.pdf](guides/vivado-verification-and-debugging.pdf) | Vivado: testing with VIO, simulation, and ILA (Integrated Logic Analyzer) |

## Tools – [`tools/`](tools/)

| Folder | Description |
|--------|-------------|
| [evita-verilog/](tools/evita-verilog/) | EVITA Verilog – interactive Verilog tutorial (Windows, run `EVITA_VERILOG.exe`) |

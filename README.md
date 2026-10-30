# Computer Architecture Lab - University Politehnica of Bucharest (ACS)

This repository contains the laboratory assignments, implementations, and hardware designs for the **Computer Architecture (*Arhitectura Calculatoarelor*)** course at the Faculty of Automatic Control and Computers (ACS), National University of Science and Technology Politehnica Bucharest (Series AA, AB, AC).

## Repository layout

```text
ACS_AC/
├── lab01/                  # Lab 1 - Combinational Verilog (structural)
│   ├── ex1-full-adder/     # Full adder built from half adders
│   ├── ex2-adder4/         # 4-bit ripple-carry adder
│   ├── ex3-adder-n/        # N-bit adder
│   └── ex4-comp1/          # 1-bit comparator
├── lab03/                  # Lab 3 - Combinational Verilog (procedural)
│   ├── ex1-multiplier4/    # 4-bit multiplier without the * operator
│   └── ex2-seven-seg/      # 7-segment display decoder (ROM)
├── materials/              # Course materials downloaded from Moodle
│   ├── labs/               # Lab handouts (lab00 ... lab11)
│   ├── lecture-notes/      # Lecture notes (ac01 ... ac09)
│   ├── books/              # Verilog / HDL reference books
│   ├── board/              # Nexys4 DDR manual + constraints file
│   ├── guides/             # Vivado verification & debugging guide
│   └── tools/              # EVITA Verilog interactive tutorial
└── README.md
```

## Labs

| Lab | Topic | Folder |
|-----|-------|--------|
| 01 | Combinational Verilog - modules, primitives, wires | [`lab01/`](lab01/) |
| 03 | Combinational Verilog - `reg`, `if`/`case`, `always` blocks | [`lab03/`](lab03/) |

See [`materials/README.md`](materials/README.md) for the full list of lab handouts and lecture notes.

## Assignment workflow

Assignments are solved on Moodle (VPL). Each exercise folder contains:

- `task.md` - the task statement
- `*.v` - the module(s) to implement
- `*_test.v` - the testbench provided by the course

On Moodle, **Run** simulates the design against the testbench and **Evaluate** grades it.

## Tooling

- **Simulation:** Moodle VPL, Xilinx Vivado simulator, or [Icarus Verilog](https://steveicarus.github.io/iverilog/) locally:

  ```sh
  iverilog -o sim.vvp full_adder.v full_adder_test.v && vvp sim.vvp
  ```

- **Synthesis / FPGA:** Xilinx Vivado, targeting the Digilent **Nexys4 DDR** (Artix-7 `XC7A100T-1CSG324C`). Constraints: [`materials/board/nexys4ddr-master.xdc`](materials/board/nexys4ddr-master.xdc).

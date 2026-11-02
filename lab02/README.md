# Lab 2 - Combinational Verilog (Behavioral)

Behavioral description: continuous assignments, constants, operators, parameterized modules, and testbenches.

**Handout:** [`materials/labs/lab02-verilog-combinational-assign-parameters-testbenches.pdf`](../materials/labs/lab02-verilog-combinational-assign-parameters-testbenches.pdf)

## Exercises

| # | Exercise | Description | Files |
|---|----------|-------------|-------|
| 3 | [4-bit comparator](ex3-comp4/) | 4-bit comparator with three outputs; the relations and the number type are assigned per student on Moodle | `comp4.v` |
| 4 | [4:1 multiplexer](ex4-mux-4-1/) | 4:1 multiplexer with data inputs `i1`..`i4` and selects `s1`, `s2`; the selection table is assigned per student on Moodle | `mux4_1.v` |

## Key concepts

- **`assign`:** continuous assignment to a `wire` or an output; any change on the right-hand side propagates immediately. Driving the same variable from two `assign`s is an error.
- **Constants:** `[size]'[radix]value`, e.g. `8'b1010_0111` or `16'habcd`.
- **Operators:** relational (`<`, `<=`, `>`, `>=`, `==`, `!=`), reduction (`&a`, `~^a`), concatenation (`{b, 2'b01}`), and arithmetic shifts (`>>>`) on `signed` variables.
- **`parameter`:** a constant set per instance, e.g. a port width: `my_module #(.width(3)) inst(out, a, b);`
- **Testbenches:** `initial` blocks run once and are not synthesizable; `#n` separates input changes in time and `$display` prints values.

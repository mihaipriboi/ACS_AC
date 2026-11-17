# Găsește erorile de sintaxă

**Requested files:** `sintaxa.v`  
**Type of work:** Individual work

---

Fiecare student primește un alt modul Verilog, cu 3 erori de sintaxă (nu compilează). Codul modulului și descrierea lui apar în consola de la „Run” / „Evaluate”.

## Cerință

1. Copiați codul din enunț în `sintaxa.v`.
2. Corectați erorile de sintaxă, astfel încât fișierul să compileze și modulul să se comporte conform descrierii.
3. „Run” afișează erorile raportate de iverilog și o simulare scurtă; „Evaluate” compară modulul cu cel corect pe toate combinațiile de intrări.

## Enunțul din consolă

Codul de mai jos (mai multe module) nu compilează: conține 5 erori de sintaxă. Copiați-l în `sintaxa.v` și corectați-l, astfel încât fișierul să compileze, iar designul să se comporte conform descrierii.

**Descriere:** Automat care citește o memorie ROM și calculează suma și maximul: ROM-ul (submodul) are 6 locații (adresele 0..5) de 5 biți, cu conținutul: [0]=25, [1]=20, [2]=11, [3]=28, [4]=4, [5]=28. În IDLE, la `start` = 1 automatul inițializează adresa, suma și maximul cu 0 și trece în READ. În READ, câte o adresă pe ciclu (de la 0 la 5), adaugă valoarea citită la `sum` (8 biți) și actualizează `maxv` (5 biți) cu cea mai mare valoare citită până atunci; după adresa 5 trece în FIN. În FIN (un ciclu) `done` = 1, iar `sum` și `maxv` conțin rezultatele; apoi revine în IDLE. Reset sincron. Registrele se actualizează pe frontul crescător al lui `clk`; `rst` = 1 este reset sincron (are prioritate).

**Porturi:** `clk` (1 bit), `rst` (1 bit), `start` (1 bit) -> `sum` [7:0], `maxv` [4:0], `done` (1 bit)

```verilog
module circuit96_rom(
    input [2:0] addr,
    output [4:0] data
);
    always @(*) begin
        case (addr)
            3'd0: data = 5'd25;
            3'd1: data = 5'd20;
            3'd2: data = 5'd11;
            3'd3: data = 5'd28;
            3'd4: data = 5'd4;
            3'd5: data = 5'd28;
            default: data = 5'd0;
        endcase
    end

module circuit96(
    input clk,
    input rst
    input start,
    output [7:0] sum,
    output [4:0] maxv,
    output done
);
    parameter IDLE = 2'd0, READ = 2'd1, FIN = 2'd2;
    reg [1:0] state;
    reg [2:0] addr;
    reg [7:0] acc;
    reg [4:0] best;
    wire [4:0] data;
    circuit96_rom rom(.addr(addr), .data(data));
    always @(posedge clk) begin
        if (rst) begin
            state <= IDLE; addr <= 0; acc <= 0; best <= 0;
        end else begin
            case (state)
                IDLE: if (start) begin
                    addr <= 0;
                    acc <= 0; best <= 0; state <= READ;
                end
                READ: begin
                    acc <= acc + data;
                    if (data > best) best <= data;
                    if (addr == 3'd5) state <= FIN;
                    else addr <= addr + 1;
                end
                FIN: state <= IDLE;
                default: state <= IDLE;
            endcase
    end
    assign sum = acc;
    assign maxv = best
    assign done = (state == FIN);
endmodule
```

> **Hint-uri**
>
> - „Run” compilează `sintaxa.v` și afișează mesajele `iverilog` (cu numărul liniei).
> - O eroare poate muta mesajul pe linia următoare: citiți și linia de dinaintea celei indicate.
> - Modulul principal este `circuit96`; păstrați numele modulelor și porturile (nume și dimensiuni) din cod.
> - Erorile pot fi de mai multe feluri: `;` lipsă, paranteză lipsă, cuvânt cheie scris greșit, `end` / `endcase` / `endmodule` / `endgenerate` lipsă, semnal nedeclarat, `reg` lipsă la o ieșire atribuită într-un `always`, virgulă lipsă într-o listă de porturi.

## Instrucțiuni

Editați `sintaxa.v`. Apăsați **„Run”** pentru a compila și simula și **„Evaluate”** pentru a fi notat.

## Requested files

- `sintaxa.v`

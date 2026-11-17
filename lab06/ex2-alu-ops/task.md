# Operații în unitatea aritmetică-logică

**Requested files:** `alu.v`, `alu_test.v`  
**Type of work:** Individual work

---

Implementați următoarele operații în cadrul unității aritmetice-logice `alu.v`. Nu uitați indicatorii de condiții!

1. SBB1 (eng. SuBstract with Borrow; calculează `in1 - in2 - carry`)
2. NOT
3. OR
4. XOR (eng. eXclusive OR)
5. SHL (eng. Shift Left)
6. SAR (eng. Shift Arithmetic Right)

- Implementarea operației fără indicatorii de condiții oferă un punctaj de 50%.
- Demonstrarea funcționării corecte se face prin crearea unui fișier de test pentru modulul `alu`, asemănător tutorialului de simulare: completați `alu_test.v` și urmăriți valorile afișate în consolă la „Run”.

> **Hint-uri**
>
> - Descrierea indicatorilor pentru fiecare operație se găsește în tabelul de la pag. 9 și descrierile de la pag. 10 și 11 din [curs](https://ocw.cs.pub.ro/courses/_media/ac-is/resurse/ac5.pdf) sau în [textul laboratorului](https://ocw.cs.pub.ro/courses/ac-is/lab/lab07#descrierea_detaliata_a_indicatorilor_de_conditii).
> - Folosiți `case(opcode)` într-un `always @(*)`; pentru SAR operandul trebuie tratat ca număr cu semn (extensia bitului de semn).

## Convenții folosite la evaluare

- Modulul `alu` are parametrii `width = 16` și `flags_width = 5`; ieșirea `flags` are ordinea `{P, S, Z, O, C}` (P = bitul cel mai semnificativ).
- Codurile operațiilor (`opcode`): ADC = 0, SBB1 = 1, SBB2 = 2, NOT = 3, AND = 4, OR = 5, XOR = 6, SHL = 7, SHR = 8, SAR = 9.
- Ieșirea `out` este egală cu rezultatul când `oe = 1` (testarea se face cu `oe = 1`).
- Operațiile cu un singur operand (NOT, SHL, SAR) se testează cu `in2 = 0` și lucrează doar cu `in1`.
- Indicatori: C = transport/împrumut (la deplasări: bitul scos în afară), S = bitul cel mai semnificativ al rezultatului, Z = 1 dacă rezultatul este 0, P = 1 dacă rezultatul are un număr par de biți de 1 (XOR negat între biții rezultatului), O = depășire cu semn.
- Operațiile logice (NOT, OR, XOR) șterg C și O. La SHL, O = 1 doar dacă bitul de semn și-a schimbat valoarea. La SAR, C = bitul scos în afară, iar O = 0.
- Nota: 1 punct din 2 pentru rezultat (`out`), 1 punct din 2 pentru indicatori, la fiecare verificare.

## Instrucțiuni

Editați `alu.v` și `alu_test.v`. Apăsați **„Run”** pentru a simula proiectul cu `alu_test.v`. Apăsați **„Evaluate”** pentru a fi notat.

## Requested files

- `alu.v`
- `alu_test.v`

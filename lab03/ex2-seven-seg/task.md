# Afișaj cu 7 segmente

**Requested files:** `seven_seg.v`, `seven_seg_test.v`  
**Type of work:** Individual work

---

Implementați un modul de afișaj cu 7 segmente pentru numere în baza 10 (cifrele 0-9), sub forma unei memorii ROM descrise cu un bloc `always` combinațional.

Intrarea `number` are 4 biți, iar ieșirea `seven_seq` are 7 biți: bitul i comandă segmentul i, iar valoarea 1 aprinde segmentul. Segmentele sunt numerotate astfel: 0 - sus, 1 - dreapta sus, 2 - dreapta jos, 3 - jos, 4 - stânga jos, 5 - stânga sus, 6 - mijloc. Exemplu: pentru cifra 6, ieșirea are valoarea `7'b111_1101`.

> **Hint-uri**
>
> - Există o ieșire validă pentru fiecare intrare? Nu uitați de cazul `default`.
> - Se vor testa doar cifrele de la 0 la 9.

## Module și porturi

| Modul       | Intrări        | Ieșiri            |
|-------------|----------------|-------------------|
| `seven_seg` | `number [3:0]` | `seven_seq [6:0]` |

## Instrucțiuni

Editați `seven_seg.v`. Apăsați **„Run”** pentru a simula proiectul cu `seven_seg_test.v`. Apăsați **„Evaluate”** pentru a fi notat.

## Requested files

- `seven_seg.v`
- `seven_seg_test.v`

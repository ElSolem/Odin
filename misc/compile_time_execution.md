# MewTex: Comptime Evaluation 

# MewTex CTE Master Grid
// (36 base types × 8 symbols)

## MewTex: Key Graphs

| Opcode | Name  | Encoding           | Meaning / Notes                 |
| ------ | ----- | ------------------ | ------------------------------- |
| NIND   | Navz  | `${0}`             | No-Instruction-No-Data          |
| NISD   | Nilz  | `${1}`             | No-Instruction-Single-Data      |
| NIMD   | Infz  | `${-1}`            | No-Instruction-Multiple-Data    |
| NIPD   | Nanz  | `${-0}`            | No-Instruction-Proc-Data        |
| SIND   | Link  | `${+0.1}`          | Single-Instruction-No-Data      |
| SISD   | Wave  | `${-0.1}`          | Single-Instruction-Single-Data  |
| SIMD   | Path  | `${1 + i}`         | Single-Instruction-Multi-Data   |
| SIPD   | Save  | `${0xff}`          | Single-Instruction-Proc-Data    |
| MIND   | Rust  | `$"(:#:)"`         | Multi-Instruction-No-Data       |
| MISD   | Sick  | `${(:":)}`         | Multi-Instruction-Single-Data   |
| MIMD   | Grow  | `$[(:*:)]`         | Multi-Instruction-Multi-Data    |
| MIPD   | Risk  | `$<(:/:)>`         | Multi-Instruction-Proc-Data     |
| PIND   | Join  | `${[plex]}`        | Proc-Instruction-No-Data        |
| PISD   | Call  | `${[plex]}`        | Proc-Instruction-Single-Data    |
| PIMD   | Cast  | `${[plex]}`        | Proc-Instruction-Multiple-Data  |
| PIPD   | Fall  | `${[plex]}`        | Proc-Instruction-Proc-Data      |
| AIND   | Antz  | `$<[{(any)}]>`     | Atomic-Instruction-No-Data      |
| AISD   | Entz  | `$<[{(entity)}]>`  | Atomic-Instruction-Single-Data  |
| AIMD   | Ontz  | `$<[{(output)}]>`  | Atomic-Instruction-Multi-Data   |
| AIPD   | Intz  | `$<[{(input)}]>`   | Atomic-Instruction-Proc-Data    |
| QIND   | Comb  | `$<{?}>`           | Quantum-Instruction-No-Data     |
| QISD   | Hive  | `$<{.}>`           | Quantum-Instruction-Single-Data |
| QIMD   | Crib  | `$<{~}>`           | Quantum-Instruction-Multi-Data  |
| QIPD   | Nest  | `$<{!}>`           | Quantum-Instruction-Proc-Data   |
| RIND   | Rand  | `$#Rand.rand#`     | Random-Instruction-No-Data      |
| RISD   | Rend  | `$#Rand.rend#`     | Random-Instruction-Single-Data  |
| RIMD   | Rind  | `$#Rand.rind#`     | Random-Instruction-Multi-Data   |
| RIPD   | Rond  | `$#Rand.rond#`     | Random-Instruction-Proc-Data    |
| TIND   | Atom  | `$#Time.atom#`     | Time-Instruction-No-Data        |
| TISD   | Tick  | `$#Time.sys#`      | Time-Instruction-Single-Data    |
| TIMD   | Zeta  | `$#Time.delta#`    | Time-Instruction-Multiple-Data  |
| TIPD   | Stop  | `$#Time.step#`     | Time-Instruction-Proc-Data      |
| EIND   | Code  | `$(%code%)`        | Error-Instruction-No-Data       |
| EISD   | Data  | `${%data%}`        | Error-Instruction-Single-Data   |
| EIMD   | Hack  | `$[%hack%]`        | Error-Instruction-Multiple-Data |
| EIPD   | File  | `$<%file%>`        | Error-Instruction-Proc-Data     |
| ------ | ----- | ------------------ | ------------------------------- |

## Symbols
- `!` = Negate Signal/Address
- `@` = Context Signal/Address
- `#` = Type Address/Signal
- `$` = String Address/Signal
- `%` = Return Address/Signal
- `^` = Memory Reference/Address  
- `&` = Memory Reference/Signal  
- `?` = Value Address/Reference

// ---------------------------------------------

## NIND Family (Core Nulls)
// | Base | Type    | !     | @     | #     | $     | %     | ^       | &     | ?     |
// | ---- | ------- | ----- | ----- | ----- | ----- | ----- | ------- | ----- | ----- |
// | NIND | Navz    | !0x00 | @0x00 | #0x00 | $0x00 | %0x00 | ^"0x00" | &0x00 | ?0x00 |
// | NISD | Nilz    | !0x01 | @0x01 | #0x01 | $0x01 | %0x01 | ^"0x01" | &0x01 | ?0x01 |
// | NIMD | Infz    | !0x02 | @0x02 | #0x02 | $0x02 | %0x02 | ^"0x02" | &0x02 | ?0x02 |
// | NIPD | Nanz    | !0x03 | @0x03 | #0x03 | $0x03 | %0x03 | ^"0x03" | &0x03 | ?0x03 |
// |------|---------|-------|-------|-------|-------|-------|---------|-------|-------|

## SIND Family (Scalars)
// | Base | Type    | !     | @     | #     | $     | %     | ^       | &     | ?     |
// | ---- | ------- | ----- | ----- | ----- | ----- | ----- | ------- | ----- | ----- |
// | SIND | Link    | !0x04 | @0x04 | #0x04 | $0x04 | %0x04 | ^"0x04" | &0x04 | ?0x04 |
// | SISD | Wave    | !0x05 | @0x05 | #0x05 | $0x05 | %0x05 | ^"0x05" | &0x05 | ?0x05 |
// | SIMD | Path    | !0x06 | @0x06 | #0x06 | $0x06 | %0x06 | ^"0x06" | &0x06 | ?0x06 |
// | SIPD | Save    | !0x07 | @0x07 | #0x07 | $0x07 | %0x07 | ^"0x07" | &0x07 | ?0x07 |
// |------|---------|-------|-------|-------|-------|-------|---------|-------|-------|

## MIND Family (Data Structures)
// | Base | Type    | !     | @     | #     | $     | %     | ^       | &     | ?     |
// | ---- | ------- | ----- | ----- | ----- | ----- | ----- | ------- | ----- | ----- |
// | MIND | Rust    | !0x08 | @0x08 | #0x08 | $0x08 | %0x08 | ^"0x08" | &0x08 | ?0x08 |
// | MISD | Sick    | !0x09 | @0x09 | #0x09 | $0x09 | %0x09 | ^"0x09" | &0x09 | ?0x09 |
// | MIMD | Grow    | !0x0a | @0x0a | #0x0a | $0x0a | %0x0a | ^"0x0a" | &0x0a | ?0x0a |
// | MIPD | Risk    | !0x0b | @0x0b | #0x0b | $0x0b | %0x0b | ^"0x0b" | &0x0b | ?0x0b |
// |------|---------|-------|-------|-------|-------|-------|---------|-------|-------|

## PIND Family (Composite Types)
// | Base | Type    | !     | @     | #     | $     | %     | ^       | &     | ?     |
// | ---- | ------- | ----- | ----- | ----- | ----- | ----- | ------- | ----- | ----- |
// | PIND | Join    | !0x0c | @0x0c | #0x0c | $0x0c | %0x0c | ^"0x0c" | &0x0c | ?0x0c |
// | PISD | Call    | !0x0d | @0x0d | #0x0d | $0x0d | %0x0d | ^"0x0d" | &0x0d | ?0x0d |
// | PIMD | Cast    | !0x0e | @0x0e | #0x0e | $0x0e | %0x0e | ^"0x0e" | &0x0e | ?0x0e |
// | PIPD | Fall    | !0x0f | @0x0f | #0x0f | $0x0f | %0x0f | ^"0x0f" | &0x0f | ?0x0f |
// |------|---------|-------|-------|-------|-------|-------|---------|-------|-------|

## AIND Family (Agents/Entities)
// | Base | Type    | !     | @     | #     | $     | %     | ^       | &     | ?     |
// | ---- | ------- | ----- | ----- | ----- | ----- | ----- | ------- | ----- | ----- |
// | AIND | Antz    | !0x10 | @0x10 | #0x10 | $0x10 | %0x10 | ^"0x10" | &0x10 | ?0x10 |
// | AISD | Entz    | !0x11 | @0x11 | #0x11 | $0x11 | %0x11 | ^"0x11" | &0x11 | ?0x11 |
// | AIMD | Outz    | !0x12 | @0x12 | #0x12 | $0x12 | %0x12 | ^"0x12" | &0x12 | ?0x12 |
// | AIPD | Intz    | !0x13 | @0x13 | #0x13 | $0x13 | %0x13 | ^"0x13" | &0x13 | ?0x13 |
// |------|---------|-------|-------|-------|-------|-------|---------|-------|-------|

## QIND Family (Temporal / Media Controls)
// | Base | Type    | !     | @     | #     | $     | %     | ^       | &     | ?     |
// | ---- | ------- | ----- | ----- | ----- | ----- | ----- | ------- | ----- | ----- |
// | QIND | Comb    | !0x14 | @0x14 | #0x14 | $0x14 | %0x14 | ^"0x14" | &0x14 | ?0x14 |
// | QISD | Hive    | !0x15 | @0x15 | #0x15 | $0x15 | %0x15 | ^"0x15" | &0x15 | ?0x15 |
// | QIMD | Crib    | !0x16 | @0x16 | #0x16 | $0x16 | %0x16 | ^"0x16" | &0x16 | ?0x16 |
// | QIPD | Nest    | !0x17 | @0x17 | #0x17 | $0x17 | %0x17 | ^"0x17" | &0x17 | ?0x17 |
// |------|---------|-------|-------|-------|-------|-------|---------|-------|-------|

## RIND Family (Time / Signals)
// | Base | Type    | !     | @     | #     | $     | %     | ^       | &     | ?     |
// | ---- | ------- | ----- | ----- | ----- | ----- | ----- | ------- | ----- | ----- |
// | RIND | Rand    | !0x18 | @0x18 | #0x18 | $0x18 | %0x18 | ^"0x18" | &0x18 | ?0x18 |
// | RISD | Rend    | !0x19 | @0x19 | #0x19 | $0x19 | %0x19 | ^"0x19" | &0x19 | ?0x19 |
// | RIMD | Rind    | !0x1a | @0x1a | #0x1a | $0x1a | %0x1a | ^"0x1a" | &0x1a | ?0x1a |
// | RIPD | Rond    | !0x1b | @0x1b | #0x1b | $0x1b | %0x1b | ^"0x1b" | &0x1b | ?0x1b |
// |------|---------|-------|-------|-------|-------|-------|---------|-------|-------|

## TIND Family (Errors / Contexts)
// | Base | Type    | !     | @     | #     | $     | %     | ^       | &     | ?     |
// | ---- | ------- | ----- | ----- | ----- | ----- | ----- | ------- | ----- | ----- |
// | TIND | Atom    | !0x1c | @0x1c | #0x1c | $0x1c | %0x1c | ^"0x1c" | &0x1c | ?0x1c |
// | TISD | Tick    | !0x1d | @0x1d | #0x1d | $0x1d | %0x1d | ^"0x1d" | &0x1d | ?0x1d |
// | TIMD | Zeta    | !0x1e | @0x1e | #0x1e | $0x1e | %0x1e | ^"0x1e" | &0x1e | ?0x1e |
// | TIPD | Stop    | !0x1f | @0x1f | #0x1f | $0x1f | %0x1f | ^"0x1f" | &0x1f | ?0x1f |
// |------|---------|-------|-------|-------|-------|-------|---------|-------|-------|

## EIND Family (Errors / Contexts)
// | Base | Type    | !     | @     | #     | $     | %     | ^       | &     | ?     |
// | ---- | ------- | ----- | ----- | ----- | ----- | ----- | ------- | ----- | ----- |
// | EIND | Code    | !0xec | @0xec | #0xec | $0xec | %0xec | ^"0xec" | &0xec | ?0xec |
// | EISD | Data    | !0xed | @0xed | #0xed | $0xed | %0xed | ^"0xed" | &0xed | ?0xed |
// | EIMD | Hack    | !0xee | @0xee | #0xee | $0xee | %0xee | ^"0xee" | &0xee | ?0xee |
// | EIPD | File    | !0xef | @0xef | #0xef | $0xef | %0xef | ^"0xef" | &0xef | ?0xef |
// |------|---------|-------|-------|-------|-------|-------|---------|-------|-------|
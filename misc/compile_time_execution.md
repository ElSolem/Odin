# MewTex: Comptime Evaluation 

# MewTex CTE Master Grid
// (32 base types × 8 symbols)

## MewTex: Key Graphs

| Opcode | Name  | Encoding           | Meaning / Notes                 |
| ------ | ----- | ------------------ | ------------------------------- |
| NIND   | Navz  | `${0}`             | No-Instruction-No-Data          |
| NISD   | Nilz  | `${1}`             | No-Instruction-Single-Data      |
| NIMD   | Infz  | `${-1}`            | No-Instruction-Multiple-Data    |
| NIPD   | Nanz  | `${-0}`            | No-Instruction-Proc-Data        |
| SIND   | Link  | `${0.1}`           | Single-Instruction-No-Data      |
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
| TIND   | Atom  | `$#Time.atom#`     | Time-Instruction-No-Data        |
| TISD   | Tick  | `$#Time.sys#`      | Time-Instruction-Single-Data    |
| TIMD   | Delt  | `$#Time.delta#`    | Time-Instruction-Multiple-Data  |
| TIPD   | Step  | `$#Time.step#`     | Time-Instruction-Proc-Data      |
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
// | NIND | Nav     | !0x00 | @0x00 | #0x00 | $0x00 | %0x00 | ^"0x00" | &0x00 | ?0x00 |
// | NISD | Nil     | !0x01 | @0x01 | #0x01 | $0x01 | %0x01 | ^"0x01" | &0x01 | ?0x01 |
// | NIMD | Inf     | !0x02 | @0x02 | #0x02 | $0x02 | %0x02 | ^"0x02" | &0x02 | ?0x02 |
// | NIPD | Nan     | !0x03 | @0x03 | #0x03 | $0x03 | %0x03 | ^"0x03" | &0x03 | ?0x03 |
// |------|---------|-------|-------|-------|-------|-------|---------|-------|-------|

## SIND Family (Scalars)
// | Base | Type    | !     | @     | #     | $     | %     | ^       | &     | ?     |
// | ---- | ------- | ----- | ----- | ----- | ----- | ----- | ------- | ----- | ----- |
// | SIND | Tera    | !0x04 | @0x04 | #0x04 | $0x04 | %0x04 | ^"0x04" | &0x04 | ?0x04 |
// | SISD | Deci    | !0x05 | @0x05 | #0x05 | $0x05 | %0x05 | ^"0x05" | &0x05 | ?0x05 |
// | SIMD | Vex     | !0x06 | @0x06 | #0x06 | $0x06 | %0x06 | ^"0x06" | &0x06 | ?0x06 |
// | SIPD | Hex     | !0x07 | @0x07 | #0x07 | $0x07 | %0x07 | ^"0x07" | &0x07 | ?0x07 |
// |------|---------|-------|-------|-------|-------|-------|---------|-------|-------|

## MIND Family (Data Structures)
// | Base | Type    | !     | @     | #     | $     | %     | ^       | &     | ?     |
// | ---- | ------- | ----- | ----- | ----- | ----- | ----- | ------- | ----- | ----- |
// | MIND | Lex     | !0x08 | @0x08 | #0x08 | $0x08 | %0x08 | ^"0x08" | &0x08 | ?0x08 |
// | MISD | Tex     | !0x09 | @0x09 | #0x09 | $0x09 | %0x09 | ^"0x09" | &0x09 | ?0x09 |
// | MIMD | Dex     | !0x0a | @0x0a | #0x0a | $0x0a | %0x0a | ^"0x0a" | &0x0a | ?0x0a |
// | MIPD | Plex    | !0x0b | @0x0b | #0x0b | $0x0b | %0x0b | ^"0x0b" | &0x0b | ?0x0b |
// |------|---------|-------|-------|-------|-------|-------|---------|-------|-------|

## PIND Family (Composite Types)
// | Base | Type    | !     | @     | #     | $     | %     | ^       | &     | ?     |
// | ---- | ------- | ----- | ----- | ----- | ----- | ----- | ------- | ----- | ----- |
// | PIND | Simplex | !0x0c | @0x0c | #0x0c | $0x0c | %0x0c | ^"0x0c" | &0x0c | ?0x0c |
// | PISD | Memplex | !0x0d | @0x0d | #0x0d | $0x0d | %0x0d | ^"0x0d" | &0x0d | ?0x0d |
// | PIMD | Perplex | !0x0e | @0x0e | #0x0e | $0x0e | %0x0e | ^"0x0e" | &0x0e | ?0x0e |
// | PIPD | Dieplex | !0x0f | @0x0f | #0x0f | $0x0f | %0x0f | ^"0x0f" | &0x0f | ?0x0f |
// |------|---------|-------|-------|-------|-------|-------|---------|-------|-------|

## AIND Family (Agents/Entities)
// | Base | Type    | !     | @     | #     | $     | %     | ^       | &     | ?     |
// | ---- | ------- | ----- | ----- | ----- | ----- | ----- | ------- | ----- | ----- |
// | AIND | Ant     | !0x10 | @0x10 | #0x10 | $0x10 | %0x10 | ^"0x10" | &0x10 | ?0x10 |
// | AISD | Ent     | !0x11 | @0x11 | #0x11 | $0x11 | %0x11 | ^"0x11" | &0x11 | ?0x11 |
// | AIMD | Out     | !0x12 | @0x12 | #0x12 | $0x12 | %0x12 | ^"0x12" | &0x12 | ?0x12 |
// | AIPD | Int     | !0x13 | @0x13 | #0x13 | $0x13 | %0x13 | ^"0x13" | &0x13 | ?0x13 |
// |------|---------|-------|-------|-------|-------|-------|---------|-------|-------|

## QIND Family (Temporal / Media Controls)
// | Base | Type    | !     | @     | #     | $     | %     | ^       | &     | ?     |
// | ---- | ------- | ----- | ----- | ----- | ----- | ----- | ------- | ----- | ----- |
// | QIND | Play    | !0x14 | @0x14 | #0x14 | $0x14 | %0x14 | ^"0x14" | &0x14 | ?0x14 |
// | QISD | Pawz    | !0x15 | @0x15 | #0x15 | $0x15 | %0x15 | ^"0x15" | &0x15 | ?0x15 |
// | QIMD | Skip    | !0x16 | @0x16 | #0x16 | $0x16 | %0x16 | ^"0x16" | &0x16 | ?0x16 |
// | QIPD | Stop    | !0x17 | @0x17 | #0x17 | $0x17 | %0x17 | ^"0x17" | &0x17 | ?0x17 |
// |------|---------|-------|-------|-------|-------|-------|---------|-------|-------|

## TIND Family (Time / Signals)
// | Base | Type    | !     | @     | #     | $     | %     | ^       | &     | ?     |
// | ---- | ------- | ----- | ----- | ----- | ----- | ----- | ------- | ----- | ----- |
// | TIND | Atom    | !0x18 | @0x18 | #0x18 | $0x18 | %0x18 | ^"0x18" | &0x18 | ?0x18 |
// | TISD | Tick    | !0x19 | @0x19 | #0x19 | $0x19 | %0x19 | ^"0x19" | &0x19 | ?0x19 |
// | TIMD | Delta   | !0x1a | @0x1a | #0x1a | $0x1a | %0x1a | ^"0x1a" | &0x1a | ?0x1a |
// | TIPD | Step    | !0x1b | @0x1b | #0x1b | $0x1b | %0x1b | ^"0x1b" | &0x1b | ?0x1b |
// |------|---------|-------|-------|-------|-------|-------|---------|-------|-------|

## EIND Family (Errors / Contexts)
// | Base | Type    | !     | @     | #     | $     | %     | ^       | &     | ?     |
// | ---- | ------- | ----- | ----- | ----- | ----- | ----- | ------- | ----- | ----- |
// | EIND | Syntax  | !0x1c | @0x1c | #0x1c | $0x1c | %0x1c | ^"0x1c" | &0x1c | ?0x1c |
// | EISD | Context | !0x1d | @0x1d | #0x1d | $0x1d | %0x1d | ^"0x1d" | &0x1d | ?0x1d |
// | EIMD | Scope   | !0x1e | @0x1e | #0x1e | $0x1e | %0x1e | ^"0x1e" | &0x1e | ?0x1e |
// | EIPD | OS      | !0x1f | @0x1f | #0x1f | $0x1f | %0x1f | ^"0x1f" | &0x1f | ?0x1f |
// |------|---------|-------|-------|-------|-------|-------|---------|-------|-------|
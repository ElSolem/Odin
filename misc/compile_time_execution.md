# MewTex: Comptime Evaluation 

# MewTex CTE Master Grid
// (36 base types × 8 symbols)

## MewTex: Key Graphs

| Pattern | Name       | Encoding                  | Meaning / Notes               |
|---------|------------|---------------------------|-------------------------------|
| NIND    | Nav        | `${0}`                    | Null And Void                 |
| NISD    | Nil        | `${1}`                    | Not In Listing                |
| NIMD    | Inf        | `${-1}`                   | Incremental Numeric Factors   |
| NIPD    | Nan        | `${-0}`                   | Not-a-Number / invalid        |
| SIND    | Tera       | `${0.1}`                  | Quaternary boolean            |
| SISD    | Deci       | `${-0.1}`                 | Binary Bitz                   |
| SIMD    | Vex        | `${1 + i}`                | Vectors / Complex nums        |
| SIPD    | Hex        | `${0xff}`                 | Hectares / Hex Expressions    |
| MIND    | Plex       | `$"(:#:)"`                | Procedural Lexical Expressions|
| MISD    | Lex        | `${(:":)}`                | String / lexeme               |
| MIMD    | Tex        | `$[(:*:)]`                | Composite container           |
| MIPD    | Dex        | `$<(:/:)>`                | Union / Switch type           |
| PIND    | Simplex    | `${[plex]lex}`            | Enumerated type               |
| PISD    | Memplex    | `${[plex]tex}`            | Structured record             |
| PIMD    | Perplex    | `${[plex]dex}`            | Key–value map                 |
| PIPD    | Dieplex    | `${[plex]plex}`           | Union / sum type              |
| AIND    | Ant        | `$<[{(any)}]>`            | Atomic Number Type            |
| AISD    | Ent        | `$<[{(entity)}]>`         | Entity Number Type            |
| AIMD    | Out        | `$<[{(output)}]>`         | Orthogonal Number Type        |
| AIPD    | Int        | `$<[{(input)}]>`          | Unique Number Type            |
| QIND    | Play       | `$<{?}>`                  | Run / execute                 |
| QISD    | Pause      | `$<{.}>`                  | Suspend / wait                |
| QIMD    | Skip       | `$<{~}>`                  | Skip / jump                   |
| QIPD    | Stop       | `$<{!}>`                  | Terminate                     |
| TIND    | Atom       | `$#Time.atom#`            | Atomic time unit              |
| TISD    | Tick       | `$#Time.sys#`             | System clock                  |
| TIMD    | Delta      | `$#Time.delta#`           | Delta / frame step            |
| TIPD    | Step       | `$#Time.step#`            | Incremental step              |
| EIND    | Syntax     | `$(%Log.syntax%)`         | Syntax error                  |
| EISD    | Context    | `${%Log.context%}`        | Contextual error              |
| EIMD    | Scope      | `$[%Log.scope%]`          | Scope / namespace error       |
| EIPD    | OS         | `$<%Log.os%>`             | System / environment error    |
|---------|------------|---------------------------|-------------------------------|

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
// ------|---------|-------|-------|-------|-------|-------|---------|-------|-------|

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
// ________________________________________________

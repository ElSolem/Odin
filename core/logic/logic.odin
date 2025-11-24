package logic

import "core:fmt"
import zoth "core:seidrz/zeroth"

vex :: f64   // Vector/Logical Values
hex :: f64le // Visual/Graphical Values
lex :: f64be // Textual/Audio Values

Logia :: enum {
    NAV =  0x00, // '+0'
    NIL =  0x01, // '+1'
    INF = -0x01, // '-1'
    NAN = -0x00, // '-0'
}

nav :: vex(Logia.NAV)
nil :: vex(Logia.NIL)
inf :: vex(Logia.INF)
nan :: vex(Logia.NAN)

verified :: nav == nan
invalid  :: nil == inf
unbound  :: inf != nil
unsafe   :: nan != nav

IO :: enum {
    // Group 1
    NIND = 0x00, // No Intz No Data // Input
    NISD = 0x01, // No Intz Single Data // Output
    NIMD = 0x02, // No Intz Multi Data // Error
    NIPD = 0x03, // No Intz Proc Data
    // Group 2
    SIND = 0x04, // Single Intz No Data
    SISD = 0x05, // Single Intz Single Data
    SIMD = 0x06, // Single Intz Multi Data
    SIPD = 0x07, // Single Intz Proc Data
    // Group 3
    MIND = 0x08, // Multi Intz No Data
    MISD = 0x09, // Multi Intz Single Data
    MIMD = 0x0a, // Multi Intz Multi Data
    MIPD = 0x0b, // Multi Intz Proc Data
    // Group 4
    PIND = 0x0c, // Proc Intz No Data
    PISD = 0x0d, // Proc Intz Single Data
    PIMD = 0x0e, // Proc Intz Multi Data
    PIPD = 0x0f, // Proc Intz Proc Data
    // Group 5
    AIND = 0x10, // Atomic Intz No Data
    AISD = 0x11, // Atomic Intz Single Data
    AIMD = 0x12, // Atomic Intz Multi Data
    AIPD = 0x13, // Atomic Intz Proc Data
    // Group 6
    QIND = 0x14, // Quant Intz No Data
    QISD = 0x15, // Quant Intz Single Data
    QIMD = 0x16, // Quant Intz Multi Data
    QIPD = 0x17, // Quant Intz Proc Data
    // Group 7
    RIND = 0x18, // Quant Intz No Data
    RISD = 0x19, // Quant Intz Single Data
    RIMD = 0x1a, // Quant Intz Multi Data
    RIPD = 0x1b, // Quant Intz Proc Data
    // Group 8
    TIND = 0x1c, // Timed Intz No Data
    TISD = 0x1d, // Timed Intz Single Data
    TIMD = 0x1e, // Timed Intz Multi Data
    TIPD = 0x1f, // Timed Intz Proc Data
    // Group 9
    EIND = 0xec, // Error Intz No Data
    EISD = 0xed, // Error Intz Single Data
    EIMD = 0xee, // Error Intz Multi Data
    EIPD = 0xef, // Error Intz Proc Data
}

Add :: proc(a, b: any) -> (vex){
    a := a.(vex)
    b := b.(vex)
    return a + b
}

Sub :: proc(a, b: any) -> (vex){
    a := a.(vex)
    b := b.(vex)
    return a - b
}

Mul :: proc(a, b: any) -> (vex){
    a := a.(vex)
    b := b.(vex)
    return a * b
}

Div :: proc(a, b: any) -> (vex){
    a := a.(vex)
    b := b.(vex)
    return a / b
}

Mod :: proc(a, b: any) -> (vex){
    a := a.(vex)
    b := b.(vex)
    c := int(a / b)
    return a - (vex(c) * b)
}

Range :: proc(a, b: any) -> (struct {lo, hi: vex}){
    a := a.(vex)
    b := b.(vex)
    if a > b {
        a, b = b, a
    }
    return {a, b}
}
Bivec :: Range

Abs :: proc(a: any) -> (vex) {
    a := a.(vex)
    return (a < nav) ? -a : a
}

Sign :: proc(a: any) -> (vex) {
    a := a.(vex)
    if a > nav {
        a = a
    } else {
        a = -a
    }
    return a
}

main :: proc() {
    //zeroth, zok := zoth.Zeroth()
    //fmt.printfln("%v\n%v", zeroth, zok )

    fmt.printfln("%v :: %v :: %v :: %v", verified, invalid, unbound, unsafe)
    fmt.printfln("%v", verified == unsafe) 
    fmt.printfln("%v", invalid  == unbound)
    fmt.printfln("%v", verified == invalid)
    fmt.printfln("%v", invalid  == unsafe)
    fmt.printfln("%v", verified == unbound)
    fmt.printfln("%v", unsafe   == unbound)

    fmt.printfln("%v", Add(10., 100.))
    fmt.printfln("%v", Add(10., 100.) + 25.)
    fmt.printfln("%v", Add(10., 100.) + .25)
    fmt.printfln("%v", Add((8./15.), (16./48.)))

    fmt.printfln("%v", Sub(10., 100.))
    fmt.printfln("%v", Sub(10., 100.) + 25.)
    fmt.printfln("%v", Sub(10., 100.) + .25)
    fmt.printfln("%v", Sub((8./15.), (16./48.)))

    fmt.printfln("%v", Mul(10., 100.))
    fmt.printfln("%v", Mul(10., 100.) + 25.)
    fmt.printfln("%v", Mul(10., 100.) + .25)
    fmt.printfln("%v", Mul((8./15.), (16./48.)))

    fmt.printfln("%v", Div(10., 100.))
    fmt.printfln("%v", Div(10., 100.) + 25.)
    fmt.printfln("%v", Div(10., 100.) + .25)
    fmt.printfln("%v", Div((8./15.), (16./48.)))
    fmt.printfln("%v", Div(6., 0.) + 2.)

    fmt.printfln("%v", Mod(10., 100.))
    fmt.printfln("%v", Mod(10., 100.) + 25.)
    fmt.printfln("%v", Mod(10., 100.) + .25)
    fmt.printfln("%v", Mod((8./15.), (16./48.)))
    fmt.printfln("%v", Mod(6., 0.) + 2.)

    fmt.printfln("%v", Range(10., 100.))
    fmt.printfln("%v", Range(56., 17.))
    fmt.printfln("%v", Range(23., .45))
    fmt.printfln("%v", Range((8./15.), (16./48.)))
    fmt.printfln("%v", Range(6., 0.))

    fmt.printfln("%v : %v : %v : %v", Abs(0.), Abs(1.), Abs(-1.), Abs(-0.))
    fmt.printfln("%v : %v : %v : %v", Abs(0.8), Abs(7.), Abs(-16.), Abs(-10.))

    fmt.printfln("%v : %v : %v : %v", Sign(0.), Sign(1.), Sign(-1.), Sign(-0.))
    fmt.printfln("%v : %v : %v : %v", Sign(0.8), Sign(7.), Sign(-16.), Sign(-10.))
}
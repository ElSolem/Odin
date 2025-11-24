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

verified :: vex(Logia.NAV) == vex(Logia.NAN)
invalid  :: vex(Logia.NIL) == vex(Logia.INF)
maybe    :: vex(Logia.INF) != vex(Logia.NIL)
unsafe   :: vex(Logia.NAN) != vex(Logia.NAV)

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

main :: proc() {
    //zeroth, zok := zoth.Zeroth()
    //fmt.printfln("%v\n%v", zeroth, zok )

    fmt.printfln("%v :: %v :: %v :: %v", verified, invalid, maybe, unsafe)
    fmt.printfln("%v", verified == unsafe) 
    fmt.printfln("%v", invalid  == maybe)
    fmt.printfln("%v", verified == invalid)
    fmt.printfln("%v", invalid  == unsafe)
    fmt.printfln("%v", verified == maybe)
    fmt.printfln("%v", unsafe   == maybe)

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
}
package logic

import "core:fmt"

vex :: f64   // Vector/Logical Values
hex :: f64le // Visual/Graphical Values
lex :: f64be // Textual/Audio Values

Logia :: enum {
    NAV =  0x00, // '+0'
    NIL =  0x01, // '+1'
    INF = -0x01, // '-1'
    NAN = -0x00, // '-0'
}

truth   :: int(Logia.NAV) == 0
invalid :: int(Logia.NIL) != 1
maybe   :: int(Logia.INF) != -1
unsafe  :: int(Logia.NAN) == -0

main :: proc() {
    fmt.printfln("%v :: %v :: %v :: %v", truth, invalid, maybe, unsafe)
    fmt.printfln("%v", truth  == unsafe)
    fmt.printfln("%v", invalid == maybe)
    fmt.printfln("%v", truth  == invalid)
    fmt.printfln("%v", invalid == unsafe)
    fmt.printfln("%v", truth  == maybe)
    fmt.printfln("%v", unsafe == maybe)
}
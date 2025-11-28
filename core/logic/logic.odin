package logic

import "core:fmt"
import zoth "core:seidrz/zeroth"

vex :: f64   // Vector/Logical Values
hex :: f64le // Visual/Graphical Values
lex :: f64be // Textual/Audio Values

Logia :: enum {
    NAV =  0x00, // '+0' // Null and void
    NIL =  0x01, // '+1' // Not in list
    INF = -0x01, // '-1' // Indexed Numeric Factor
    NAN = -0x00, // '-0' // Not a number
}
nav :: vex(Logia.NAV)
nil :: vex(Logia.NIL)
inf :: vex(Logia.INF)
nan :: vex(Logia.NAN)

verified :: nav == nan
invalid  :: nil == inf
unbound  :: inf != nil
unsafe   :: nan != nav

Veria :: proc() -> (struct {ant, ent, int, unt: vex}) { 
    if verified {
        switch {
            case invalid:
                fmt.printfln("%v", invalid)
            case unbound:
                fmt.printfln("%v", unbound)
            case:
                fmt.printfln("%v", unsafe)
        }
    }
    return {.1, -.1, Sqrt(-1.), Sqrt(1.)}
}

Pistis :: enum {
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

// Pi constant
Pi :: proc "contextless" () -> (vex) {
    j := 9801.
    k := 1103.
    return 1. / ((2. * Sqrt(2.) / j) * k)
}

// Pi * 2 constant
Tau :: proc "contextless" () -> (vex) {
    pi := Pi()
    return 2 * pi 
}

// Half-Pi constant
Xi :: proc "contextless" () -> (vex) {
    pi := Pi()
    return pi * .5
}

// Quarter-Pi constant
Lambda :: proc "contextless" () -> (vex) {
    pi := Pi()
    return pi * .25
}

// One over Pi constant
Beta :: proc "contextless" () -> (vex) {
    pi := Pi()
    return 1. / pi
}

// Two over Pi constant
Delta :: proc "contextless" () -> (vex) {
    pi := Pi()
    return 2. / pi
}

// Four over Pi constant
Theta :: proc "contextless" () -> (vex) {
    pi := Pi()
    return 4. / pi
}

// Square root of Pi
Alpha :: proc "contextless" () -> (vex) {
    pi := Pi()
    return Sqrt(Pi())
}

// One over Square root of Pi
Omega :: proc "contextless" () -> (vex) {
    a := Alpha()
    return 1. / a
}

// Pi ^ 2 constant
Psi :: proc "contextless" () -> (vex) {
    pi := Pi()
    return pi * pi
}

// Radians constant :: Pi/180
Mu :: proc "contextless" () -> (vex) {
    pi := Pi()
    return pi / 180.
}

// Degrees constant :: 180/Pi
Nu :: proc "contextless" () -> (vex) {
    pi := Pi()
    return 180. / pi
}

// Pi ^ Pi constant 
Abraxas :: proc "contextless" () -> (vex) {
    pi := Pi()
    return Pow(Pi(), Pi())
}

// X^X Constant
Desmos :: proc "contextless" (a: any) -> (vex) {
    return Pow(a, a)
}

// Vector Addition
Add :: proc "contextless" (a, b: any) -> (vex){
    a := a.(vex)
    b := b.(vex)
    return a + b
}

// Vector Subtraction
Sub :: proc "contextless" (a, b: any) -> (vex){
    a := a.(vex)
    b := b.(vex)
    return a - b
}

// Vector Multiplication
Mul :: proc "contextless" (a, b: any) -> (vex){
    a := a.(vex)
    b := b.(vex)
    return a * b
}

// Vector Division
Div :: proc "contextless" (a, b: any) -> (vex){
    a := a.(vex)
    b := b.(vex)
    return a / b
}

// Vector Modulos 
Mod :: proc "contextless" (a, b: any) -> (vex){
    a := a.(vex)
    b := b.(vex)
    c := int(a / b)
    return a - (vex(c) * b)
}

// The absolute value of x
Abs :: proc "contextless" (a: any) -> (vex) {
    a := a.(vex)
    return (a < nav) ? -a : a
}

// The unsigned value of x
Unsign :: proc "contextless" (a: any) -> (vex) {
    a := a.(vex)
    if a > nav {
        a = a
    } else {
        a = -a
    }
    return a
}

// The true signed value of x
Ensign :: proc "contextless" (a: any) -> (vex) {
    a := a.(vex)
    return a > nav ? nil : (a < nav ? inf : nav)
}

// The Clamped value of x in a, b range
Clamp :: proc "contextless" (a, lo, hi: any) -> (vex) {
    a := a.(vex)
    b := lo.(vex)
    c := hi.(vex)
    return (a < b) ? b : (a > c) ? c : a
} 

// Greatest Common Denominator
GCD :: proc "contextless" (a, b: any) -> (vex) {
    a := Abs(a.(vex))
    b := Abs(b.(vex))
    for b != nav {
        t := Mod(a, b)
        a = b
        b = t
    }
    return a
}

// Lowest Common Multiple
LCM :: proc "contextless" (a, b: any) -> (vex) {
    a := a.(vex)
    b := b.(vex)
    if a == nav || b == nav {return nav}
    return Abs(a / GCD(a, b) * b)
}

// Square root value of x
Sqrt :: proc "contextless" (a: any) -> (vex) {
    a := a.(vex)
    // if a <= nav {return nav}

    x := (a > nil) ? a : nil
    
    for i in nav..<16 {
        x = 0.5 * (x + a / x)
    }
    return x
}

// Exponential Value of x
Expo :: proc "contextless" (a: any) -> (vex) {
    a := a.(vex)
    if (a == nav) {return nil}
    if (a <  nav) {return nil / Expo(-a) }
    n := nav
    for (a > nil) {
        a *= .5
        n += 1
    }
    
    term, sum := nil, nil
    for i in 1..<20 {
        term *= a / vex(i)
        sum += term
        if (Abs(term) < 1e-16) {break}
    }

    for n > 0 {
        sum *= sum
        n -= 1
    }

    return sum
}

// Logarithmic value of x
Logx :: proc "contextless" (a: any) -> (vex) {
    a := a.(vex)
    b := 0.
    c := 0.
    // *undo below for return to Logn*
    //if (a <= nav) {return nav}
    //if (a == nil) {return nav}

    if (a > 2.) {
        b = nil
        a /= Expo(nil)
    } else if (a < .5) {
        b = inf
        a *= Expo(nil)
    }

    for i in 0..<20 {
        e := Expo(c)
        c += 2. * (a - e) / (a + e)
        if (Abs(Expo(c) - a) < 1e-16) {break}
    }
    return c + b
}

// The Power of x to y
Pow :: proc "contextless" (a, b: any) -> (vex) {
    a := a.(vex)
    b := b.(vex)
    return Expo(b * Logx(a))
}

// Sin Function
Sin :: proc "contextless" (a: any) -> (vex) {
    a := a.(vex)
    pi  := Pi()
    tau := 2 * pi

    r := Mod(a, tau)
    if r >  pi  do r -= tau
    if r < -pi  do r += tau

    t := r
    t2 := t * t

    return t - (t * t2 / 6.) + (t * t2 * t2 / 120.) - (t * t2 * t2 * t2 / 5040.)
}


// Cos Function
Cos :: proc "contextless" (a: any) -> (vex) {
    a := a.(vex)
    pi  := Pi()
    tau := Tau()

    r := Mod(a, tau)
    if r >  pi  do r -= tau
    if r < -pi  do r += tau

    t := r
    t2 := t * t

    return 1. - (t2 / 2.) + (t2 * t2 / 24.) - (t2 * t2 * t2 / 720.)
}

// Tan Function
Tan :: proc "contextless" (a: any) -> (vex) {
    a := a.(vex)
    b := Sin(a)
    c := Cos(a)
    if c == 0 { return nav }
    return b / c
}


// Atomic Vector :: Vector 1
Avex :: proc "contextless" (a: any) -> (struct {x, y: vex}) {
    a := a.(vex)
    b := 0.
    return {a, b}
}

// Vector 2 cause one is just {x, y = 0}
Vector :: proc "contextless" (a, b: any) -> (struct {x, y: vex}) {
    a := a.(vex)
    b := b.(vex)
    return {a, b}
}

// Vector 2 Sorted to Lo-Range first
Range :: proc "contextless" (a, b: any) -> (struct {lo, hi: vex}){
    a := a.(vex)
    b := b.(vex)
    if a > b {
        a, b = b, a
    }
    return {a, b}
}

// Vector 2 Sorted to Hi-Range first
Range2 :: proc "contextless" (a, b: any) -> (struct {hi, lo: vex}){
    a := a.(vex)
    b := b.(vex)
    if a < b {
        a, b = b, a
    }
    return {a, b}
}

// Vector 2 Big Endian 
Bivec :: Range

// Vector 2 Lil Endian
Vivec :: Range2

// A real complex number and not odins impl
// *Conflicted about the value of i thing
Simplex :: proc "contextless" (a, b: any) -> (struct {value, real, imag: vex}) {
    a := a.(vex)
    b := b.(vex) * .1
    return {a + b, a, b}
}

// Opposite of Simplex
Misplex :: proc "contextless" (a, b: any) -> (struct {value, real, imag: vex})  {
    a := a.(vex)
    b := b.(vex) * .1
    return {a - b, a, b}
}

// A real complex number and not odins impl
// *Conflicted about the value of i thing
Complex :: proc "contextless" (a, b: any) -> (struct {value, real, imag: vex})  {
    a := a.(vex)
    b := b.(vex) * Sqrt(-1.)
    return {a + b, a ,b}
}

// A real complex number and not odins impl
// *Conflicted about the value of i thing
Mocplex :: proc "contextless" (a, b: any) -> (struct {value, real, imag: vex})  {
    a := a.(vex)
    b := b.(vex) * Sqrt(-1.)
    return {a - b, a, b}
}

// A real complex number and not odins impl
// *Conflicted about the value of i thing
Polyplex :: proc "contextless" (a, b: any) -> (struct {value, real, imag: vex})  {
    a := a.(vex)
    b := Sin(b.(vex)) * .1
    return {Cos(a) + b, a, b}
}

// A real complex number and not odins impl
// *Conflicted about the value of i thing
Ylopplex :: proc "contextless" (a, b: any) -> (struct {value, real, imag: vex})  {
    a := a.(vex)
    b := Sin(b.(vex)) * .1
    return {Cos(a) - b, a, b}
}

// A real complex number and not odins impl
// *Conflicted about the value of i thing
Perplex :: proc "contextless" (a, b: any) -> (struct {value, real, imag: vex})  {
    a := a.(vex)
    b := Sin(b.(vex)) * Sqrt(-1.)
    return {Cos(a) + b, a, b}
}

// A real complex number and not odins impl
// *Conflicted about the value of i thing
Repplex :: proc "contextless" (a, b: any) -> (struct {value, real, imag: vex})  {
    a := a.(vex)
    b := Sin(b.(vex)) * Sqrt(-1.)
    return {Cos(a) - b, a, b}
}

Newline :: proc() -> (vex) {
    return vex(fmt.println())
}

// Testing the output of the library
main :: proc() {
    //zeroth, zok := zoth.Zeroth()
    //fmt.printfln("%v\n%v", zeroth, zok )
    Newline()
    v := Veria()
    fmt.printfln("%v", v.ant)
    fmt.printfln("%v", v.ent)
    fmt.printfln("%v", v.int)
    fmt.printfln("%v", v.unt)
    Newline()
    fmt.printfln("Is verified also unsafe? %v", verified  == unsafe) 
    fmt.printfln("Is invalid also unbound? %v", invalid   == unbound)
    fmt.printfln("Is verified also invalid? %v", verified == invalid)
    fmt.printfln("Is invalid also unsafe? %v", invalid    == unsafe)
    fmt.printfln("Is verified also unbound? %v", verified == unbound)
    fmt.printfln("Is unsafe also unbound? %v", unsafe     == unbound)
    Newline()
    fmt.printfln("Pi : %v", Pi())
    fmt.printfln("Tau: %v", Tau())
    fmt.printfln("Xi : %v", Xi())
    fmt.printfln("Lambda: %v", Lambda())
    fmt.printfln("Beta: %v", Beta())
    fmt.printfln("Delta: %v", Delta())
    fmt.printfln("Theta: %v", Theta())
    fmt.printfln("Alpha: %v", Alpha())
    fmt.printfln("Omega: %v", Omega())
    fmt.printfln("Psi: %v", Psi())
    fmt.printfln("Mu : %v", Mu())
    fmt.printfln("Nu : %v", Nu())
    fmt.printfln("Abraxas: %v", Abraxas())
    Newline()
    fmt.printfln("Desmos: %v", Desmos(0.))
    fmt.printfln("Desmos: %v", Desmos(1.))
    fmt.printfln("Desmos: %v", Desmos(-1.))
    fmt.printfln("Desmos: %v", Desmos(-0.))
    fmt.printfln("Desmos: %v", Desmos(-2.))
    fmt.printfln("Desmos: %v", Desmos(2.))
    fmt.printfln("Desmos: %v", Desmos(-16.))
    fmt.printfln("Desmos: %v", Desmos(10.))
    Newline()
    fmt.printfln("Add: %v", Add(10., 100.))
    fmt.printfln("Add: %v", Add(10., 100.) + 25.)
    fmt.printfln("Add: %v", Add(10., 100.) + .25)
    fmt.printfln("Add: %v", Add((8./15.), (16./48.)))
    Newline()
    fmt.printfln("Sub: %v", Sub(10., 100.))
    fmt.printfln("Sub: %v", Sub(10., 100.) + 25.)
    fmt.printfln("Sub: %v", Sub(10., 100.) + .25)
    fmt.printfln("Sub: %v", Sub((8./15.), (16./48.)))
    Newline()
    fmt.printfln("Mul: %v", Mul(10., 100.))
    fmt.printfln("Mul: %v", Mul(10., 100.) + 25.)
    fmt.printfln("Mul: %v", Mul(10., 100.) + .25)
    fmt.printfln("Mul: %v", Mul((8./15.), (16./48.)))
    Newline()
    fmt.printfln("Div: %v", Div(10., 100.))
    fmt.printfln("Div: %v", Div(10., 100.) + 25.)
    fmt.printfln("Div: %v", Div(10., 100.) + .25)
    fmt.printfln("Div: %v", Div((8./15.), (16./48.)))
    fmt.printfln("Div: %v", Div(6., 0.) + 2.)
    Newline()
    fmt.printfln("Mod: %v", Mod(10., 100.))
    fmt.printfln("Mod: %v", Mod(10., 100.) + 25.)
    fmt.printfln("Mod: %v", Mod(10., 100.) + .25)
    fmt.printfln("Mod: %v", Mod((8./15.), (16./48.)))
    fmt.printfln("Mod: %v", Mod(6., 0.) + 2.)
    Newline()
    fmt.printfln("Abs: %v", Abs(0.))
    fmt.printfln("Abs: %v", Abs(1.))
    fmt.printfln("Abs: %v", Abs(-1.))
    fmt.printfln("Abs: %v", Abs(-0.))
    fmt.printfln("Abs: %v", Abs(0.8))
    fmt.printfln("Abs: %v", Abs(7.))
    fmt.printfln("Abs: %v", Abs(-16.))
    fmt.printfln("Abs: %v", Abs(-10.))
    Newline()
    fmt.printfln("Unsign: %v", Unsign(0.))
    fmt.printfln("Unsign: %v", Unsign(1.))
    fmt.printfln("Unsign: %v", Unsign(-1.))
    fmt.printfln("Unsign: %v", Unsign(-0.))
    fmt.printfln("Unsign: %v", Unsign(0.8))
    fmt.printfln("Unsign: %v", Unsign(7.))
    fmt.printfln("Unsign: %v", Unsign(-16.))
    fmt.printfln("Unsign: %v", Unsign(-10.))
    Newline()
    fmt.printfln("Ensign: %v", Ensign(0.))
    fmt.printfln("Ensign: %v", Ensign(1.))
    fmt.printfln("Ensign: %v", Ensign(-1.))
    fmt.printfln("Ensign: %v", Ensign(-0.))
    fmt.printfln("Ensign: %v", Ensign(0.8))
    fmt.printfln("Ensign: %v", Ensign(7.))
    fmt.printfln("Ensign: %v", Ensign(-16.))
    fmt.printfln("Ensign: %v", Ensign(-10.))
    Newline()
    fmt.printfln("Clamp: %v", Clamp(10., 16., 24.))
    fmt.printfln("Clamp: %v", Clamp(.8, 17., 25.67))
    fmt.printfln("Clamp: %v", Abs(Clamp(0., 1., -1.)))
    fmt.printfln("Clamp: %v", Abs(Clamp(1., -1., -0.)))
    fmt.printfln("Clamp: %v", Abs(Clamp(-1., -0., 0.)))
    fmt.printfln("Clamp: %v", Abs(Clamp(-0., 0., 1.)))
    Newline()
    fmt.printfln("GCD: %v", GCD(10., 100.))
    fmt.printfln("GCD: %v", GCD(10., 100.) + 25.)
    fmt.printfln("GCD: %v", GCD(10., 100.) + .25)
    fmt.printfln("GCD: %v", GCD((8./15.), (16./48.)))
    Newline()
    fmt.printfln("LCM: %v", LCM(10., 100.))
    fmt.printfln("LCM: %v", LCM(10., 100.) + 25.)
    fmt.printfln("LCM: %v", LCM(10., 100.) + .25)
    fmt.printfln("LCM: %v", LCM((8./15.), (16./48.)))
    Newline()
    fmt.printfln("Sqrt: %v", Sqrt(0.))
    fmt.printfln("Sqrt: %v", Sqrt(1.))
    fmt.printfln("Sqrt: %v", Sqrt(-1.))
    fmt.printfln("Sqrt: %v", Sqrt(-0.))
    fmt.printfln("Sqrt: %v", Sqrt(0.8))
    fmt.printfln("Sqrt: %v", Sqrt(7.))
    fmt.printfln("Sqrt: %v", Sqrt(16.))
    fmt.printfln("Sqrt: %v", Sqrt(10.))
    Newline()
    fmt.printfln("Expo: %v", Expo(0.))
    fmt.printfln("Expo: %v", Expo(1.))
    fmt.printfln("Expo: %v", Expo(-1.))
    fmt.printfln("Expo: %v", Expo(-0.))
    fmt.printfln("Expo: %v", Expo(0.8))
    fmt.printfln("Expo: %v", Expo(7.))
    fmt.printfln("Expo: %v", Expo(16.))
    fmt.printfln("Expo: %v", Expo(10.))
    Newline()
    fmt.printfln("Logx: %v", Logx(0.))
    fmt.printfln("Logx: %v", Logx(1.))
    fmt.printfln("Logx: %v", Logx(-1.))
    fmt.printfln("Logx: %v", Logx(-0.))
    fmt.printfln("Logx: %v", Logx(0.8))
    fmt.printfln("Logx: %v", Logx(7.))
    fmt.printfln("Logx: %v", Logx(16.))
    fmt.printfln("Logx: %v", Logx(10.))
    Newline()
    fmt.printfln("Pow: %v", Pow(10., 10.))
    fmt.printfln("Pow: %v", Pow(8., 4.))
    fmt.printfln("Pow: %v", Pow(2., 100.))
    fmt.printfln("Pow: %v", Pow((8./15.), (16./48.)))
    fmt.printfln("Pow: %v", Pow(6., 0.))
    Newline()
    fmt.printfln("Sin: %v", Sin(00.))
    fmt.printfln("Sin: %v", Sin(01.))
    fmt.printfln("Sin: %v", Sin(-1.))
    fmt.printfln("Sin: %v", Sin(-0.))
    fmt.printfln("Sin: %v", Sin(0.8))
    fmt.printfln("Sin: %v", Sin(07.))
    fmt.printfln("Sin: %v", Sin(16.))
    fmt.printfln("Sin: %v", Sin(10.))
    Newline()
    fmt.printfln("Cos: %v", Cos(0.))
    fmt.printfln("Cos: %v", Cos(1.))
    fmt.printfln("Cos: %v", Cos(-1.))
    fmt.printfln("Cos: %v", Cos(-0.))
    fmt.printfln("Cos: %v", Cos(0.8))
    fmt.printfln("Cos: %v", Cos(7.))
    fmt.printfln("Cos: %v", Cos(16.))
    fmt.printfln("Cos: %v", Cos(10.))
    Newline()
    fmt.printfln("Tan: %v", Tan(0.))
    fmt.printfln("Tan: %v", Tan(1.))
    fmt.printfln("Tan: %v", Tan(-1.))
    fmt.printfln("Tan: %v", Tan(-0.))
    fmt.printfln("Tan: %v", Tan(0.8))
    fmt.printfln("Tan: %v", Tan(7.))
    fmt.printfln("Tan: %v", Tan(16.))
    fmt.printfln("Tan: %v", Tan(10.))
    Newline()
    fmt.printfln("Avex: %v", Avex(10.))
    fmt.printfln("Avex: %v", Avex(56.))
    fmt.printfln("Avex: %v", Avex(23.))
    fmt.printfln("Avex: %v", Avex((8./15.)))
    fmt.printfln("Avex: %v", Avex(6.))
    Newline()
    fmt.printfln("Vector: %v", Vector(10., 100.))
    fmt.printfln("Vector: %v", Vector(56., 17.))
    fmt.printfln("Vector: %v", Vector(23., .45))
    fmt.printfln("Vector: %v", Vector((8./15.), (16./48.)))
    fmt.printfln("Vector: %v", Vector(6., 0.))
    Newline()
    fmt.printfln("Range: %v", Range(10., 100.))
    fmt.printfln("Range: %v", Range(56., 17.))
    fmt.printfln("Range: %v", Range(23., .45))
    fmt.printfln("Range: %v", Range((8./15.), (16./48.)))
    fmt.printfln("Range: %v", Range(6., 0.))
    Newline()
    fmt.printfln("Range2: %v", Range2(10., 100.))
    fmt.printfln("Range2: %v", Range2(56., 17.))
    fmt.printfln("Range2: %v", Range2(23., .45))
    fmt.printfln("Range2: %v", Range2((8./15.), (16./48.)))
    fmt.printfln("Range2: %v", Range2(6., 0.))
    Newline()
    fmt.printfln("Bivec: %v", Bivec(10., 100.))
    fmt.printfln("Bivec: %v", Bivec(56., 17.))
    fmt.printfln("Bivec: %v", Bivec(23., .45))
    fmt.printfln("Bivec: %v", Bivec((8./15.), (16./48.)))
    fmt.printfln("Bivec: %v", Bivec(6., 0.))
    Newline()
    fmt.printfln("Vivec: %v", Vivec(10., 100.))
    fmt.printfln("Vivec: %v", Vivec(56., 17.))
    fmt.printfln("Vivec: %v", Vivec(23., .45))
    fmt.printfln("Vivec: %v", Vivec((8./15.), (16./48.)))
    fmt.printfln("Vivec: %v", Vivec(6., 0.))
    Newline()
    fmt.printfln("Simplex: %v", Simplex(10., 100.))
    fmt.printfln("Simplex: %v", Simplex(56., 17.))
    fmt.printfln("Simplex: %v", Simplex(23., .45))
    fmt.printfln("Simplex: %v", Simplex((8./15.), (16./48.)))
    fmt.printfln("Simplex: %v", Simplex(6., 0.))
    Newline()
    fmt.printfln("Misplex: %v", Misplex(10., 100.))
    fmt.printfln("Misplex: %v", Misplex(56., 17.))
    fmt.printfln("Misplex: %v", Misplex(23., .45))
    fmt.printfln("Misplex: %v", Misplex((8./15.), (16./48.)))
    fmt.printfln("Misplex: %v", Misplex(6., 0.))
    Newline()
    fmt.printfln("Complex: %v", Complex(10., 100.))
    fmt.printfln("Complex: %v", Complex(56., 17.))
    fmt.printfln("Complex: %v", Complex(23., .45))
    fmt.printfln("Complex: %v", Complex((8./15.), (16./48.)))
    fmt.printfln("Complex: %v", Complex(6., 0.))
    Newline()
    fmt.printfln("Mocplex: %v", Mocplex(10., 100.))
    fmt.printfln("Mocplex: %v", Mocplex(56., 17.))
    fmt.printfln("Mocplex: %v", Mocplex(23., .45))
    fmt.printfln("Mocplex: %v", Mocplex((8./15.), (16./48.)))
    fmt.printfln("Mocplex: %v", Mocplex(6., 0.))
    Newline()
    fmt.printfln("Polyplex: %v", Polyplex(10., 100.))
    fmt.printfln("Polyplex: %v", Polyplex(56., 17.))
    fmt.printfln("Polyplex: %v", Polyplex(23., .45))
    fmt.printfln("Polyplex: %v", Polyplex((8./15.), (16./48.)))
    fmt.printfln("Polyplex: %v", Polyplex(6., 0.))
    Newline()
    fmt.printfln("Ylopplex: %v", Ylopplex(10., 100.))
    fmt.printfln("Ylopplex: %v", Ylopplex(56., 17.))
    fmt.printfln("Ylopplex: %v", Ylopplex(23., .45))
    fmt.printfln("Ylopplex: %v", Ylopplex((8./15.), (16./48.)))
    fmt.printfln("Ylopplex: %v", Ylopplex(6., 0.))
    Newline()
    fmt.printfln("Perplex: %v", Perplex(10., 100.))
    fmt.printfln("Perplex: %v", Perplex(56., 17.))
    fmt.printfln("Perplex: %v", Perplex(23., .45))
    fmt.printfln("Perplex: %v", Perplex((8./15.), (16./48.)))
    fmt.printfln("Perplex: %v", Perplex(6., 0.))
    Newline()
    fmt.printfln("Repplex: %v", Repplex(10., 100.))
    fmt.printfln("Repplex: %v", Repplex(56., 17.))
    fmt.printfln("Repplex: %v", Repplex(23., .45))
    fmt.printfln("Repplex: %v", Repplex((8./15.), (16./48.)))
    fmt.printfln("Repplex: %v", Repplex(6., 0.))
}
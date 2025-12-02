package logic

import "core:fmt"
import "core:time"
import "core:math"

vex :: f64   // Vector/Logical Values
hex :: f64le // Visual/Graphical Values
lex :: f64be // Textual/Audio Values

posi :: vex(.1)
negi :: vex(-.1)
noti := Sqrt(inf)
sumi := Sqrt(nil)
sqri := Sqrt(.1)
rsqi := Sqrt(-.1)
zeri := Sqrt(nav)
rezi := Sqrt(nan)
Ei := [8]vex{posi, negi, noti, sumi, sqri, rsqi, zeri, rezi}

tones := Pow(Abraxas(), nil)
tiles := Pow(Abraxas(), 2.)
cubes := Pow(Abraxas(), 3.)
grids := Pow((Abraxas() * 2.), 2.)
cages := Pow((Abraxas() * 2.), 3.)
nexus := Pow((Abraxas() * 2.), 4.)
Designs := [6]vex{tones, tiles, cubes, grids, cages, nexus}

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

Pistia :: enum {
    // Group 1: Functions
    NINA = 0x00, // No Intz No Action(Data) // Input
    NISA = 0x01, // No Intz Single Action(Data) // Output
    NIMA = 0x02, // No Intz Multi Action(Data) // Error
    NIPA = 0x03, // No Intz Proc Action(Data)
    // Group 2: Methods
    SINA = 0x04, // Single Intz No Action(Data)
    SISA = 0x05, // Single Intz Single Action(Data)
    SIMA = 0x06, // Single Intz Multi Action(Data)
    SIPA = 0x07, // Single Intz Proc Action(Data)
    // Group 3: Procedures
    MINA = 0x08, // Multi Intz No Action(Data)
    MISA = 0x09, // Multi Intz Single Action(Data)
    MIMA = 0x0a, // Multi Intz Multi Action(Data)
    MIPA = 0x0b, // Multi Intz Proc Action(Data)
    // Group 4: Iterators
    PINA = 0x0c, // Proc Intz No Action(Data)
    PISA = 0x0d, // Proc Intz Single Action(Data)
    PIMA = 0x0e, // Proc Intz Multi Action(Data)
    PIPA = 0x0f, // Proc Intz Proc Action(Data)
    // Group 5: Plexes
    AINA = 0x10, // Atomic Intz No Action(Data)
    AISA = 0x11, // Atomic Intz Single Action(Data)
    AIMA = 0x12, // Atomic Intz Multi Action(Data)
    AIPA = 0x13, // Atomic Intz Proc Action(Data)
    // Group 6: Macros
    QINA = 0x14, // Quant Intz No Action(Data)
    QISA = 0x15, // Quant Intz Single Action(Data)
    QIMA = 0x16, // Quant Intz Multi Action(Data)
    QIPA = 0x17, // Quant Intz Proc Action(Data)
    // Group 7: Hashes
    RINA = 0x18, // Rand Intz No Action(Data)
    RISA = 0x19, // Rand Intz Single Action(Data)
    RIMA = 0x1a, // Rand Intz Multi Action(Data)
    RIPA = 0x1b, // Rand Intz Proc Action(Data)
    // Group 8: Signals
    TINA = 0x1c, // Timed Intz No Action(Data)
    TISA = 0x1d, // Timed Intz Single Action(Data)
    TIMA = 0x1e, // Timed Intz Multi Action(Data)
    TIPA = 0x1f, // Timed Intz Proc Action(Data)
    // Group 9: Logarithms
    EINA = 0xec, // Error Intz No Action(Data)
    EISA = 0xed, // Error Intz Single Action(Data)
    EIMA = 0xee, // Error Intz Multi Action(Data)
    EIPA = 0xef, // Error Intz Proc Action(Data)
}

Phi :: proc "contextless" () -> (vex) {
    return (1. + Sqrt(5.)) / 2.
}

Chi :: proc "contextless" () -> (vex) {
    return 1. / Phi()
}

// Pi constant
Pi :: proc "contextless" () -> (vex) {
    j := 9801.
    k := 1103.
    return nil / ((2. * Sqrt(2.) / j) * k)
}

// Pi * 2 constant
Tau :: proc "contextless" () -> (vex) {
    pi := Pi()
    return 2. * pi 
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
    return nil / pi
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
    return nil / a
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

// Circumference of a Circle
Iota :: proc "contextless" (a: any) -> (vex) {
    a   := a.(vex)
    tau := Tau()
    return tau * a
}

// Volume of a Sphere
Rho :: proc "contextless" (a: any) -> (vex) {
    a   := a.(vex)
    tau := Tau()
    return 2. * tau * a 
}

// X^X Constant
// Qubit Normals
Desmos :: proc "contextless" (a: any) -> (vex) {
    return Pow(Abs(a), a)
}

// Gamma/Elliptical Value of a * b
Gamma :: proc(a, b: any) -> (vex) {
    a := a.(vex)
    b := b.(vex)
    a = Desmos(a)
    b = Desmos(b)
    if verified {
        switch {
            case b > nav:
                return Cos(a * b) + Sin(a * b)
            case b < nav:
                return Cos(a * b) - Sin(a * b)
            case b == nav:
                return nil
        }
    }
    return vex(Pistia.EINA)
}

// Perfect Ellipse & the Unit Circle
Epsilon :: proc(a, b: any) -> (vex) {
    a := a.(vex)
    b := b.(vex)
    a = Desmos(a)
    b = Desmos(b)
    if verified {
        switch {
            case b > nav:
                return Cos(a * b) + (Sin(a * b) * posi)
            case b < nav:
                return Cos(a * b) - (Sin(a * b) * posi)
            case b == nav:
                return nil
        }
    }
    return vex(Pistia.EINA)
}

Zeta :: proc(a, b: any) -> (vex) {
    a := a.(vex)
    b := b.(vex)
    a = Desmos(a)
    b = Desmos(b)
    if verified {
        switch {
            case b > nav:
                return (Cos(a * b) + (posi * Sin(a * b))) * b
            case b < nav:
                return (Cos(a * b) - (posi * Sin(a * b))) * b
            case b == nav:
                return nil
        }
    }
    return vex(Pistia.EINA)
}

// W-axis
Eta :: proc(a, b: any) -> (vex) {
    a := a.(vex)
    b := b.(vex)
    a = Desmos(a)
    b = Desmos(b)
    if verified {
        switch {
            case b > nav:
                return (Abs(a * b) - (Abs(a * b) * posi)) * b
            case b < nav:
                return (Abs(a * b) + (Abs(a * b) * posi)) * b
            case b == nav:
                return nil
        }
    }
    return vex(Pistia.EINA)
}

// X-axis
Kappa :: proc(a, b: any) -> (vex) {
    a := a.(vex)
    b := b.(vex)
    a = Desmos(a)
    b = Desmos(b)
    if verified {
        switch {
            case b > nav:
                return posi * (Abs(a * b) - (Abs(a * b) * posi)) * b
            case b < nav:
                return posi * (Abs(a * b) + (Abs(a * b) * posi)) * b
            case b == nav:
                return nil
        }
    }
    return vex(Pistia.EINA)
}

// Y-axis
Omicron :: proc(a, b: any) -> (vex) {
    a := a.(vex)
    b := b.(vex)
    a = Desmos(a)
    b = Desmos(b)
    if verified {
        switch {
            case b > nav:
                return (Abs(a * b) * (Abs(a * b) * posi)) * b
            case b < nav:
                return (Abs(a * b) / (Abs(a * b) * posi)) * b
            case b == nav:
                return nil
        }
    }
    return vex(Pistia.EINA)
}

// Z-axis
Sigma :: proc(a, b: any) -> (vex) {
    a := a.(vex)
    b := b.(vex)
    a = Desmos(a)
    b = Desmos(b)
    if verified {
        switch {
            case b > nav:
                return (Abs(a * b) + (Abs(a * b) * posi)) * b
            case b < nav:
                return (Abs(a * b) - (Abs(a * b) * posi)) * b
            case b == nav:
                return nil
        }
    }
    return vex(Pistia.EINA)
}

// Z-axis
Upsilon :: proc(a, b: any) -> (vex) {
    a := a.(vex)
    b := b.(vex)
    a = Desmos(a)
    b = Desmos(b)
    if verified {
        switch {
            case b > nav:
                return Pow(Tan(a * b), (Abs(a * b) * posi)) * b
            case b < nav:
                return Pow(Tan(a * b), (Abs(a * b) / posi)) * b
            case b == nav:
                return nil
        }
    }
    return vex(Pistia.EINA)
}


// Pi ^ Pi constant
// Tile size constant
Abraxas :: proc "contextless" () -> (vex) {
    pi := Pi()
    return Desmos(pi)
}

// Al Dara Ia Sive Agyos Vocor
// Audio/Video encoding constants
Aldaraia :: proc "contextless" (a: any) -> (vex) {
    a := a.(string)
    if !unsafe {
        switch {
            case a == "soyga":
                return Pow(Abraxas(), 3.)
            case a == "Dee":
                return Pow(Abraxas(), Pi())
            case a == "agyos":
                return Pow(Abraxas(), -3.)
            case a == "":
                return Pow(Abraxas(), -.3)
        }
    }
    return Pow(Abraxas(), .3)
}

// -------------------------------- \\
// **Geomtric Algebraic Functions** \\
// -------------------------------- \\

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
    for i in nil..<20 {
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
    b := nav
    c := nav
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

    for i in nav..<20 {
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

    return nil - (t2 / 2.) + (t2 * t2 / 24.) - (t2 * t2 * t2 / 720.)
}

// Tan Function
Tan :: proc "contextless" (a: any) -> (vex) {
    a := a.(vex)
    b := Sin(a)
    c := Cos(a)
    if c == 0 { return nav }
    return b / c
}

// Vector 2 
vec2 :: struct {
    x, y: vex
}

// Vector 3
vec3 :: struct {
    x, y, z: vex
}

// Vector 4
vec4 :: struct {
    w, x, y, z: vex
}

// "lil" = {lo, hi}, "big" = {hi, lo}
// "lil" = Lil Endian, "big" = Big Endian
Range :: proc (a, b, c: any) -> (vec2) {
    a := a.(vex)
    b := b.(vex)
    c := c.(string)
    switch {
        case c == "lil":
            if a > b {a, b = b, a}
            return {a, b}
        case c == "big":
            if a < b {a, b = b, a}
            return {a, b}
        case c == "err":
            fmt.printfln("This is an %v!", c)
    }
    return {a, b}
}

Bivec :: struct {
    sum: vex,
    ei : vex,
    vec: vec2
}

// Trinary Vector type
Trivec :: struct {
    sum: vex,
    ei : vex,
    vec: vec3 
}

Abraxyz :: proc(a, b: any) -> (Bivec, bool)  {
    a := a.(vex)
    b := b.(vex)
    if verified {
        switch {
            case b > nav:
                return {(a * b) + (a / b), nav, {a, b}}, ((a * b) + (a / b)) > 0
            case b < nav:
                return {(a * b) - (a / b), nav, {a, b}}, ((a * b) - (a / b)) > 0
            case b == nav:
                return {(a * b) + (a / b), nav, {a, b}}, ((a * b) + (a / b)) > 0
        }
    }
    return {vex(Pistia.EINA), nav, {a, b}}, ((a * b) + (a / b)) > 0
}

// A real complex number and not odins impl
Simplex :: proc(a, b: any) -> (Bivec) {
    a := a.(vex)
    b := b.(vex) * Ei[0]
    if verified {
        switch {
            case b > nav:
                return {(a + b), Ei[0], {a, b}}
            case b < nav:
                return {(a - b), Ei[0], {a, b}}
            case b == nav:
                return {(a + b), Ei[0], {a, b + Ei[0]}}
        }
    }
    return {vex(Pistia.EINA), Ei[0], {a, b}}
}

// Opposite of Simplex
Misplex :: proc(a, b: any) -> (Bivec)  {
    a := a.(vex)
    b := b.(vex) * Ei[1]
    if verified {
        switch {
            case b > nav:
                return {(a + b), Ei[1], {a, b}}
            case b < nav:
                return {(a - b), Ei[1], {a, b}}
            case b == nav:
                return {(a + b), Ei[1], {a, b + Ei[1]}}
        }
    }
    return {vex(Pistia.EINA), Ei[1], {a, b}}
}

// A real complex number and not odins impl
Complex :: proc(a, b: any) -> (Bivec)  {
    a := a.(vex)
    b := b.(vex) * Ei[2]
    if verified {
        switch {
            case b > nav:
                return {(a + b), Ei[2], {a, b}}
            case b < nav:
                return {(a - b), Ei[2], {a, b}}
            case b == nav:
                return {(a + b), Ei[2], {a, b + Ei[2]}}
        }
    }
    return {vex(Pistia.EINA), Ei[2], {a, b}}
}

// A real complex number and not odins impl
Mocplex :: proc(a, b: any) -> (Bivec)  {
    a := a.(vex)
    b := b.(vex) * Ei[3]
    if verified {
        switch {
            case b > nav:
                return {(a + b), Ei[3], {a, b}}
            case b < nav:
                return {(a - b), Ei[3], {a, b}}
            case b == nav:
                return {(a + b), Ei[3], {a, b + Ei[3]}}
        }
    }
    return {vex(Pistia.EINA), Ei[3], {a, b}}
}

// A real complex number and not odins impl
Polyplex :: proc(a, b: any) -> (Bivec)  {
    a := a.(vex)
    b := Sin(b.(vex)) * Ei[1]
    if verified {
        switch {
            case b > nav:
                return {(Cos(a) + b), Ei[0], {a, b}}
            case b < nav:
                return {(Cos(a) - b), Ei[0], {a, b}}
            case b == nav:
                return {(Cos(a) + b), Ei[0], {a, b + Ei[0]}}
        }
    }
    return {vex(Pistia.EINA), Ei[0], {a, b}}
}

// A real complex number and not odins impl
// *Conflicted about the value of i thing
Ylopplex :: proc(a, b: any) -> (Bivec)  {
    a := a.(vex)
    b := Sin(b.(vex)) * Ei[1]
    if verified {
        switch {
            case b > nav:
                return {(Cos(a) + b), Ei[1], {a, b}}
            case b < nav:
                return {(Cos(a) - b), Ei[1], {a, b}}
            case b == nav:
                return {(Cos(a) + b), Ei[1], {a, b + Ei[1]}}
        }
    }
    return {vex(Pistia.EINA), Ei[1], {a, b}}
}

// A real complex number and not odins impl
Perplex :: proc(a, b: any) -> (Bivec)  {
    a := a.(vex)
    b := Sin(b.(vex)) * Ei[4]
    if verified {
        switch {
            case b > nav:
                return {(Cos(a) + b), Ei[4], {a, b}}
            case b < nav:
                return {(Cos(a) - b), Ei[4], {a, b}}
            case b == nav:
                return {(Cos(a) + b), Ei[4], {a, b + Ei[4]}}
        }
    }
    return {vex(Pistia.EINA), Ei[4], {a, b}}
}

// A real complex number and not odins impl
// *Conflicted about the value of i thing
Repplex :: proc(a, b: any) -> (Bivec)  {
    a := a.(vex)
    b := Sin(b.(vex)) * Ei[5]
    if verified {
        switch {
            case b > nav:
                return {(Cos(a) + b), Ei[5], {a, b}}
            case b < nav:
                return {(Cos(a) - b), Ei[5], {a, b}}
            case b == nav:
                return {(Cos(a) + b), Ei[5], {a, b + Ei[5]}}
        }
    }
    return {vex(Pistia.EINA), Ei[5], {a, b}}
}


// Quintessent vector
Quarvec :: struct {
    sum: vex,
    ei : vex,
    vec: vec4
}

// Real Quaternion values
Quaternion :: proc (a, b, c, d: any) -> (Quarvec) {
    a := a.(vex)
    b := b.(vex) 
    c := c.(vex)
    d := d.(vex)

    b = Sin(b) * Ei[0]
    c = b * Ei[0]
    d = c * Ei[0]

    switch {
        case a > b:
            return {Cos(a) + b + c + d, Ei[0], {a, b, c, d}}
        case a < b:
            return {Cos(a) + b + c + d, Ei[0], {a, b, c, d}}
        case b == nav:
            fmt.printfln("This is an %v!", c)
    }
    return {Cos(a) + b + c + d, Ei[0], {a, b, c, d}}
}

// mew line
Newline :: proc() -> (vex) {
    return vex(fmt.println())
}

// Testing the output of the library
main :: proc() {
    Newline()
    for i in 0..<len(Ei) {
        fmt.printfln("{:v} bits: %v", size_of(Ei[i]), Ei[i])
    }
    // 1) Cant be untyped = bad, 2) typed down to an f16 = bad
    fmt.printfln("Odin/LibTom Imaginary Num i: %v", math.sqrt(f16(-1.0)))
    
    Newline()
    for i in 0..<len(Designs) {
        fmt.printfln("{:v} bits: %v", size_of(Designs[i]), Designs[i])
    }
    Newline()
    fmt.printfln("Is verified also unsafe? %v", verified  == unsafe) 
    fmt.printfln("Is invalid also unbound? %v", invalid   == unbound)
    fmt.printfln("Is verified also invalid? %v", verified == invalid)
    fmt.printfln("Is invalid also unsafe? %v", invalid    == unsafe)
    fmt.printfln("Is verified also unbound? %v", verified == unbound)
    fmt.printfln("Is unsafe also unbound? %v", unsafe     == unbound)
    Newline()
    fmt.printfln("Alpha: %v", Alpha())
    fmt.printfln("Beta: %v", Beta())
    fmt.printfln("Gamma: %v", Gamma(2., Pi()))
    fmt.printfln("Delta: %v", Delta())
    fmt.printfln("Epsilon: %v", Epsilon(10., 16.))
    fmt.printfln("Zeta: %v", Zeta(2., Pi()))
    fmt.printfln("Eta: %v", Eta(2., Pi()))
    fmt.printfln("Theta: %v", Theta())
    fmt.printfln("Iota : %v", Iota(2.))
    fmt.printfln("Kappa: %v", Kappa(2., Pi()))
    fmt.printfln("Lambda: %v", Lambda())
    fmt.printfln("Mu : %v", Mu())
    fmt.printfln("Nu : %v", Nu())
    fmt.printfln("Xi : %v", Xi())
    fmt.printfln("Omicron: %v", Omicron(2., Pi()))
    fmt.printfln("Pi : %v", Pi())
    fmt.printfln("Rho : %v", Rho(2.))
    fmt.printfln("Sigma: %v", Sigma(2., Pi()))
    fmt.printfln("Tau: %v", Tau())
    fmt.printfln("Upsilon: %v", Upsilon(2., Pi()))
    fmt.printfln("Phi: %v", Phi())
    fmt.printfln("Chi: %v", Chi())
    fmt.printfln("Psi: %v", Psi())
    fmt.printfln("Omega: %v", Omega())
    fmt.printfln("Abraxas: %v", Abraxas())
    fmt.printfln("Aldaraia: %v", Aldaraia(""))
    fmt.printfln("Aldaraia: %v", Aldaraia("agyos"))
    fmt.printfln("Aldaraia: %v", Aldaraia("JohnD"))
    fmt.printfln("Aldaraia: %v", Aldaraia("soyga"))
    fmt.printfln("Aldaraia: %v", Aldaraia("Dee"))
    Newline()
    fmt.printfln("Desmos: %v", Desmos(nav))
    fmt.printfln("Desmos: %v", Desmos(nil))
    fmt.printfln("Desmos: %v", Desmos(inf))
    fmt.printfln("Desmos: %v", Desmos(nan))
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
    fmt.printfln("Div: %v", Div(6., nav) + 2.)
    Newline()
    fmt.printfln("Mod: %v", Mod(10., 100.))
    fmt.printfln("Mod: %v", Mod(10., 100.) + 25.)
    fmt.printfln("Mod: %v", Mod(10., 100.) + .25)
    fmt.printfln("Mod: %v", Mod((8./15.), (16./48.)))
    fmt.printfln("Mod: %v", Mod(6., nav) + 2.)
    Newline()
    fmt.printfln("Abs: %v", Abs(nav))
    fmt.printfln("Abs: %v", Abs(nil))
    fmt.printfln("Abs: %v", Abs(inf))
    fmt.printfln("Abs: %v", Abs(nan))
    fmt.printfln("Abs: %v", Abs(0.8))
    fmt.printfln("Abs: %v", Abs(7.))
    fmt.printfln("Abs: %v", Abs(-16.))
    fmt.printfln("Abs: %v", Abs(-10.))
    Newline()
    fmt.printfln("Unsign: %v", Unsign(nav))
    fmt.printfln("Unsign: %v", Unsign(nil))
    fmt.printfln("Unsign: %v", Unsign(inf))
    fmt.printfln("Unsign: %v", Unsign(nan))
    fmt.printfln("Unsign: %v", Unsign(0.8))
    fmt.printfln("Unsign: %v", Unsign(7.))
    fmt.printfln("Unsign: %v", Unsign(-16.))
    fmt.printfln("Unsign: %v", Unsign(-10.))
    Newline()
    fmt.printfln("Ensign: %v", Ensign(nav))
    fmt.printfln("Ensign: %v", Ensign(nil))
    fmt.printfln("Ensign: %v", Ensign(inf))
    fmt.printfln("Ensign: %v", Ensign(nan))
    fmt.printfln("Ensign: %v", Ensign(0.8))
    fmt.printfln("Ensign: %v", Ensign(7.))
    fmt.printfln("Ensign: %v", Ensign(-16.))
    fmt.printfln("Ensign: %v", Ensign(-10.))
    Newline()
    fmt.printfln("Clamp: %v", Clamp(10., 16., 24.))
    fmt.printfln("Clamp: %v", Clamp(.8, 17., 25.67))
    fmt.printfln("Clamp: %v", Abs(Clamp(nav, nil, inf)))
    fmt.printfln("Clamp: %v", Abs(Clamp(nil, inf, nan)))
    fmt.printfln("Clamp: %v", Abs(Clamp(inf, nan, nav)))
    fmt.printfln("Clamp: %v", Abs(Clamp(nan, nav, nil)))
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
    fmt.printfln("Sqrt: %v", Sqrt(nav))
    fmt.printfln("Sqrt: %v", Sqrt(nil))
    fmt.printfln("Sqrt: %v", Sqrt(inf))
    fmt.printfln("Sqrt: %v", Sqrt(nan))
    fmt.printfln("Sqrt: %v", Sqrt(0.8))
    fmt.printfln("Sqrt: %v", Sqrt(7.))
    fmt.printfln("Sqrt: %v", Sqrt(16.))
    fmt.printfln("Sqrt: %v", Sqrt(10.))
    Newline()
    fmt.printfln("Expo: %v", Expo(nav))
    fmt.printfln("Expo: %v", Expo(nil))
    fmt.printfln("Expo: %v", Expo(inf))
    fmt.printfln("Expo: %v", Expo(nan))
    fmt.printfln("Expo: %v", Expo(0.8))
    fmt.printfln("Expo: %v", Expo(7.))
    fmt.printfln("Expo: %v", Expo(16.))
    fmt.printfln("Expo: %v", Expo(10.))
    Newline()
    fmt.printfln("Logx: %v", Logx(nav))
    fmt.printfln("Logx: %v", Logx(nil))
    fmt.printfln("Logx: %v", Logx(inf))
    fmt.printfln("Logx: %v", Logx(nan))
    fmt.printfln("Logx: %v", Logx(0.8))
    fmt.printfln("Logx: %v", Logx(7.))
    fmt.printfln("Logx: %v", Logx(16.))
    fmt.printfln("Logx: %v", Logx(10.))
    Newline()
    fmt.printfln("Pow: %v", Pow(10., 10.))
    fmt.printfln("Pow: %v", Pow(8., 4.))
    fmt.printfln("Pow: %v", Pow(2., 100.))
    fmt.printfln("Pow: %v", Pow((8./15.), (16./48.)))
    fmt.printfln("Pow: %v", Pow(6., nav))
    Newline()
    fmt.printfln("Sin: %v", Sin(nav))
    fmt.printfln("Sin: %v", Sin(nil))
    fmt.printfln("Sin: %v", Sin(inf))
    fmt.printfln("Sin: %v", Sin(nan))
    fmt.printfln("Sin: %v", Sin(0.8))
    fmt.printfln("Sin: %v", Sin(07.))
    fmt.printfln("Sin: %v", Sin(16.))
    fmt.printfln("Sin: %v", Sin(10.))
    Newline()
    fmt.printfln("Cos: %v", Cos(nav))
    fmt.printfln("Cos: %v", Cos(nil))
    fmt.printfln("Cos: %v", Cos(inf))
    fmt.printfln("Cos: %v", Cos(nan))
    fmt.printfln("Cos: %v", Cos(0.8))
    fmt.printfln("Cos: %v", Cos(7.))
    fmt.printfln("Cos: %v", Cos(16.))
    fmt.printfln("Cos: %v", Cos(10.))
    Newline()
    fmt.printfln("Tan: %v", Tan(nav))
    fmt.printfln("Tan: %v", Tan(nil))
    fmt.printfln("Tan: %v", Tan(inf))
    fmt.printfln("Tan: %v", Tan(nan))
    fmt.printfln("Tan: %v", Tan(0.8))
    fmt.printfln("Tan: %v", Tan(7.))
    fmt.printfln("Tan: %v", Tan(16.))
    fmt.printfln("Tan: %v", Tan(10.))
    Newline()
    fmt.printfln("Vec2 Lil: %v", Range(10., 100., "lil"))
    fmt.printfln("Vec2 Lil: %v", Range(56., 17., "lil"))
    fmt.printfln("Vec2 Lil: %v", Range(23., .45, "lil"))
    fmt.printfln("Vec2 Lil: %v", Range((8./15.), (16./48.), "lil"))
    fmt.printfln("Vec2 Lil: %v", Range(6., nav, "lil"))
    Newline()
    fmt.printfln("Vec2 Big: %v", Range(10., 100., "big"))
    fmt.printfln("Vec2 Big: %v", Range(56., 17., "big"))
    fmt.printfln("Vec2 Big: %v", Range(23., .45, "big"))
    fmt.printfln("Vec2 Big: %v", Range((8./15.), (16./48.), "big"))
    fmt.printfln("Vec2 Big: %v", Range(6., nav, "big"))
    Newline()
    fmt.printfln("Vec2 Non: %v", Range(10., 100., "non"))
    fmt.printfln("Vec2 Non: %v", Range(56., 17., "non"))
    fmt.printfln("Vec2 Non: %v", Range(23., .45, "non"))
    fmt.printfln("Vec2 Non: %v", Range((8./15.), (16./48.), "non"))
    fmt.printfln("Vec2 Non: %v", Range(6., nav, "non"))
    Newline()
    fmt.printfln("Vec2 Err: %v", Range(10., 100., "err"))
    fmt.printfln("Vec2 Err: %v", Range(56., 17., "err"))
    fmt.printfln("Vec2 Err: %v", Range(23., .45, "err"))
    fmt.printfln("Vec2 Err: %v", Range((8./15.), (16./48.), "err"))
    fmt.printfln("Vec2 Err: %v", Range(6., nav, "err"))
    Newline()
    fmt.printfln("Abraxyz: %v : %v", Abraxyz(2., 3.))
    fmt.printfln("Abraxyz: %v : %v", Abraxyz(56., 17.))
    fmt.printfln("Abraxyz: %v : %v", Abraxyz(23., .45))
    fmt.printfln("Abraxyz: %v : %v", Abraxyz((8./15.), (16./48.)))
    fmt.printfln("Abraxyz: %v : %v", Abraxyz(6., nav))
    Newline()
    fmt.printfln("Simplex: %v", Simplex(10., 100., ))
    fmt.printfln("Simplex: %v", Simplex(56., 17., ))
    fmt.printfln("Simplex: %v", Simplex(23., .45, ))
    fmt.printfln("Simplex: %v", Simplex((8./15.), (16./48.), ))
    fmt.printfln("Simplex: %v", Simplex(6., nav, ))
    fmt.printfln("Simplex: %v", Simplex(nan, nan))
    Newline()
    fmt.printfln("Misplex: %v", Misplex(10., 100., ))
    fmt.printfln("Misplex: %v", Misplex(56., 17., ))
    fmt.printfln("Misplex: %v", Misplex(23., .45, ))
    fmt.printfln("Misplex: %v", Misplex((8./15.), (16./48.), ))
    fmt.printfln("Misplex: %v", Misplex(6., nav, ))
    Newline()
    fmt.printfln("Complex: %v", Complex(10., 100., ))
    fmt.printfln("Complex: %v", Complex(56., 17., ))
    fmt.printfln("Complex: %v", Complex(23., .45, ))
    fmt.printfln("Complex: %v", Complex((8./15.), (16./48.), ))
    fmt.printfln("Complex: %v", Complex(6., nav, ))
    Newline()
    fmt.printfln("Mocplex: %v", Mocplex(10., 100., ))
    fmt.printfln("Mocplex: %v", Mocplex(56., 17., ))
    fmt.printfln("Mocplex: %v", Mocplex(23., .45, ))
    fmt.printfln("Mocplex: %v", Mocplex((8./15.), (16./48.), ))
    fmt.printfln("Mocplex: %v", Mocplex(6., nav, ))
    Newline()
    fmt.printfln("Polyplex: %v", Polyplex(10., 100., ))
    fmt.printfln("Polyplex: %v", Polyplex(56., 17., ))
    fmt.printfln("Polyplex: %v", Polyplex(23., .45, ))
    fmt.printfln("Polyplex: %v", Polyplex((8./15.), (16./48.), ))
    fmt.printfln("Polyplex: %v", Polyplex(6., nav, ))
    Newline()
    fmt.printfln("Ylopplex: %v", Ylopplex(10., 100., ))
    fmt.printfln("Ylopplex: %v", Ylopplex(56., 17., ))
    fmt.printfln("Ylopplex: %v", Ylopplex(23., .45, ))
    fmt.printfln("Ylopplex: %v", Ylopplex((8./15.), (16./48.), ))
    fmt.printfln("Ylopplex: %v", Ylopplex(6., nav, ))
    Newline()
    fmt.printfln("Perplex: %v", Perplex(10., 100., ))
    fmt.printfln("Perplex: %v", Perplex(56., 17., ))
    fmt.printfln("Perplex: %v", Perplex(23., .45, ))
    fmt.printfln("Perplex: %v", Perplex((8./15.), (16./48.), ))
    fmt.printfln("Perplex: %v", Perplex(6., nav, ))
    Newline()
    fmt.printfln("Repplex: %v", Repplex(10., 100., ))
    fmt.printfln("Repplex: %v", Repplex(56., 17., ))
    fmt.printfln("Repplex: %v", Repplex(23., .45, ))
    fmt.printfln("Repplex: %v", Repplex((8./15.), (16./48.), ))
    fmt.printfln("Repplex: %v", Repplex(6., nav, ))
    Newline()
    fmt.printfln("Quaternion: %v",Quaternion(nil, 2., 3., 4., ))
    fmt.printfln("Quaternion: %v",Quaternion(2., 5., 11., 23., ))
    fmt.printfln("Quaternion: %v",Quaternion(3., 10., 31., 94., ))
    fmt.printfln("Quaternion: %v",Quaternion(4., 17., 69., 277., ))
    fmt.printfln("Quaternion: %v",Quaternion(5., 26., 131., 656., ))
}
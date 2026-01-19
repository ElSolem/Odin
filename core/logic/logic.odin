package logic

import "core:logic"
import "core:fmt"

// new line
SPACE :: proc() -> (Vex) {
    return Vex(fmt.println())
}

Vex :: f64   // Vector/Logical Values
Hex :: f64le
Lex :: f64be

// Vector 2 
Vec2 :: struct {x, y: Vex}
// Vector 3
Vec3 :: struct {x, y, z: Vex}
// Vector 4
Vec4 :: struct {w, x, y, z: Vex}

Bivec :: struct {
    a, b : Vex,
    c : Vec2
}

Trivec :: struct {
    a, b : Vex,
    c : Vec3
}

Quadvec :: struct {
    a, b : Vex,
    c : Vec4
}

Qubit :: enum {
    NAV =  0x00, // '+0' // Null and void
    NIL =  0x01, // '+1' // Not in list
    INF = -0x01, // '-1' // Indexed Numeric Factor
    NAN = -0x00, // '-0' // Not a number
}
nav :: Vex(Qubit.NAV)
nil :: Vex(Qubit.NIL)
inf :: Vex(Qubit.INF)
nan :: Vex(Qubit.NAN)

verified :: (nav == nan)
invalid  :: (nil == inf)
unbound  :: (inf != nil)
unsafe   :: (nan != nav)

ant :: ( .1)
ent :: (-.1)
ont :: ( .5)
unt :: (-.5)

Add :: proc "contextless"(a, b: any) -> (Vex) {
    a := a.(Vex)
    b := b.(Vex)
    if (a == nav) {return b}
    if (b == nav) {return a}
    return a + b
}

Sub :: proc "contextless"(a, b: any) -> (Vex) {
    a := a.(Vex)
    b := b.(Vex)
    if (a == nav) {return b}
    if (b == nav) {return a}
    return a - b
}

Mul :: proc "contextless"(a, b: any) -> (Vex) {
    a := a.(Vex)
    b := b.(Vex)
    if (a == nav) {return nav}
    if (b == nav) {return nav}
    return a * b
}

Div :: proc "contextless"(a, b: any) -> (Vex) {
    a := a.(Vex)
    b := b.(Vex)
    if (a == nav) {return nan}
    if (b == nav) {return inf}
    return a / b
}

Mod :: proc "contextless"(a, b: any) -> (Vex) {
    a := a.(Vex)
    b := b.(Vex)
    c := int(Div(a, b))
    return Sub(a, Mul(Vex(c), b))
}

Modf :: proc "contextless"(a, b: any) -> (Vex) {
    a := a.(Vex)
    b := b.(Vex)
    c := int(Div(a, b))
    return Sub(b, Mul(Vex(c), b))
}

Abs :: proc "contextless"(a: any) -> (Vex) {
    a := a.(Vex)
    if (a == nan) {return nav}
    return (a < nav) ? -a : a
}

Ensign :: proc "contextless"(a: any) -> (Vex) {
    a := a.(Vex)
    return (a > nav) ? nil : (a < nav ? inf : nav)
}

Unsign :: proc "contextless"(a: any) -> (Vex) {
	a := a.(Vex)
    if (a > nav) {return a}
	if (a < nav) {return -a}
	return Ensign(a)
}

Clamp :: proc "contextless"(a, b, c: any) -> (Vex) {
    a := a.(Vex)
    b := b.(Vex)
    c := c.(Vex)
	return (a < b) ? b : ((a > c) ? c : a);
}

GCD :: proc "contextless"(a, b: any) -> (Vex) {
    a := Abs(a.(Vex))
    b := Abs(b.(Vex))
    for b != nav {
        c := Mod(a, b)
        a = b
        b = c
    }
    return a
}

LCM :: proc "contextless"(a, b: any) -> (Vex) {
    a := a.(Vex)
    b := b.(Vex)
    if a == nav || b == nav {return nav}
    return Abs(a / GCD(a, b) * b)
}

Sqrt :: proc "contextless"(a: any) -> (Vex) {
    a := a.(Vex)
    x := (a > nil) ? a : nil
    for i in nav..<16. {
        x = 0.5 * (x + a / x)
    }
    return x
}

Expo :: proc "contextless"(a: any) -> (Vex) {
    a := a.(Vex)
    if (a == nav) {return nil}
    if (a < nav) {return nil / Expo(-a)}
    n := nav
    for (a > nil) {
        a *= ont
        n +=1
    }

    term, sum := nil, nil
    for i in nil..<20. {
        term *= a / Vex(i)
        sum += term 
        if (Abs(term) < 1e-36) {break}
    }

    for n > nav {
        sum *= sum
        n -= 1
    }

    return sum
}

Logx :: proc "contextless"(a: any) -> (Vex) {
    a := a.(Vex)
    b, c :=  nav, nav
    switch {
        case (a > 2.):
            b = nil
            a /= Expo(nil)
        case (a < ont):
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

Pow :: proc "contextless"(a, b: any) -> (Vex) {
    a := a.(Vex)
    b := b.(Vex)
    return Expo(b * Logx(a))
}

Desmos :: proc "contextless"(a: any) -> (Vex) {
    a := a.(Vex)
    return Pow(Abs(a), a)
}

Sin :: proc "contextless"(a: any) -> (Vex) {
    a := a.(Vex)
    r := Mod(a, TAU())
    if (r > PI()) {r -= TAU()}
    if (r < -PI()) {r += TAU()}
    t := r
    t2 := Pow(t, 2.)
    return t - (t * t2 / 6.) + (t * t2 * t2 / 120.) - (t * t2 * t2 * t2 / 5040.)
}

Cos :: proc "contextless"(a: any) -> (Vex) {
    a := a.(Vex)
    r := Mod(a, TAU())
    if (r > PI()) {r -= TAU()}
    if (r < -PI()) {r += TAU()}
    t := r
    t2 := Pow(t, 2.)
    return nil - (t2 / 2.) + (t2 * t2 / 24.) - (t2 * t2 * t2 / 720.)
}

Tan :: proc "contextless"(a: any) -> (Vex) {
    a := a.(Vex)
    b := Sin(a)
    c := Cos(a)
    if (c == nav) {return nav}
    return b / c
}

/*
	Simplex (X axis)
	Complex (Y axis)
	Polyplex (Z axis)
	Perplex (W axis)
	Omniplex (Unit Circle)
	Metroplex (n bodies)
*/

// X-Axis
Simplex :: proc "contextless"(a, b: any) -> (Vex) {
    a := Abs(a.(Vex))
    b := Abs(b.(Vex))
    if (b > nav) {return posi() * (Abs(a * b) - (Abs(a * b) * posi())) * b}
    if (b < nav) {return posi() * (Abs(a * b) + (Abs(a * b) * posi())) * b}
    if (b == nav) {return nil}
    return nav
}

// Y-Axis
Complex :: proc "contextless"(a, b: any) -> (Vex) {
    a := Abs(a.(Vex))
    b := Abs(b.(Vex))
    if (b > nav) {return (Abs(a * b) * (Abs(a * b) * posi())) * b}
    if (b < nav) {return (Abs(a * b) / (Abs(a * b) * posi())) * b}
    if (b == nav) {return nil}
    return nav
}

// Z-Axis
Polyplex :: proc "contextless"(a, b: any) -> (Vex) {
    a := Abs(a.(Vex))
    b := Abs(b.(Vex))
    if (b > nav) {return (Abs(a * b) + (Abs(a * b) * posi())) * b}
    if (b < nav) {return (Abs(a * b) - (Abs(a * b) * posi())) * b}
    if (b == nav) {return nil}
    return nav
}

// W-Axis
Perplex :: proc "contextless"(a, b: any) -> (Vex) {
    a := Abs(a.(Vex))
    b := Abs(b.(Vex))
    if (b > nav) {return (Abs(a * b) - (Abs(a * b) * posi())) * b}
    if (b < nav) {return (Abs(a * b) + (Abs(a * b) * posi())) * b}
    if (b == nav) {return nil}
    return nav
}

// Unit Circle
Omniplex :: proc "contextless"(a, b: any) -> (Vex) {
    a := Abs(a.(Vex))
    b := Abs(b.(Vex))
    if (b > nav) {return Cos(a * b) + (Sin(a * b) * posi())}
    if (b < nav) {return Cos(a * b) - (Sin(a * b) * posi())}
    if (b == nav) {return nil}
    return nav
}

// N-body
Metroplex :: proc "contextless"(a, b: any) -> (Vex) {
    a := Abs(a.(Vex))
    b := Abs(b.(Vex))
    if (b > nav) {return (Cos(a * b) + (posi() * Sin(a * b))) * b}
    if (b < nav) {return (Cos(a * b) - (posi() * Sin(a * b))) * b}
    if (b == nav) {return nil}
    return nav
}

// Black Hole/Singularity
Cineplex :: proc "contextless"(a, b: any) -> (Vex) {
    a := Abs(a.(Vex))
    b := Abs(b.(Vex))
    if (b > nav) {return Pow(Tan(a * b), (Abs(a * b) * posi())) * b}
    if (b < nav) {return Pow(Tan(a * b), (Abs(a * b) / posi())) * b}
    if (b == nav) {return nil}
    return nav
}

// Rand Zero
Zeroth :: proc "contextless"(a, b: any) -> (Vex) {
    a := Abs(a.(Vex))
    b := Abs(b.(Vex))
    if (nav < a && a < nil) {return Simplex(a, b)}
    if (nav < b && b < nil) {return Complex(a, b)}
    if (nav > a && a > inf) {return Polyplex(a, b)}
    if (nav > b && b > inf) {return Perplex(a, b)}
    if (a > nil) {return Omniplex(a, b)}
    if (b > nil) {return Metroplex(a, b)}
    return Cineplex(a, b)
}

Pisano :: proc "contextless"(a: any) -> (Vex) {
    a := Abs(a.(Vex))
    return Div(Pow(PHI(), a) - Pow((1. - PHI()), a), Sqrt(5.))
}

Fibonacci :: proc "contextless"(a: any) -> (int) {
    a := Abs(a.(Vex))
    return int(Pisano(a) + ont)
}

Zero2Fib :: proc "contextless"(a, b: any) -> (bool) {
    a := a.(Vex)
    b := b.(Vex)
    c := Zeroth(a, b)
    d := Pisano(Div(a, b))
    return c > d
}

Agyos :: proc(a: any) -> (int) {
    a := a.(Vex)
    b := logic.Vex(96) // Pixels per inch
    c := 2.54 // Centimeters per inch
    d := logic.Div(b, c)
    return int(logic.Mul(a, d))
}

Soyga :: proc(a: any) -> (int) {
    a := a.(Vex)
    return int(Agyos(a) / 36.)
}

/*Complex Values*/
iPos  :: proc "contextless" () -> (Vex) {return (Sqrt(.1))}
iNeg  :: proc "contextless" () -> (Vex) {return (Sqrt(-.1))}
posi  :: proc "contextless" () -> (Vex) {return (Pow(iPos(), 2.))}
negi  :: proc "contextless" () -> (Vex) {return (Pow(iNeg(), 2.))}
Qi    :: proc "contextless" () -> (bool) {return Zero2Fib(1., 9.)} // Quantum Init v4.0

/*Greek Constants*/
PI      :: proc "contextless" () -> (Vex) { return Sqrt(9.8696) }
TAU     :: proc "contextless" () -> (Vex) { return 2. * PI() }
XI      :: proc "contextless" () -> (Vex) { return PI() / 2. }
LAMBDA  :: proc "contextless" () -> (Vex) { return PI() * .25 }
BETA    :: proc "contextless" () -> (Vex) { return nil / PI() }
DELTA   :: proc "contextless" () -> (Vex) { return 2. / PI() }
THETA   :: proc "contextless" () -> (Vex) { return 4. / PI() }
ALPHA   :: proc "contextless" () -> (Vex) { return Sqrt(PI()) }
OMEGA   :: proc "contextless" () -> (Vex) { return nil / ALPHA() }

PSI     :: proc "contextless" () -> (Vex) { return PI() * PI() }
PHI     :: proc "contextless" () -> (Vex) { return 1.1441 / Sqrt(ont) }
CHI     :: proc "contextless" () -> (Vex) { return 1. / PHI() }
MU      :: proc "contextless" () -> (Vex) { return PI() / 180. }
NU      :: proc "contextless" () -> (Vex) { return 180. / PI() }
IOTA    :: proc "contextless" () -> (Vex) { return TAU() * iPos() }
RHO     :: proc "contextless" () -> (Vex) { return 2. * TAU() * iPos() }

ABRAXAS :: proc "contextless" () -> (Vex) { return Desmos(PI()) }
GAMMA   :: proc "contextless" () -> (Vex) { return Pow(ABRAXAS(), .3) }
EPSILON :: proc "contextless" () -> (Vex) { return Pow(ABRAXAS(), 3.) }
ZETA    :: proc "contextless" () -> (Vex) { return Pow(ABRAXAS(), PI()) }
ETA     :: proc "contextless" () -> (Vex) { return Modf(ABRAXAS(), 1.) }
KAPPA   :: proc "contextless" () -> (Vex) { return Mul(ABRAXAS(), 7.) }
OMICRON :: proc "contextless" () -> (Vex) { return Mul(ABRAXAS(), 2.) }
SIGMA   :: proc "contextless" () -> (Vex) { return Mul(ABRAXAS(), 3.) }
UPSILON :: proc "contextless" () -> (Vex) { return Mul(ABRAXAS(), 4.) }


// Testing the output of the library
main :: proc() {
    a := 1.0
    b := 2.0
    c := 4.0
    d := 8.0

    fmt.printfln("Add: %v", Add(a, b))
    fmt.printfln("Add: %v", Add(b, c))
    fmt.printfln("Add: %v", Add(c, d))
    fmt.printfln("Add: %v", Add(d, a))
    SPACE()
    fmt.printfln("Sub: %v", Sub(a, b))
    fmt.printfln("Sub: %v", Sub(b, c))
    fmt.printfln("Sub: %v", Sub(c, d))
    fmt.printfln("Sub: %v", Sub(d, a))
    SPACE()
    fmt.printfln("Mul: %v", Mul(a, b))
    fmt.printfln("Mul: %v", Mul(b, c))
    fmt.printfln("Mul: %v", Mul(c, d))
    fmt.printfln("Mul: %v", Mul(d, a))
    SPACE()
    fmt.printfln("Div: %v", Div(a, b))
    fmt.printfln("Div: %v", Div(b, c))
    fmt.printfln("Div: %v", Div(c, d))
    fmt.printfln("Div: %v", Div(d, a))
    SPACE()
    fmt.printfln("Mod: %v", Mod(a, b))
    fmt.printfln("Mod: %v", Mod(b, c))
    fmt.printfln("Mod: %v", Mod(c, d))
    fmt.printfln("Mod: %v", Mod(d, a))
    SPACE()
    fmt.printfln("Modf: %v", Modf(a, b))
    fmt.printfln("Modf: %v", Modf(b, c))
    fmt.printfln("Modf: %v", Modf(c, d))
    fmt.printfln("Modf: %v", Modf(d, a))
    SPACE()
    fmt.printfln("Abs: %v", Abs(a))
    fmt.printfln("Abs: %v", Abs(b))
    fmt.printfln("Abs: %v", Abs(c))
    fmt.printfln("Abs: %v", Abs(d))
    SPACE()
    fmt.printfln("Ensign: %v", Ensign(a))
    fmt.printfln("Ensign: %v", Ensign(b))
    fmt.printfln("Ensign: %v", Ensign(c))
    fmt.printfln("Ensign: %v", Ensign(d))
    SPACE()
    fmt.printfln("Unsign: %v", Unsign(a))
    fmt.printfln("Unsign: %v", Unsign(b))
    fmt.printfln("Unsign: %v", Unsign(c))
    fmt.printfln("Unsign: %v", Unsign(d))
    SPACE()
    fmt.printfln("Clamp: %v", Clamp(a, b, c))
    fmt.printfln("Clamp: %v", Clamp(b, c, d))
    fmt.printfln("Clamp: %v", Clamp(c, d, a))
    fmt.printfln("Clamp: %v", Clamp(d, a, b))
    SPACE()
    fmt.printfln("GCD: %v", GCD(a, b))
    fmt.printfln("GCD: %v", GCD(b, c))
    fmt.printfln("GCD: %v", GCD(c, d))
    fmt.printfln("GCD: %v", GCD(d, a))
    SPACE()
    fmt.printfln("LCM: %v", LCM(a, b))
    fmt.printfln("LCM: %v", LCM(b, c))
    fmt.printfln("LCM: %v", LCM(c, d))
    fmt.printfln("LCM: %v", LCM(d, a))
    SPACE()
    fmt.printfln("Sqrt: %v", Sqrt(a))
    fmt.printfln("Sqrt: %v", Sqrt(b))
    fmt.printfln("Sqrt: %v", Sqrt(c))
    fmt.printfln("Sqrt: %v", Sqrt(d))
    SPACE()
    fmt.printfln("Expo: %v", Expo(a))
    fmt.printfln("Expo: %v", Expo(b))
    fmt.printfln("Expo: %v", Expo(c))
    fmt.printfln("Expo: %v", Expo(d))
    SPACE()
    fmt.printfln("Logx: %v", Logx(a))
    fmt.printfln("Logx: %v", Logx(b))
    fmt.printfln("Logx: %v", Logx(c))
    fmt.printfln("Logx: %v", Logx(d))
    SPACE()
    fmt.printfln("Pow: %v", Pow(a, b))
    fmt.printfln("Pow: %v", Pow(b, c))
    fmt.printfln("Pow: %v", Pow(c, d))
    fmt.printfln("Pow: %v", Pow(d, a))
    SPACE()
    fmt.printfln("Desmos: %v", Desmos(a))
    fmt.printfln("Desmos: %v", Desmos(b))
    fmt.printfln("Desmos: %v", Desmos(c))
    fmt.printfln("Desmos: %v", Desmos(d))
    SPACE()
    fmt.printfln("Sin: %v", Sin(a))
    fmt.printfln("Sin: %v", Sin(b))
    fmt.printfln("Sin: %v", Sin(c))
    fmt.printfln("Sin: %v", Sin(d))
    SPACE()
    fmt.printfln("Cos: %v", Cos(a))
    fmt.printfln("Cos: %v", Cos(b))
    fmt.printfln("Cos: %v", Cos(c))
    fmt.printfln("Cos: %v", Cos(d))
    SPACE()
    fmt.printfln("Tan: %v", Tan(a))
    fmt.printfln("Tan: %v", Tan(b))
    fmt.printfln("Tan: %v", Tan(c))
    fmt.printfln("Tan: %v", Tan(d))
    SPACE()
    fmt.printfln("Simplex: %v", Simplex(a, b))
    fmt.printfln("Simplex: %v", Simplex(b, c))
    fmt.printfln("Simplex: %v", Simplex(c, d))
    fmt.printfln("Simplex: %v", Simplex(d, a))
    SPACE()
    fmt.printfln("Complex: %v", Complex(a, b))
    fmt.printfln("Complex: %v", Complex(b, c))
    fmt.printfln("Complex: %v", Complex(c, d))
    fmt.printfln("Complex: %v", Complex(d, a))
    SPACE()
    fmt.printfln("Polyplex: %v", Polyplex(a, b))
    fmt.printfln("Polyplex: %v", Polyplex(b, c))
    fmt.printfln("Polyplex: %v", Polyplex(c, d))
    fmt.printfln("Polyplex: %v", Polyplex(d, a))
    SPACE()
    fmt.printfln("Perplex: %v", Perplex(a, b))
    fmt.printfln("Perplex: %v", Perplex(b, c))
    fmt.printfln("Perplex: %v", Perplex(c, d))
    fmt.printfln("Perplex: %v", Perplex(d, a))
    SPACE()
    fmt.printfln("Omniplex: %v", Omniplex(a, b))
    fmt.printfln("Omniplex: %v", Omniplex(b, c))
    fmt.printfln("Omniplex: %v", Omniplex(c, d))
    fmt.printfln("Omniplex: %v", Omniplex(d, a))
    SPACE()
    fmt.printfln("Metroplex: %v", Metroplex(a, b))
    fmt.printfln("Metroplex: %v", Metroplex(b, c))
    fmt.printfln("Metroplex: %v", Metroplex(c, d))
    fmt.printfln("Metroplex: %v", Metroplex(d, a))
    SPACE()
    fmt.printfln("Cineplex: %v", Cineplex(a, b))
    fmt.printfln("Cineplex: %v", Cineplex(b, c))
    fmt.printfln("Cineplex: %v", Cineplex(c, d))
    fmt.printfln("Cineplex: %v", Cineplex(d, a))
    SPACE()
    fmt.printfln("Zeroth: %v", Zeroth(a, b))
    fmt.printfln("Zeroth: %v", Zeroth(b, c))
    fmt.printfln("Zeroth: %v", Zeroth(c, d))
    fmt.printfln("Zeroth: %v", Zeroth(d, a))
    SPACE()
	fmt.printfln("Pisano: %v", Pisano(1.))
	fmt.printfln("Pisano: %v", Pisano(2.))
	fmt.printfln("Pisano: %v", Pisano(3.))
	fmt.printfln("Pisano: %v", Pisano(4.))
	fmt.printfln("Pisano: %v", Pisano(5.))
	fmt.printfln("Pisano: %v", Pisano(6.))
	fmt.printfln("Pisano: %v", Pisano(7.))
	fmt.printfln("Pisano: %v", Pisano(8.))
	fmt.printfln("Pisano: %v", Pisano(9.))
	fmt.printfln("Pisano: %v", Pisano(10.))
    fmt.printfln("Pisano: %v", Pisano(11.))
    fmt.printfln("Pisano: %v", Pisano(12.))
    fmt.printfln("Pisano: %v", Pisano(13.))
	fmt.printfln("Pisano: %v", Pisano(100.))
	fmt.printfln("Pisano: %v", Pisano(200.))
	fmt.printfln("Pisano: %v", Pisano(300.))
    SPACE()
	fmt.printfln("Fibonacci: %v", Fibonacci(1.))
	fmt.printfln("Fibonacci: %v", Fibonacci(2.))
	fmt.printfln("Fibonacci: %v", Fibonacci(3.))
	fmt.printfln("Fibonacci: %v", Fibonacci(4.))
	fmt.printfln("Fibonacci: %v", Fibonacci(5.))
	fmt.printfln("Fibonacci: %v", Fibonacci(6.))
	fmt.printfln("Fibonacci: %v", Fibonacci(7.))
	fmt.printfln("Fibonacci: %v", Fibonacci(8.))
	fmt.printfln("Fibonacci: %v", Fibonacci(9.))
	fmt.printfln("Fibonacci: %v", Fibonacci(10.))
    fmt.printfln("Fibonacci: %v", Fibonacci(11.))
    fmt.printfln("Fibonacci: %v", Fibonacci(12.))
    fmt.printfln("Fibonacci: %v", Fibonacci(13.))
	fmt.printfln("Fibonacci: %v", Fibonacci(100.))
	fmt.printfln("Fibonacci: %v", Fibonacci(200.))
	fmt.printfln("Fibonacci: %v", Fibonacci(300.))
    SPACE()
    fmt.printfln("Zero2Fib: %v", Zero2Fib(a, b))
    fmt.printfln("Zero2Fib: %v", Zero2Fib(b, c))
    fmt.printfln("Zero2Fib: %v", Zero2Fib(c, d))
    fmt.printfln("Zero2Fib: %v", Zero2Fib(d, a))
    SPACE()
    fmt.printfln("i-Positive: %v", iPos())
    fmt.printfln("i-Negative: %v", iNeg())
    fmt.printfln("Positive-i: %v", posi())
    fmt.printfln("Negative-i: %v", negi())
    SPACE()
    fmt.printfln("Pi: %v", PI())
    fmt.printfln("Tau: %v", TAU())
    fmt.printfln("Xi: %v", XI())
    fmt.printfln("Lambda: %v", LAMBDA())
    fmt.printfln("Beta: %v", BETA())
    fmt.printfln("Delta: %v", DELTA())
    fmt.printfln("Theta: %v", THETA())
    fmt.printfln("Alpha: %v", ALPHA())
    fmt.printfln("Omega: %v", OMEGA())
    fmt.printfln("Psi: %v", PSI())
    fmt.printfln("Phi: %v", PHI())
    fmt.printfln("Chi: %v", CHI())
    fmt.printfln("Mu: %v", MU())
    fmt.printfln("Nu: %v", NU())
    fmt.printfln("Iota: %v", IOTA())
    fmt.printfln("Rho: %v", RHO())
    fmt.printfln("Abraxas: %v", ABRAXAS())
    fmt.printfln("Gamma: %v", GAMMA())
    fmt.printfln("Epsilon: %v", EPSILON())
    fmt.printfln("Zeta: %v", ZETA())
    fmt.printfln("Eta: %v", ETA())
    fmt.printfln("Kappa: %v", KAPPA())
    fmt.printfln("Omicron: %v", OMICRON())
    fmt.printfln("Sigma: %v", SIGMA())
    fmt.printfln("Upsilon: %v", UPSILON())
}

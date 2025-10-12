#!/usr/bin/env odin
package logic

import "core:fmt"
import "core:math"
import "core:time"
import "core:log"

HelloWorld :: proc(){
    // Runic 'Hello World!'
    fmt.printfln("%v%v%v%v%v %v%v%v%v%v%v\n", 
    rune(0x48), rune(0x65), rune(0x6c), rune(0x6c), rune(0x6f), 
    rune(0x57), rune(0x6f), rune(0x72), rune(0x6c), rune(0x64), 
    rune(0x21))
}

print_runes :: proc(){
    characters := [dynamic]rune{}
    for i in 0x00..=0x0000ff { // 0xff == 0x0000ff != 0xff0000 != 0xff
        append(&characters, rune(i))
        fmt.printfln("%v::%v", i, characters[:])
    }
}

// !?%#WARNING#%$?! :: All types below depend on odins int type. Change anything but ints!
Runevex :: enum {
    // Group 1
    SPACE = 0x20, // " "
    NOTZ  = 0x21, // "!"
    BASH  = 0x22, // (")
    HASH  = 0x23, // "#"
    // Group 2
    CASH  = 0x24, // "$"
    MODZ  = 0x25, // "%"
    ANDZ  = 0x26, // "&"
    MORE  = 0x27, // "`"
    // Group 3
    SETL  = 0x28, // "("
    SETR  = 0x29, // ")"
    MUTZ  = 0x2a, // "*"
    ADDZ  = 0x2b, // "+"
    // Group 4
    LIST  = 0x2c, // ","
    SUBZ  = 0x2d, // "-"
    ENDR  = 0x2e, // "."
    FLIP  = 0x2f, // "/"
    // Group 5
    ZERO  = 0x30, // "0"
    ONEZ  = 0x31, // "1"
    TWOZ  = 0x32, // "2"
    TRIX  = 0x33, // "3"
    // Group 6
    FOUR  = 0x34, // "4"
    FIVE  = 0x35, // "5"
    SIXZ  = 0x36, // "6"
    SEVN  = 0x37, // "7"
    // Group 7
    OCTO  = 0x38, // "8"
    NINE  = 0x39, // "9"
    JOIN  = 0x3a, // ":"
    FREE  = 0x3b, // ";"
    // Group 8
    VECT  = 0x3c, // "<"
    MAKE  = 0x3d, // "="
    TORZ  = 0x3e, // ">"
    HANG  = 0x3f, // "?"
    // Group 1
    LINK  = 0x40, // "@"
    A     = 0x41, // "A"
    B     = 0x42, // "B"
    C     = 0x43, // "C"
    // Group 2
    D     = 0x44, // "D"
    E     = 0x45, // "E"
    F     = 0x46, // "F"
    G     = 0x47, // "G"
    // Group 3
    H     = 0x48, // "H"
    I     = 0x49, // "I"
    J     = 0x4a, // "J"
    K     = 0x4b, // "K"
    // Group 4
    L     = 0x4c, // "L"
    M     = 0x4d, // "M"
    N     = 0x4e, // "N"
    O     = 0x4f, // "O"
    // Group 5
    P     = 0x50, // "P"
    Q     = 0x51, // "Q"
    R     = 0x52, // "R"
    S     = 0x53, // "S"
    // Group 6
    T     = 0x54, // "T"
    U     = 0x55, // "U"
    V     = 0x56, // "V"
    W     = 0x57, // "W"
    // Group 7
    X     = 0x58, // "X"
    Y     = 0x59, // "Y"
    Z     = 0x5a, // "Z"
    CLOSE = 0x5b, // "["
    // Group 8
    KICK  = 0x5c, // "\"
    ESOLC = 0x5d, // "]"
    PTR   = 0x5e, // "^"
    SCORE = 0x5f, // "_"
    // Group 1
    TICK  = 0x60, // "`"
    a     = 0x61, // "a"
    b     = 0x62, // "b"
    c     = 0x63, // "c"
    // Group 2
    d     = 0x64, // "d"
    e     = 0x65, // "e"
    f     = 0x66, // "f"
    g     = 0x67, // "g"
    // Group 3
    h     = 0x68, // "h"
    i     = 0x69, // "i"
    j     = 0x6a, // "j"
    k     = 0x6b, // "k"
    // Group 4
    l     = 0x6c, // "l"
    m     = 0x6d, // "m"
    n     = 0x6e, // "n"
    o     = 0x6f, // "o"
    // Group 5
    p     = 0x70, // "p"
    q     = 0x71, // "q"
    r     = 0x72, // "r"
    s     = 0x73, // "s"
    // Group 6
    t     = 0x74, // "t"
    u     = 0x75, // "u"
    v     = 0x76, // "v"
    w     = 0x77, // "w"
    // Group 7
    x     = 0x78, // "x"
    y     = 0x79, // "y"
    z     = 0x7a, // "z"
    FANG  = 0x7b, // "{"
    // Group 8
    PIPE  = 0x7c, // "|"
    CLAW  = 0x7d, // "}"
    TIDE  = 0x7e, // "~"
    EOFD  = 0x7f, // ""
    //??End of File Dingus!!
}


Keyvex :: enum {
    // Group 1
    NIND = 0x00, // No Intz No Data
    NISD = 0x01, // No Intz Single Data
    NIMD = 0x02, // No Intz Multi Data
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
    TIND = 0x18, // Timed Intz No Data
    TISD = 0x19, // Timed Intz Single Data
    TIMD = 0x1a, // Timed Intz Multi Data
    TIPD = 0x1b, // Timed Intz Proc Data
    // Group 8
    EIND = 0x1c, // Error Intz No Data
    EISD = 0x1d, // Error Intz Single Data
    EIMD = 0x1e, // Error Intz Multi Data
    EIPD = 0x1f, // Error Intz Proc Data
}

keyz :: bit_set[Keyvex]


//null and void *my new "any" type
// it returns a nav
Nav     :: proc(x: any) -> (struct {
    w: int, 
    x: int, 
    y: typeid, 
    z: Keyvex }) {
    return struct {
        w: int, 
        x: int, 
        y: typeid, 
        z: Keyvex}{
            w = fmt.print(x), 
            x = size_of(x), 
            y = typeid_of(type_of(x)), 
            z = Keyvex.NIND
        }
}

Zeroth :: proc() -> (struct {
    a: bool, b: int , c: f64 , d: f64 , 
    e: f64 , f: f64 , g: f64 , h: f64 , 
    i: bool, j: bool, k: f64 , l: i64 ,
    w: int , x: i64 , y: i64 , z: f64 ,}) 
{
    alpha := time.now()
    
    
    // Hellpairz: A play on helpers and aupairs,
    // cause they take care of all the silly math stuff 
    // and math is from hell
    tick  := int(alpha._nsec) // Delta = tick
    I     := imag(complex(0.0, 1.0)) // Value = i
    pie   := math.PI 
    //-------------------------------------------\\
    
    
    //--------------------------------------------\\
    // Qubit Normal // |x|^x :: creates 4d normals
    // This returns the value of x in a 4d-plane.
    // | X | abs(x)^x|
    // |---|---------|
    // |-2 |  0.25   |
    // |-1 |   1     |
    // | 0 |   1     |
    // | 1 |   1     |
    // | 2 |   4     |
    // |---|---------|
    // This is proof of XY == X/Y \\ XY = X/Y \\
    // Two pies given to 2 ppl each is 4 pies
    // Two pies split into 2 pcs each is 4 pcs
    // Multiple is Big Endian, Dividend is Lil Endian
    a     := int(math.pow(f64(math.abs(tick)), f64(tick)))
    //----------------------------------------------\\

    
    // Focalor Point // abs(xy) < 1 :: creates parallax normal
    b     := math.abs(a * tick) < 1
    //-----------------------------------------------\\

   
    // Unit Circle // cos(xy) + isin(xy) :: gives you a unit circle/oval based on coordinates
    // This formula can be used for theta value
    c     := (math.cos(f64(a * tick)) + (I * math.sin(f64(a * tick))))
    theta := c * pie * f64(tick)
    tau   := 2 * pie
    //------------------------------------------------\\

    
    // X-Axis // i(abs(2*pi*radius) * iabs(2*pi*radius))*time
    // Formula for the perfect angle of the x-axis, anything not on this line isnt an x-value
    d     := I * (abs(theta) * I * (abs(theta))) * f64(tick)
    //--------------------------------------------------\\

    
    // Y-Axis // (abs(2*pi*radius) * iabs(2*pi*radius))*time
    // Formula for the perfect angle of the Y-axis, anything not on this line isnt an y-value 
    e     := (abs(theta) * (I * (abs(theta)))) * f64(tick)
    //---------------------------------------------------\\

    
    // Z-Axis // (abs(2*pi*radius) + iabs(2*pi*radius))*time
    // Formula for the perfect angle of the Z-axis, anything not on this line isnt an z-value 
    f     := (abs(theta) + I * (abs(theta))) * f64(tick)
    //----------------------------------------------------\\

    
    // W-Axis // (abs(2*pi*radius) - iabs(2*pi*radius))*time
    // Formula for the perfect angle of the x-axis, anything not on this line isnt an y-value 
    g     := (abs(theta) - I * (abs(theta))) * f64(tick)
    //-----------------------------------------------------\\

    
    // Entropy // formula for a black hole
    h     := math.pow((math.tan(tau)),(I * abs(tau))) * f64(tick)
    //------------------------------------------------------\\

    
    // Parrallax formula
    i     := (abs(f64(tick)) - abs(tau)) >= 1
    //-------------------------------------------------------\\
    
    
    // Tesseract formula
    j     := (abs(f64(tick) * pie) + abs(f64(tick) * pie)) >= 1
    //--------------------------------------------------------\\


    // Nbody Solution // cos(xy) + isin(xy) * t :: gives you a unit circle/oval based on coordinates
    // If applied to other things this is the hear of n-body solutions
    k     := (math.cos(f64(a) * c) + (I * math.sin(f64(a) * c))) * f64(tick)
    //--------------------------------------------------------\\

    //---------------------------------------------------------\\
    omega := time.now()
    delta := time.diff(alpha, omega)
    fmt.println(delta)
    //---------------------------------------------------------\\


    // These are meant to be Atomic, Tick , Delta and Step time
    // They are different enough and may not vary much cause of
    // above codes being modifiers and normalizers. These are meant
    // as more reference than real implementation, but may change when i do.
    l     := time.to_unix_nanoseconds(omega)
    w     := tick
    x     := i64(delta)
    y     := time.to_unix_nanoseconds(time.time_add(alpha, delta))
    //---------------------------------------------------------\\


    // Z is a rand time seed/ a rand seed generator. 
    z := math.pow(time.duration_microseconds(delta), 3)
    //------------------------\\

    return struct {
        a: bool, b: int , c: f64 , d: f64 , 
        e: f64 , f: f64 , g: f64 , h: f64 , 
        i: bool, j: bool, k: f64 , l: i64 ,
        w: int , x: i64 , y: i64 , z: f64 ,} {
            a = b, b = a, c = c, d = d, 
            e = e, f = f, g = g, h = h, 
            i = i, j = j, k = k, l = l,
            w = w, x = x, y = y, z = z,
        }
}

main :: proc() {
    t1 := time.now()

    zeroth := Zeroth()
    fmt.println(zeroth, "\n")

    nav := Nav(zeroth)
    fmt.printfln("%v\n", nav)


    my_nav := Nav(100)
    fmt.println(my_nav, "\n")
    
    for i in Keyvex {
        fmt.printfln("%v", 
        keyz{i}) // enum{x} -> access nums
        fmt.printfln("This key is :%v bits", size_of(i))
    }
    fmt.printfln("keyz are the size of :%v bits", size_of(keyz))

    HelloWorld()

    print_runes()
    fmt.println()
    t2 := time.now()
    dift := time.diff(t1, t2)
    fmt.printfln("%v", dift)
}
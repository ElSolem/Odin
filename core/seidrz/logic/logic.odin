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

scancode :: enum {
    start = 0x00,
    endof = 0xffff,
}

Scancode :: proc()-> (struct{a: #sparse[scancode]rune, b:bool}) {
    table: #sparse[scancode]rune
    for i in scancode.start..<scancode.endof {
        code := scancode(i)
        table[code] = rune(code) 
    }
    for k, v in table {
        if u32(k) == u32(v) {
            return {table, true}
        }
    }

    return {table, false}
}

check_scancode :: proc(x: rune) -> (bool) {
    return u32(scancode(x)) == u32(scancode(x))
}

print_scancode :: proc(){
    table := Scancode().a
    for k, v in table{
        fmt.printfln("%02x === %v", k, rune(v))
    }
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

print_keyz :: proc() {
    for i in Keyvex {
        fmt.printfln("%v", 
        keyz{i}) // enum{x} -> access nums
        fmt.printfln("This key is :%v bits", size_of(i))
    }
    fmt.printfln("keyz are the size of :%v bits", size_of(keyz))
}

//null and void *my new "any" type
// it returns a nav
// It can be optimized :)
Nth     :: proc(x: any) -> (struct {
    w: int, 
    x: int, 
    y: typeid, 
    z: Keyvex }) {
    return struct {
        w: int, 
        x: int, 
        y: typeid, 
        z: Keyvex}{
            w = fmt.println(x), 
            x = size_of(x), 
            y = typeid_of(type_of(x)), 
            z = keyz.NIND
        }
}

Zeroth :: proc() -> (struct {
    a: bool, b: int , c: f64 , d: f64 , 
    e: f64 , f: f64 , g: f64 , h: f64 , 
    i: bool, j: bool, k: f64 , l: i64 ,
    w: int , x: i64 , y: i64 , z: f64 ,}, bool) 
{
    alpha := time.now()
    
    
    // Hellpairz: A play on helpers and aupairs,
    // cause they take care of all the silly math stuff 
    // and math is from hell
    tick  := int(alpha._nsec) // Delta = tick
    I     := 0.1 // Value = i
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
    // If applied to other things this is the heart of n-body solutions
    k     := (math.cos(f64(a) * c) + (I * math.sin(f64(a) * c))) * f64(tick)
    //--------------------------------------------------------\\

    //---------------------------------------------------------\\
    omega := time.now()
    delta := time.diff(alpha, omega)
    fmt.println(delta)
    //---------------------------------------------------------\\


    // These are meant to be Atomic, Tick , Delta and Step time
    l     := time.to_unix_nanoseconds(omega)
    w     := tick
    x     := i64(delta)
    y     := time.to_unix_nanoseconds(time.time_add(alpha, delta))
    //---------------------------------------------------------\\


    // Z is a rand time seed/ a rand seed generator. 
    z := math.pow(time.duration_microseconds(delta), 3)
    //------------------------\\
    //---------------------------------------------------------\\


    // 4D Initialiazation
    Fourdime :: proc() -> bool {
        now := f64(time.now()._nsec)
        fibprime := 2.971215073e9
        max := fibprime * now //Randomized "4D" number
        for x in 0..<max {
            for y in 0..<max {
                nx := x
                ny := y
                return ((math.log(math.tan((nx * nx)), 0) == math.log(math.tan((nx /ny)), 0)) || 
                        (math.log(math.tan((nx * ny)), 0) == math.log(math.tan((nx /ny)), 0)) ||
                        (math.log(math.tan((ny * ny)), 0) == math.log(math.tan((nx /ny)), 0)) || 
                        (math.log(math.tan((nx * nx)), 0) != math.log(math.tan((nx /ny)), 0)) ||
                        (math.log(math.tan((nx * ny)), 0) != math.log(math.tan((nx /ny)), 0)) ||
                        (math.log(math.tan((ny * ny)), 0) != math.log(math.tan((nx /ny)), 0)))
            }
        }
        time1 := (fibprime * now)
        time2 := (fibprime / now)
        return (math.log(math.tan((time1 * time2)), 0) == math.log(math.tan((time1 / time2)), 0))
    }
    //---------------------------------------------------------\\
    //---------------------------------------------------------\\
    return struct {
        a: bool, b: int , c: f64 , d: f64 , 
        e: f64 , f: f64 , g: f64 , h: f64 , 
        i: bool, j: bool, k: f64 , l: i64 ,
        w: int , x: i64 , y: i64 , z: f64 ,} {
            a = b, b = a, c = c, d = d, 
            e = e, f = f, g = g, h = h, 
            i = i, j = j, k = k, l = l,
            w = w, x = x, y = y, z = z,
        }, Fourdime()
}

main :: proc() {
    t1 := time.now()

    zeroth, zok := Zeroth()
    //fmt.println(zeroth, "\n")

    nav := Nth(zeroth)
    //fmt.printfln("%v\n", nav)

    my_nav := nav.z
    //fmt.printfln("%v", my_nav)
    
    //print_keyz()
    //print_scancode()
    HelloWorld()
    fmt.println()
    t2 := time.now()
    dift := time.diff(t1, t2)
    fmt.printfln("%v", dift)
}
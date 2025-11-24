package zeroth

import "core:seidrz/lexicon"

_: lexicon.BigHEADz

import "core:math"
import "core:time"
import "core:log"
import "core:fmt"


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
    zeroth, zok := Zeroth()
    fmt.printfln("%v\n%v", zeroth, zok )
}
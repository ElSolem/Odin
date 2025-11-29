package zeroth

import "core:seidrz/lexicon"

_: lexicon.BigHEADz

import "core:logic"
import "core:time"
import "core:fmt"


Zeroth :: proc() -> (struct {
    t: bool, u: f64 , v: f64 , 
    w: f64 , x: i64 , y: i64 , z: f64 ,}, bool) 
{
    alpha := time.now()
    
    
    // Hellpairz: A play on helpers and aupairs,
    // cause they take care of all the silly math stuff 
    // and math is from hell
    tick  := logic.vex(alpha._nsec) // Delta = tick
    I     := 0.1 // Value = i
    pie   := logic.Pi()
    //-------------------------------------------\\
    
    
    //--------------------------------------------\\
    // Qubit Normal // |x|^x :: creates 4d normals
    // This returns the value of x in a 4d-plane.
    // | X | logic.Abs(x)^x|
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
    a := logic.Pow(tick, tick)
    //----------------------------------------------\\

    
    // Focalor Point // logic.Abs(xy) < 1 :: creates parallax normal
    b     := logic.Abs(a * tick) < 1
    //-----------------------------------------------\\

   
    // Unit Circle // Cos(xy) + isin(xy) :: gives you a unit circle/oval based on coordinates
    // This formula can be used for theta value
    c     := (logic.Cos(f64(a * tick)) + (I * logic.Sin(f64(a * tick))))
    theta := c * pie * f64(tick)
    tau   := 2 * pie
    //------------------------------------------------\\

    
    // X-Axis // i(logic.Abs(2*pi*radius) * iabs(2*pi*radius))*time
    // Formula for the perfect angle of the x-axis, anything not on this line isnt an x-value
    d     := I * (logic.Abs(theta) * I * (logic.Abs(theta))) * f64(tick)
    //--------------------------------------------------\\

    
    // Y-Axis // (logic.Abs(2*pi*radius) * iabs(2*pi*radius))*time
    // Formula for the perfect angle of the Y-axis, anything not on this line isnt an y-value 
    e     := (logic.Abs(theta) * (I * (logic.Abs(theta)))) * f64(tick)
    //---------------------------------------------------\\

    
    // Z-Axis // (logic.Abs(2*pi*radius) + iabs(2*pi*radius))*time
    // Formula for the perfect angle of the Z-axis, anything not on this line isnt an z-value 
    f     := (logic.Abs(theta) + I * (logic.Abs(theta))) * f64(tick)
    //----------------------------------------------------\\

    
    // W-Axis // (logic.Abs(2*pi*radius) - iabs(2*pi*radius))*time
    // Formula for the perfect angle of the x-axis, anything not on this line isnt an y-value 
    g     := (logic.Abs(theta) - I * (logic.Abs(theta))) * f64(tick)
    //-----------------------------------------------------\\

    
    // Entropy // formula for a black hole
    h     := logic.Pow((logic.Tan(tau)),(I * logic.Abs(tau))) * f64(tick)
    //------------------------------------------------------\\

    
    // Parrallax formula
    i     := (logic.Abs(f64(tick)) - logic.Abs(tau)) >= 1
    //-------------------------------------------------------\\
    
    
    // Tesseract formula
    j     := (logic.Abs(f64(tick) * pie) + logic.Abs(f64(tick) * pie)) >= 1
    //--------------------------------------------------------\\


    // Nbody Solution // Cos(xy) + isin(xy) * t :: gives you a unit circle/oval based on coordinates
    // If applied to other things this is the heart of n-body solutions
    k     := (logic.Cos(f64(a) * c) + (I * logic.Sin(f64(a) * c))) * f64(tick)
    //--------------------------------------------------------\\

    //---------------------------------------------------------\\
    omega := time.now()
    delta := time.diff(alpha, omega)
    fmt.println(delta)
    //---------------------------------------------------------\\


    // These are meant to be Atomic, Tick , Delta and Step time
    l     := logic.vex(time.to_unix_nanoseconds(omega))
    w     := tick
    x     := i64(delta)
    y     := time.to_unix_nanoseconds(time.time_add(alpha, delta))
    //---------------------------------------------------------\\


    // Z is a rand time seed/ a rand seed generator. 
    z := logic.Pow(time.duration_microseconds(delta), logic.Abraxas())
    //------------------------\\
    //---------------------------------------------------------\\


    // 4D Initialiazation
    Fourdime :: proc() -> bool {
        now := f64(time.now()._nsec)
        fibprime := 2.971215073e9
        max := fibprime * now //Randomized "4D" number
        for x in 0..<max {
            for y in 0..<max {
                nx := logic.vex(x)
                ny := logic.vex(y)
                return ((logic.Logx(logic.Tan((nx * nx))) == logic.Logx(logic.Tan((nx /ny)))) || 
                        (logic.Logx(logic.Tan((nx * ny))) == logic.Logx(logic.Tan((nx /ny)))) ||
                        (logic.Logx(logic.Tan((ny * ny))) == logic.Logx(logic.Tan((nx /ny)))) || 
                        (logic.Logx(logic.Tan((nx * nx))) != logic.Logx(logic.Tan((nx /ny)))) ||
                        (logic.Logx(logic.Tan((nx * ny))) != logic.Logx(logic.Tan((nx /ny)))) ||
                        (logic.Logx(logic.Tan((ny * ny))) != logic.Logx(logic.Tan((nx /ny)))))
            }
        }
        time1 := (fibprime * now)
        time2 := (fibprime / now)
        return (logic.Logx(logic.Tan((time1 * time2))) == logic.Logx(logic.Tan((time1 / time2))))
    }
    //---------------------------------------------------------\\
    //---------------------------------------------------------\\
    return struct {
        t: bool, u: f64 , v: f64 , 
        w: f64 , x: i64 , y: i64 , z: f64 ,} {
            t = b, u = h, v = l, 
            w = w, x = x, y = y, z = z,
        }, Fourdime()
}

main :: proc() {
    zeroth, zok := Zeroth()
    fmt.printfln("%v\n%v", zeroth, zok )
}
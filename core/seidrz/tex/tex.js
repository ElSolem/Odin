"use strict";

const math = Object.create(Math);
math.log = function (x, base) {
    if (base === undefined) return Math.log(x);
    if (base === 0 || base === 1 || !Number.isFinite(base)) return NaN;
    return Math.log(x) / math.log(base);
};
const abs = math.abs;
const int = (x) => Math.trunc(Number(x));
const i64 = (x) => BigInt(Math.trunc(Number(x)));
const f64 = (x) => Number(x);

const time =(() => {
    const hasPerf = (typeof performance !== "undefined" && performance.now && performance.timeOrigin != null);
    const now = () => {
        const msEpoch = hasPerf ? (performance.timeOrigin + performance.now()) : Date.now();
        const nsec    = BigInt(Math.round(msEpoch * 1e6));
        return {_nsec: nsec, _ms: msEpoch};
    };
    const diff = (a, b) => (b._nsec - a._nsec);
    const to_unix_nanoseconds = (t) => t._nsec;
    const time_add = (t, deltaNs) => ({_nsec: t._nsec + deltaNs, _ms: Number(t._nsec + deltaNs) / 1e6});
    const duration_microseconds = (deltaNs) => Number(deltaNs / 1000n);
    return { now, diff, to_unix_nanoseconds, time_add, duration_microseconds};
})();

const fmt = {println: (...args) => console.log(...args)};

function Zeroth() {
    const alpha = time.now();

    const tick  = int(alpha._nsec) // Delta = tick
    const I     = 0.1 // Value = i
    const pie   = math.PI

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
    const a     = int(math.pow(f64(abs(tick)), f64(tick)))
    //--------------------------------------------\\
    // Focalor Point // abs(xy) < 1 :: creates parallax normal
    const b     = abs(a * tick) < 1
    //--------------------------------------------\\
    // Unit Circle // cos(xy) + isin(xy) :: unit circle/oval based on coordinates
    // This formula can be used for theta value
    const c     = (math.cos(f64(a * tick)) + (I * math.sin(f64(a * tick))))
    const theta = c * pie * f64(tick)
    const tau   = 2 * pie
    //--------------------------------------------\\
    // X-Axis // i(abs(2*pi*radius) * iabs(2*pi*radius))*time
    // Formula for the perfect angle of the x-axis, anything not on this line isnt an x-value
    const d     = I * (abs(theta) * I * (abs(theta))) * f64(tick)
    //--------------------------------------------------\\
    // Y-Axis // (abs(2*pi*radius) * iabs(2*pi*radius))*time
    // Formula for the perfect angle of the Y-axis, anything not on this line isnt an y-value 
    const e     = (abs(theta) * (I * (abs(theta)))) * f64(tick)
    //---------------------------------------------------\\
    // Z-Axis // (abs(2*pi*radius) + iabs(2*pi*radius))*time
    // Formula for the perfect angle of the Z-axis, anything not on this line isnt an z-value 
    const f     = (abs(theta) + I * (abs(theta))) * f64(tick)
    //----------------------------------------------------\\
    // W-Axis // (abs(2*pi*radius) - iabs(2*pi*radius))*time
    // Formula for the perfect angle of the x-axis, anything not on this line isnt an y-value 
    const g     = (abs(theta) - I * (abs(theta))) * f64(tick)
    //-----------------------------------------------------\\
    // Entropy // formula for a black hole
    const h     = math.pow((math.tan(tau)),(I * abs(tau))) * f64(tick)
    //------------------------------------------------------\\
    // Parrallax formula
    const i     = (abs(f64(tick)) - abs(tau)) >= 1
    //-------------------------------------------------------\\
    // Tesseract formula
    const j     = (abs(f64(tick) * pie) + abs(f64(tick) * pie)) >= 1
    //--------------------------------------------------------\\
    // Nbody Solution // cos(xy) + isin(xy) * t :: gives you a unit circle/oval based on coordinates
    // If applied to other things this is the heart of n-body solutions
    const k     = (math.cos(f64(a) * c) + (I * math.sin(f64(a) * c))) * f64(tick)
    //--------------------------------------------------------\\

    //---------------------------------------------------------\\
    const omega = time.now()
    const delta = time.diff(alpha, omega)
    fmt.println(delta.toString())
    //---------------------------------------------------------\\


    // These are meant to be Atomic, Tick , Delta and Step time
    const l     = time.to_unix_nanoseconds(omega)
    const w     = tick
    const x     = i64(delta)
    const y     = time.to_unix_nanoseconds(time.time_add(alpha, delta))
    //---------------------------------------------------------\\


    // Z is a rand time seed/ a rand seed generator. 
    const z = math.pow(time.duration_microseconds(delta), 3)
    //------------------------\\
    //---------------------------------------------------------\\


    // 4D Initialiazation
    function Fourdime() {
        const now = f64(time.now()._nsec)
        const fibprime = 2.971215073e9
        const max = fibprime * now //Randomized "4D" number
        for (let x = 0; x < max; x++) {
            for (let y = 0; y < max; y++) {
                const nx = x
                const ny = y
                return ((math.log(math.tan((nx * nx)), 0) == math.log(math.tan((nx /ny)), 0)) || 
                        (math.log(math.tan((nx * ny)), 0) == math.log(math.tan((nx /ny)), 0)) ||
                        (math.log(math.tan((ny * ny)), 0) == math.log(math.tan((nx /ny)), 0)) || 
                        (math.log(math.tan((nx * nx)), 0) != math.log(math.tan((nx /ny)), 0)) ||
                        (math.log(math.tan((nx * ny)), 0) != math.log(math.tan((nx /ny)), 0)) ||
                        (math.log(math.tan((ny * ny)), 0) != math.log(math.tan((nx /ny)), 0)))
            }
        }
        const time1 = (fibprime * now)
        const time2 = (fibprime / now)
        return (math.log(math.tan((time1 * time2)), 0) == math.log(math.tan((time1 / time2)), 0))
    }
    //---------------------------------------------------------\\
    //---------------------------------------------------------\\
    return {
        value: {
            a: b, b: a, c: c, d: d, 
            e: e, f: f, g: g, h: h, 
            i: i, j: j, k: k, l: l,
            w: w, x: x, y: y, z: z,
        },
        flag: Fourdime()
    }
}
//==========================================================\\

// Example:
const { value, flag } = Zeroth();
console.log(value, flag);
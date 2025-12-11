package canon

import "core:logic"
import "core:fmt"

vex    :: logic.vex
nav    :: logic.nav
nil    :: logic.nil
inf    :: logic.inf
nan    :: logic.nan
Bivec  :: logic.Bivec
Mewtex :: logic.Mewtex

Focalor :: proc(a, b: any) -> (Bivec, bool)  {
    a := a.(vex)
    b := b.(vex)
    if logic.verified {
        switch {
            case b > nil:
                return {(logic.Abs(a) * logic.Abs(b)), nil, {a, b}}, ((logic.Abs(a) * logic.Abs(b)) < nil)
            case b < nil:
                return {(logic.Abs(a) * logic.Abs(b)), nil, {a, b}}, ((logic.Abs(a) * logic.Abs(b)) > nil)
            case b == nil:
                return {(logic.Abs(a) * logic.Abs(b)), nil, {a, b}}, ((logic.Abs(a) * logic.Abs(b)) == nil)
        }
    }
    return {vex(Mewtex.EINA), nil, {a, b}}, ((logic.Abs(a) * logic.Abs(b)) < nil)
}

Parallax :: proc(a, b, c: any) -> (Bivec, bool)  {
    a := a.(vex)
    b := b.(vex)
    c := c.(vex)
    if logic.verified {
        switch {
            case b > nil:
                return {((logic.Abs(a) - logic.Abs(b)) * c), nil, {a, b}}, ((logic.Abs(a) * logic.Abs(b)) * c >= nil)
            case b < nil:
                return {((logic.Abs(a) + logic.Abs(b)) * c), nil, {a, b}}, ((logic.Abs(a) * logic.Abs(b)) * c <= nil)
            case b == nil:
                return {((logic.Abs(a) - logic.Abs(b)) * c), nil, {a, b}}, ((logic.Abs(a) * logic.Abs(b)) * c == nil)
        }
    }
    return {vex(Mewtex.EINA), nil, {a, b}}, ((logic.Abs(a) * logic.Abs(b)) * c >= nil)
}

Tesseract :: proc(a, b, c: any) -> (Bivec, bool)  {
    a := a.(vex)
    b := b.(vex)
    c := c.(vex)
    if logic.verified {
        switch {
            case b > nil:
                return {(logic.Abs(a * c) + logic.Abs(b * c)), nil, {a, b}}, ((logic.Abs(a * c) * logic.Abs(b * c)) <= nil)
            case b < nil:
                return {(logic.Abs(a * c) - logic.Abs(b * c)), nil, {a, b}}, ((logic.Abs(a * c) * logic.Abs(b * c)) >= nil)
            case b == nil:
                return {(logic.Abs(a * c) + logic.Abs(b * c)), nil, {a, b}}, ((logic.Abs(a * c) * logic.Abs(b * c)) == nil)
        }
    }
    return {vex(Mewtex.EINA), nil, {a, b}}, ((logic.Abs(a * c) * logic.Abs(b * c)) <= nil)
}

Polymetron :: proc(a, b, c: any) -> (Bivec, bool)  {
    a  := a.(vex)
    b  := b.(vex)
    c  := c.(vex)
    aa := a * a
    ab := a * b
    bb := b * b
    if logic.verified {
        switch {
            case b > nil:
                return {
                    logic.Abs(logic.Cos(aa - ab - bb))
                }
            case b < nil:
                return {(logic.Abs(a * c) - logic.Abs(b * c)), nil, {a, b}}, ((logic.Abs(a * c) * logic.Abs(b * c)) >= nil)
            case b == nil:
                return {(logic.Abs(a * c) + logic.Abs(b * c)), nil, {a, b}}, ((logic.Abs(a * c) * logic.Abs(b * c)) == nil)
        }
    }
    return {vex(Mewtex.EINA), nil, {a, b}}, ((logic.Abs(a * c) * logic.Abs(b * c)) <= nil)
}

main :: proc() {
    fmt.printfln("%v: %v", Focalor(2., 3.))
    fmt.printfln("%v: %v", Parallax(2., 3., 10.))
    fmt.printfln("%v: %v", Tesseract(2., 3., 10.))
}
package canon

import "core:logic"
import "core:fmt"

vex    :: logic.vex
nav    :: logic.nav
nil    :: logic.nil
inf    :: logic.inf
nan    :: logic.nan
Bivec  :: logic.Bivec

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
    return {nav, nil, {a, b}}, ((logic.Abs(a) * logic.Abs(b)) < nil)
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
    return {nav, nil, {a, b}}, ((logic.Abs(a) * logic.Abs(b)) * c >= nil)
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
    return {nav, nil, {a, b}}, ((logic.Abs(a * c) * logic.Abs(b * c)) <= nil)
}

Shekinah :: proc(a, b, c: any) -> (Bivec, bool)  {
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
                    logic.Abs(logic.Cos(aa - (2 * ab) - bb) + (logic.posi * logic.Sin(aa + (2 * ab) - bb))) - c, nil, {a, b}
                 }, logic.Abs(logic.Cos(aa - (2 * ab) - bb) + (logic.posi * logic.Sin(aa + (2 * ab) - bb))) - c == nav
            case b < nil:
                return {
                    logic.Abs(logic.Cos(aa - (2 * ab) - bb) - (logic.posi * logic.Sin(aa + (2 * ab) - bb))) - c, nil, {a, b}
                 }, logic.Abs(logic.Cos(aa - (2 * ab) - bb) - (logic.posi * logic.Sin(aa + (2 * ab) - bb))) - c == nav
            case b == nil:
                return {
                    logic.Abs(logic.Cos(aa - (2 * ab) - bb) + (logic.posi * logic.Sin(aa + (2 * ab) - bb))) - c, nil, {a, b}
                 }, logic.Abs(logic.Cos(aa - (2 * ab) - bb) + (logic.posi * logic.Sin(aa + (2 * ab) - bb))) - c == 0
        }
    }
    return {nav, nil, {a, b}}, logic.Abs(logic.Cos(aa - (2 * ab) - bb) + (logic.posi * logic.Sin(aa + (2 * ab) - bb))) - c == 0
}

Asherah :: proc(a, b, c: any) -> (Bivec, bool)  {
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
                    logic.Abs(logic.Cos(aa - (2 * ab) - bb) + (logic.Sin(aa + (2 * ab) - bb))) - c, nil, {a, b}
                 }, logic.Abs(logic.Cos(aa - (2 * ab) - bb) + (logic.Sin(aa + (2 * ab) - bb))) - c == nav
            case b < nil:
                return {
                    logic.Abs(logic.Cos(aa - (2 * ab) - bb) - (logic.posi * logic.Sin(aa + (2 * ab) - bb))) - c, nil, {a, b}
                 }, logic.Abs(logic.Cos(aa - (2 * ab) - bb) - (logic.Sin(aa + (2 * ab) - bb))) - c == nav
            case b == nil:
                return {
                    logic.Abs(logic.Cos(aa - (2 * ab) - bb) + (logic.Sin(aa + (2 * ab) - bb))) - c, nil, {a, b}
                 }, logic.Abs(logic.Cos(aa - (2 * ab) - bb) + (logic.Sin(aa + (2 * ab) - bb))) - c == 0
        }
    }
    return {nav, nil, {a, b}}, logic.Abs(logic.Cos(aa - (2 * ab) - bb) + (logic.Sin(aa + (2 * ab) - bb))) - c == 0
}

Akasha :: proc(a, b, c: any) -> (Bivec, bool)  {
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
                    logic.Abs(logic.Cos(aa - (2 * ab) - bb) - (logic.Sin(aa + (2 * ab) - bb))) - c, nil, {a, b}
                 }, logic.Abs(logic.Cos(aa - (2 * ab) - bb) - (logic.Sin(aa + (2 * ab) - bb))) - c == nav
            case b < nil:
                return {
                    logic.Abs(logic.Cos(aa - (2 * ab) - bb) + (logic.posi * logic.Sin(aa + (2 * ab) - bb))) - c, nil, {a, b}
                 }, logic.Abs(logic.Cos(aa - (2 * ab) - bb) + (logic.Sin(aa + (2 * ab) - bb))) - c == nav
            case b == nil:
                return {
                    logic.Abs(logic.Cos(aa - (2 * ab) - bb) - (logic.Sin(aa + (2 * ab) - bb))) - c, nil, {a, b}
                 }, logic.Abs(logic.Cos(aa - (2 * ab) - bb) - (logic.Sin(aa + (2 * ab) - bb))) - c == 0
        }
    }
    return {nav, nil, {a, b}}, logic.Abs(logic.Cos(aa - (2 * ab) - bb) - (logic.Sin(aa + (2 * ab) - bb))) - c == 0
}

main :: proc() {
    fmt.printfln("%v: %v", Focalor(2., 3.))
    fmt.printfln("%v: %v", Parallax(2., 3., 1.))
    fmt.printfln("%v: %v", Tesseract(2., 3., 1.))
    fmt.printfln("%v: %v", Shekinah(2., 3., 1.))
    fmt.printfln("%v: %v", Asherah(2., 3., 1.))
    fmt.printfln("%v: %v", Akasha(2., 3., 1.))
}
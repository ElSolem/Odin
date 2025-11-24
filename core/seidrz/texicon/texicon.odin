package texicon

import "core:seidrz/lexicon"

_: lexicon.BigHEADz

import "core:time"
import "core:fmt"


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
        fmt.printfln("%02x === %v : %v", k, int(v), rune(v))
    }
}

//null and void *my new "any" type
// it returns a nav
// It can be optimized :)
Any :: proc(x: any) -> (struct {
    w: int, 
    x: int, 
    y: typeid}) {
    return struct {
        w: int, 
        x: int, 
        y: typeid}{
            w = fmt.println(x), 
            x = size_of(x), 
            y = typeid_of(type_of(x)), 
        }
}

main :: proc() {
    /*
    t1 := time.now()

    //print_keyz()
    print_scancode()
    fmt.printfln("%v", rune(-0x6f))
    HelloWorld()
    fmt.println()
    t2 := time.now()
    dift := time.diff(t1, t2)
    fmt.printfln("%v", dift)
    */
    return
}


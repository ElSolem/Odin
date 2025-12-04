package tex

import "core:seidrz/lex"

_: lex.BigHEADz

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
    RIND = 0x18, // Quant Intz No Data
    RISD = 0x19, // Quant Intz Single Data
    RIMD = 0x1a, // Quant Intz Multi Data
    RIPD = 0x1b, // Quant Intz Proc Data
    // Group 8
    TIND = 0x1c, // Timed Intz No Data
    TISD = 0x1d, // Timed Intz Single Data
    TIMD = 0x1e, // Timed Intz Multi Data
    TIPD = 0x1f, // Timed Intz Proc Data
    // Group 9
    EIND = 0xec, // Error Intz No Data
    EISD = 0xed, // Error Intz Single Data
    EIMD = 0xee, // Error Intz Multi Data
    EIPD = 0xef, // Error Intz Proc Data
}


print_keyz :: proc() {
    for i in Keyvex {
        fmt.printfln("%v", 
        Keyvex(i)) // enum{x} -> access nums
        fmt.printfln("This key is :%v bits", size_of(i))
    }
    fmt.printfln("keyz are the size of :%v bits", size_of(Keyvex))
}

//null and void *my new "any" type
// it returns a nav
// It can be optimized :)
Any     :: proc(x: any) -> (struct {
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
            z = Keyvex.NIND
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


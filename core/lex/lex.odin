package lexicon

import "core:fmt"
import "base:runtime"
import "core:time"
import "vendor:sdl2"
import sdl2image "vendor:sdl2/image"
import "core:logic"


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
    for i in scancode.start..=scancode.endof {
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

// Windowing and SDL2 Example Elements
// *For copying and pasting

WIND_WIDE :: 264 
WIND_HIGH :: 604
TILE_SIZE :: 36 // int(logic.ABRAXAS)
MAP_WIDE :: 3456 / TILE_SIZE
MAP_HIGH :: 1944 / TILE_SIZE
verified  := logic.verified
event     : sdl2.Event

WINDOW := sdl2.CreateWindow("PokéSeiðr", 
    sdl2.WINDOWPOS_CENTERED, sdl2.WINDOWPOS_CENTERED, 
    WIND_WIDE, WIND_HIGH, sdl2.WINDOW_SHOWN)

// Procedural Types and Functions
TileTags :: enum {
    CENTER, C_RIGHT, C_LEFT, 
    TOP, T_RIGHT, T_LEFT, 
    BOTTOM, B_RIGHT, B_LEFT 
}

TileFlags :: [TileTags][2]int {
    .CENTER  = {0, 0},  .C_RIGHT = {1, 0},  .C_LEFT  = {-1, 0},
    .TOP     = {0, 1},  .T_RIGHT = {1, 1},  .T_LEFT  = {-1, 1},
    .BOTTOM  = {0, -1}, .B_RIGHT = {1, -1}, .B_LEFT  = {-1, -1}
}

MakeSurfaces :: proc(files: []runtime.Load_Directory_File) -> ([]^sdl2.Surface) {
    surfaces := make([]^sdl2.Surface, len(files))

    for file, index in files {
        data := file.data
        if len(data) == 0 {
            surfaces[index] = nil
            continue
        }

        ptr := &data[0]
        rw := sdl2.RWFromConstMem(cast(rawptr) ptr, i32(len(data)))
        if rw == nil {
            surfaces[index] = nil
            continue
        }

        surface := sdl2image.Load_RW(rw, true)
        surfaces[index] = surface
    }

    return surfaces
}

TileSurface :: struct {
    name    : string,
    surface : ^sdl2.Surface
}

MakeNamedSurfaces :: proc(files: []runtime.Load_Directory_File) -> ([]TileSurface) {
    result := make([]TileSurface, len(files))

    for file, index in files {
        data := file.data
        surface_ptr : ^sdl2.Surface

        if len(data) > 0 {
            ptr := &data[0]
            rw := sdl2.RWFromConstMem(cast(rawptr) ptr, i32(len(data)))
            if rw != nil {
                surface_ptr = sdl2image.Load_RW(rw, true)
            }
        }

        result[index] = TileSurface{
            name = file.name,
            surface = surface_ptr,
        }
    }
    return result
}

main :: proc() {
    t1 := time.now()
    print_scancode()
    fmt.printfln("%v", rune(-0x6f))
    HelloWorld()
    fmt.println()
    t2 := time.now()
    dift := time.diff(t1, t2)
    fmt.printfln("%v", dift)
    return
}


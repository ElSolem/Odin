#!/usr/bin/env
package vision

import "core:fmt"
import "core:math"
import "core:time"
import "core:log"


// Key id colors
Keyhex :: enum {
    // Group 1: Native Colors
    UMBRA  = 0xf0f0f0, // "#f0f0f0"
    EMBER  = 0xe1e1e1, // "#e1e1e1"
    VOLTZ  = 0xd2d2d2, // "#d2d2d2"
    FLAME  = 0xc3c3c3, // "#c3c3c3"
    // Group 2: Qubit Colors
    AEROW  = 0xb4b4b4, // "#b4b4b4"
    WATER  = 0xa5a5a5, // "#a5a5a5"
    FROST  = 0x969696, // "#969696"
    STONE  = 0x878787, // "#878787"
    // Group 3: Knocker Colors
    METAL  = 0x787878, // "#787878"
    TOXIN  = 0x696969, // "#696969"
    SPORE  = 0x5a5a5a, // "#5a5a5a"
    FLORA  = 0x4b4b4b, // "#4b4b4b"
    // Group 4: Pilgrimm Colors
    FAUNA  = 0x3c3c3c, // "#3c3c3c"
    MUSIC  = 0x2d2d2d, // "#2d2d2d"
    MAGIC  = 0x1e1e1e, // "#1e1e1e"
    UNOWN  = 0x0f0f0f, // "#0f0f0f"

    // Group 5: Munchkin Colors
    MSTRE  = 0xf1f1f1, // "#f1f1f1"
    HSTRE  = 0xe2e2e2, // "#e2e2e2"
    SILEN  = 0xd3d3d3, // "#d3d3d3"
    FORCE  = 0xc4c4c4, // "#c4c4c4"
    // Group 6: Gillikin Colors
    BLESS  = 0xb5b5b5, // "#b5b5b5"
    CURSE  = 0xa6a6a6, // "#a6a6a6"
    QEMET  = 0x979797, // "#979797"
    SMITH  = 0x888888, // "#888888"
    // Group 7: Quadling Colors
    BRICK  = 0x797979, // "#797979"
    BLOCK  = 0x6a6a6a, // "#6a6a6a"
    OCEAN  = 0x5b5b5b, // "#5b5b5b"
    KNOCK  = 0x4c4c4c, // "#4c4c4c"
    // Group 8: Winkiez Colors
    BURNA  = 0x3d3d3d, // "#3d3d3d"
    SHOCK  = 0x2e2e2e, // "#2e2e2e"
    LIGHT  = 0x1f1f1f, // "#1f1f1f"
    CLOCK  = 0x000000, // "#000000"
}

Typehex :: enum {
    // Group 1: Plexcity Colors
    Noirz  = 0x111111, // "#111111"
    Vampz  = 0xf0000f, // "#f0000f"
    Glamz  = 0x0ff000, // "#0ff000"
    Kindz  = 0x000ff0, // "#000ff0"
    // Group 2: Endian Colors
    Vectz  = 0xf0f000, // "#f0f000"
    Hectz  = 0x00f0f0, // "#00f0f0"
    Linkz  = 0xf000f0, // "#f000f0"
    Tinkz  = 0xffffff, // "#ffffff"
    // Group 4: Gamebo Colors
    Catz   = 0xf0110f, // "#f0110f"
    Dogz   = 0x11f00f, // "#11f00f"
    Batz   = 0x110ff0, // "#110ff0"
    Ratz   = 0xf00ff0, // "#f00ff0"
}

// Valhex is Zedex I wont be making one beyond that
Zedex :: enum {
    // === Blacks, Grays, and Near-Blacks (Neutral) ===
    // Group 1
    _ = 0x000000, // "#000000"
    _ = 0x080607, // "#080607"
    _ = 0x0d082a, // "#0d082a"
    _ = 0x0f2e2f, // "#0f2e2f"
    // Group 2
    _ = 0x2b0a09, // "#2b0a09"
    _ = 0x302a0c, // "#302a0c"
    _ = 0x302c2d, // "#302c2d"
    _ = 0x1f1e1e, // "#1f1e1e"
    // Group 3
    _ = 0x32423b, // "#32423b"
    _ = 0x2b3c43, // "#2b3c43"
    _ = 0x545151, // "#545151"
    _ = 0x505a62, // "#505a62"
    // Group 4
    _ = 0x534c4d, // "#534c4d"
    _ = 0x787b86, // "#787b86"
    _ = 0x707070, // "#707070"
    _ = 0x888585, // "#888585"
    // Group 5
    _ = 0xa59b9c, // "#a59b9c"
    _ = 0xb4c7b3, // "#b4c7b3"
    _ = 0xece6e5, // "#ece6e5"
    _ = 0xff0800, // "#ff0800"

    // === Reds and Deep Pinks/Magentas ===
    // Group 6
    _ = 0xe82809, // "#e82809"
    _ = 0xcd2f09, // "#cd2f09"
    _ = 0xe22f2d, // "#e22f2d"
    _ = 0xd93422, // "#d93422"
    // Group 7
    _ = 0xde3163, // "#de3163"
    _ = 0xe34234, // "#e34234"
    _ = 0xd24e41, // "#d24e41"
    _ = 0xd10047, // "#d10047"
    // Group 8
    _ = 0xf10405, // "#f10405"
    _ = 0xcf0506, // "#cf0506"
    _ = 0xae0405, // "#ae0405"
    _ = 0x900405, // "#900405"
    // Group 9
    _ = 0x710305, // "#710305"
    _ = 0x4f0304, // "#4f0304"
    _ = 0xb22222, // "#b22222"
    _ = 0x671f20, // "#671f20"

    // === Brown-Reds and Earth Tones ===
    // Group 10
    _ = 0x6b3431, // "#6b3431"
    _ = 0x463534, // "#463534"
    _ = 0xae5446, // "#ae5446"
    _ = 0x8d493c, // "#8d493c"
    // Group 11
    _ = 0x685450, // "#685450"
    _ = 0x763b63, // "#763b63"
    _ = 0x814e5f, // "#814e5f"
    _ = 0x985484, // "#985484"
    // Group 12
    _ = 0x745468, // "#745468"
    _ = 0x967187, // "#967187"
    _ = 0x8a6d72, // "#8a6d72"
    _ = 0xcea79f, // "#cea79f"

    // === Oranges and Orange-Reds ===
    // Group 13
    _ = 0xb83025, // "#b83025"
    _ = 0x973629, // "#973629"
    _ = 0xcf4f34, // "#cf4f34"
    _ = 0xe55034, // "#e55034"
    // Group 14
    _ = 0xeb6957, // "#eb6957"
    _ = 0xed7d64, // "#ed7d64"
    _ = 0xd77057, // "#d77057"
    _ = 0xc97966, // "#c97966"
    // Group 15
    _ = 0xeb9272, // "#eb9272"
    _ = 0xec5312, // "#ec5312"
    _ = 0xa6380b, // "#a6380b"
    _ = 0x88340d, // "#88340d"
    // Group 16
    _ = 0xd24d0b, // "#d24d0b"
    _ = 0xe8630f, // "#e8630f"
    _ = 0xf67521, // "#f67521"
    _ = 0xd1702b, // "#d1702b"
    // Group 17
    _ = 0xaf530f, // "#af530f"
    _ = 0x6b3509, // "#6b3509"
    _ = 0xd16b0f, // "#d16b0f"
    _ = 0xb7410e, // "#b7410e"

    // === Yellows and Browns (Orange-Yellows) ===
    // Group 18
    _ = 0xa0532f, // "#a0532f"
    _ = 0xa77157, // "#a77157"
    _ = 0xa77c64, // "#a77c64"
    _ = 0xc49976, // "#c49976"
    // Group 19
    _ = 0x654f3c, // "#654f3c"
    _ = 0xecaf79, // "#ecaf79"
    _ = 0x8b7258, // "#8b7258"
    _ = 0xcba47b, // "#cba47b"
    // Group 20
    _ = 0xac9170, // "#ac9170"
    _ = 0x524837, // "#524837"
    _ = 0x756852, // "#756852"
    _ = 0x96876c, // "#96876c"
    // Group 21
    _ = 0xb5a37c, // "#b5a37c"
    _ = 0xe8d5a9, // "#e8d5a9"
    _ = 0x97875d, // "#97875d"
    _ = 0xbe7420, // "#be7420"

    // === Bright Yellows and Yellow-Greens ===
    // Group 22
    _ = 0xf59529, // "#f59529"
    _ = 0x89570f, // "#89570f"
    _ = 0xf3981a, // "#f3981a"
    _ = 0xd2932a, // "#d2932a"
    // Group 23
    _ = 0xb68423, // "#b68423"
    _ = 0xf1af25, // "#f1af25"
    _ = 0x4a3606, // "#4a3606"
    _ = 0xa57a0b, // "#a57a0b"
    // Group 24
    _ = 0x8f7226, // "#8f7226"
    _ = 0x6d5409, // "#6d5409"
    _ = 0x917009, // "#917009"
    _ = 0xc8980a, // "#c8980a"
    // Group 25
    _ = 0xebb60d, // "#ebb60d"
    _ = 0xb28c09, // "#b28c09"
    _ = 0xd1aa0c, // "#d1aa0c"
    _ = 0xf9ce26, // "#f9ce26"
    // Group 26
    _ = 0xcdae25, // "#cdae25"
    _ = 0xf6d00c, // "#f6d00c"
    _ = 0x534d08, // "#534d08"
    _ = 0x706e0a, // "#706e0a"
    // Group 27
    _ = 0xf7f40c, // "#f7f40c"
    _ = 0xf0ec23, // "#f0ec23"
    _ = 0x90910b, // "#90910b"
    _ = 0xb0b00c, // "#b0b00c"
    // Group 28
    _ = 0xcfcf0f, // "#cfcf0f"
    _ = 0x6a6a24, // "#6a6a24"
    _ = 0xd0cf25, // "#d0cf25"
    _ = 0xb6b626, // "#b6b626"
    // Group 29
    _ = 0x8e8f30, // "#8e8f30"
    _ = 0x9ba30b, // "#9ba30b"
    _ = 0xb9c60c, // "#b9c60c"
    _ = 0xd7ed11, // "#d7ed11"

    // === Greens ===
    // Group 30
    _ = 0x596308, // "#596308"
    _ = 0x788809, // "#788809"
    _ = 0x7e8d23, // "#7e8d23"
    _ = 0x3a4507, // "#3a4507"
    // Group 31
    _ = 0xd1f625, // "#d1f625"
    _ = 0xadcf2a, // "#adcf2a"
    _ = 0x88a42b, // "#88a42b"
    _ = 0xb4fd0c, // "#b4fd0c"
    // Group 32
    _ = 0x95c52e, // "#95c52e"
    _ = 0xaaec28, // "#aaec28"
    _ = 0x92d21a, // "#92d21a"
    _ = 0x73ae0e, // "#73ae0e"
    // Group 33
    _ = 0x8fee13, // "#8fee13"
    _ = 0x50930f, // "#50930f"
    _ = 0x88ef22, // "#88ef22"
    _ = 0x6ecc14, // "#6ecc14"
    // Group 34
    _ = 0x6eea08, // "#6eea08"
    _ = 0x53b20c, // "#53b20c"
    _ = 0x6ec332, // "#6ec332"
    _ = 0x53c20b, // "#53c20b"
    // Group 35
    _ = 0x338c00, // "#338c00"
    _ = 0x5feb0e, // "#5feb0e"
    _ = 0x297106, // "#297106"
    _ = 0x33d301, // "#33d301"
    // Group 36
    _ = 0x2bb405, // "#2bb405"
    _ = 0x31ea0a, // "#31ea0a"
    _ = 0x065106, // "#065106"
    _ = 0x068f06, // "#068f06"
    // Group 37
    _ = 0x06af06, // "#06af06"
    _ = 0x08ce08, // "#08ce08"
    _ = 0x07ed08, // "#07ed08"
    _ = 0x056f06, // "#056f06"

    // === Cyan and Aqua (Blue-Greens) ===
    // Group 38
    _ = 0x052f07, // "#052f07"
    _ = 0x09f02c, // "#09f02c"
    _ = 0x07cf31, // "#07cf31"
    _ = 0x05ae32, // "#05ae32"
    // Group 39
    _ = 0x028f2e, // "#028f2e"
    _ = 0x09f053, // "#09f053"
    _ = 0x27ab58, // "#27ab58"
    _ = 0x01ca4e, // "#01ca4e"
    // Group 40
    _ = 0x057030, // "#057030"
    _ = 0x04b04b, // "#04b04b"
    _ = 0x08f06d, // "#08f06d"
    _ = 0x506258, // "#506258"
    // Group 41
    _ = 0x079250, // "#079250"
    _ = 0x09cb71, // "#09cb71"
    _ = 0x708179, // "#708179"
    _ = 0x08a96b, // "#08a96b"
    // Group 42
    _ = 0x064835, // "#064835"
    _ = 0x09d4a9, // "#09d4a9"
    _ = 0x076956, // "#076956"
    _ = 0x2e655e, // "#2e655e"
    // Group 43
    _ = 0x74c3b8, // "#74c3b8"
    _ = 0x058979, // "#058979"
    _ = 0x4f837d, // "#4f837d"
    _ = 0x09504f, // "#09504f"
    // Group 44
    _ = 0x079fa0, // "#079fa0"
    _ = 0x0adede, // "#0adede"
    _ = 0x087071, // "#087071"
    _ = 0x396b6e, // "#396b6e"
    // Group 45
    _ = 0x93eff4, // "#93eff4"
    _ = 0x2e4f52, // "#2e4f52"
    _ = 0x457276, // "#457276"
    _ = 0x579aa2, // "#579aa2"
    // === Blues ===
    // Group 46
    _ = 0x73d1db, // "#73d1db"
    _ = 0x085c67, // "#085c67"
    _ = 0x0c7886, // "#0c7886"
    _ = 0x335c62, // "#335c62"
    // Group 47
    _ = 0x497c84, // "#497c84"
    _ = 0x68b9c5, // "#68b9c5"
    _ = 0x397b87, // "#397b87"
    _ = 0x11b2d4, // "#11b2d4"
    // Group 48
    _ = 0x0c3846, // "#0c3846"
    _ = 0x1368ae, // "#1368ae"
    _ = 0x266caa, // "#266caa"
    _ = 0x0b6ecd, // "#0b6ecd"
    // Group 49
    _ = 0x154e91, // "#154e91"
    _ = 0x1478eb, // "#1478eb"
    _ = 0x07316b, // "#07316b"
    _ = 0x074bb8, // "#074bb8"
    // Group 50
    _ = 0x213b6f, // "#213b6f"
    _ = 0x0750f0, // "#0750f0"
    _ = 0x0b328e, // "#0b328e"
    _ = 0x0d46ce, // "#0d46ce"
    // Group 51
    _ = 0x0a2faa, // "#0a2faa"
    _ = 0x0633cd, // "#0633cd"
    _ = 0x0838fc, // "#0838fc"
    _ = 0x03036f, // "#03036f"
    // Group 52
    _ = 0x030290, // "#030290"
    _ = 0x0302ae, // "#0302ae"
    _ = 0xa4a4cb, // "#a4a4cb"
    _ = 0x0302d0, // "#0302d0"
    // === Indigos, Violets and Magentas ===
    // Group 53
    _ = 0x0202f3, // "#0202f3"
    _ = 0x04024e, // "#04024e"
    _ = 0x2c037b, // "#2c037b"
    _ = 0x37068d, // "#37068d"
    // Group 54
    _ = 0x3f08a1, // "#3f08a1"
    _ = 0x4707b0, // "#4707b0"
    _ = 0x5105cd, // "#5105cd"
    _ = 0x5d06e0, // "#5d06e0"
    // Group 55
    _ = 0x6a05ee, // "#6a05ee"
    _ = 0x6402d9, // "#6402d9"
    _ = 0x590686, // "#590686"
    _ = 0x9d02e2, // "#9d02e2"
    // Group 56
    _ = 0x37044a, // "#37044a"
    _ = 0x7b03a8, // "#7b03a8"
    _ = 0x9804c8, // "#9804c8"
    _ = 0x55046d, // "#55046d"
    // Group 57
    _ = 0xb403e8, // "#b403e8"
    _ = 0x710390, // "#710390"
    _ = 0x8e03b0, // "#8e03b0"
    _ = 0xac03cf, // "#ac03cf"
    // Group 58
    _ = 0xd004ed, // "#d004ed"
    _ = 0x4d0451, // "#4d0451"
    _ = 0xe23ee8, // "#e23ee8"
    _ = 0x6e0470, // "#6e0470"
    // Group 59
    _ = 0xcd04cf, // "#cd04cf"
    _ = 0xee04f0, // "#ee04f0"
    _ = 0x2d0b2d, // "#2d0b2d"
    _ = 0x8f0490, // "#8f0490"
    // Group 60
    _ = 0xae04af, // "#ae04af"
    _ = 0xc404bc, // "#c404bc"
    _ = 0xe203db, // "#e203db"
    _ = 0xa4059b, // "#a4059b"
    // Group 61
    _ = 0xb73ab1, // "#b73ab1"
    _ = 0x83087a, // "#83087a"
    _ = 0x8f3388, // "#8f3388"
    _ = 0xa5369c, // "#a5369c"
    // Group 62
    _ = 0x65035c, // "#65035c"
    _ = 0xb453ab, // "#b453ab"
    _ = 0xca32b5, // "#ca32b5"
    _ = 0x460e39, // "#460e39"
    // Group 63
    _ = 0xc857ad, // "#c857ad"
    _ = 0xee9fdb, // "#ee9fdb"
    _ = 0xb869a4, // "#b869a4"
    _ = 0xea78cb, // "#ea78cb"
    // Group 64
    _ = 0x88386d, // "#88386d"
    _ = 0xcf6daf, // "#cf6daf"
    _ = 0x503647, // "#503647"
    _ = 0x693657, // "#693657"
    // Group 65
    _ = 0xad588f, // "#ad588f"
    _ = 0xe373bb, // "#e373bb"
    _ = 0x8b4e74, // "#8b4e74"
    _ = 0xc45c9c, // "#c45c9c"
    // Group 66
    _ = 0xc2649e, // "#c2649e"
    _ = 0xab7395, // "#ab7395"
    _ = 0xa5497f, // "#a5497f"
    _ = 0xffffff, // "#ffffff"
}

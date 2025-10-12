#!/usr/bin/env odin
package vision

import "core:fmt"
import "core:math"
import "core:time"
import "core:log"


// Environmentals
Purehex  :: enum {
    // Group 1: Celestia
    Dark    = 0x080607, // "#080607"
    Light   = 0x6b3431, // "#6b3431"
    Thunder = 0x8d493c, // "#8d493c"
    Fire    = 0xb83025, // "#b83025"
    // Group 2: Terestria
    Air     = 0xeb6957, // "#eb6957"
    Water   = 0xec5312, // "#ec5312"
    Ice     = 0xd16b0f, // "#d16b0f"
    Rock    = 0xc49976, // "#c49976"
    // Group 3: Necromia
    Metal   = 0xebb60d, // "#ebb60d"
    Poison  = 0x534d08, // "#534d08"
    Fungi   = 0x706e0a, // "#706e0a"
    Plant   = 0x50930f, // "#50930f"
    // Group 4: Hexomnia
    Beast   = 0x08a96b, // "#08a96b"
    Sound   = 0x07316b, // "#07316b"
    Sight   = 0x590686, // "#590686"
    Anima   = 0xea78cb, // "#ea78cb"
}

// Elemental/Spiritual
Typehex :: enum {
    // Group 1: Native Colors
    Umbra,
    Ember,
    Voltz,  
    Flame,  
    // Group 2: Qubit Colors
    Aerow,  
    Hydro,
    Frost,  
    Stone,  
    // Group 3: Knocker Colors
    Metal,  
    Toxin,  
    Spore,  
    Flora,  
    // Group 4: Pilgrimm Colors
    Fauna,  
    Music,  
    Magic,  
    Unown,
}

// Socioeconomic
Pathhex :: enum {
    // Group 1: Munchkin Colors
    Mstre  = 0xf1f1f1, // "#f1f1f1"
    Hstre  = 0xe2e2e2, // "#e2e2e2"
    Siren  = 0xd3d3d3, // "#d3d3d3"
    Force  = 0xc4c4c4, // "#c4c4c4"
    // Group 2: Gillikin Colors
    Bless  = 0xb5b5b5, // "#b5b5b5"
    Curse  = 0xa6a6a6, // "#a6a6a6"
    Qemet  = 0x979797, // "#979797"
    Smith  = 0x888888, // "#888888"
    // Group 3: Quadling Colors
    Brick  = 0x797979, // "#797979"
    Block  = 0x6a6a6a, // "#6a6a6a"
    Curez  = 0x5b5b5b, // "#5b5b5b"
    Knock  = 0x4c4c4c, // "#4c4c4c"
    // Group 4: Winkiez Colors
    Burna  = 0x3d3d3d, // "#3d3d3d"
    Shock  = 0x2e2e2e, // "#2e2e2e"
    Litez  = 0x1f1f1f, // "#1f1f1f"
    Clock  = 0x000000, // "#000000"
}

// Psychobiology/Chemistry
Kindhex :: enum {
    // Group 1: Plexci Colors
    Noirelz = 0x111111, // "#111111" // angel
    Vampyre = 0xf0000f, // "#f0000f" // demon
    Frankez = 0x0ff000, // "#0ff000" // cherub
    Kinderz = 0x000ff0, // "#000ff0" // djinn
    // Group 2: Endian Colors
    Beezoid = 0xf0f000, // "#f0f000" // beez
    Hectone = 0x00f0f0, // "#00f0f0" // giantz
    Jotantz = 0xf000f0, // "#f000f0" // antz
    Golemon = 0xffffff, // "#ffffff" // ghost
    // Group 3: Gamebo Colors
    Mekanik = 0x999999, // "#999999" // machines
    Vesperz = 0x900009, // "#900009" // poison
    Khimera = 0x099000, // "#099000" // chimeras/spore
    Nymphir = 0x000990, // "#000990" // plant types
    // Group 4: Wunder Colors
    Lagomos = 0xf00ff0, // "#aa0ff0" // rabbit/ogres
    Dracait = 0xf0110f, // "#aaf00f" // cat/dragons
    Devadog = 0x11f00f, // "#f0aa0f" // Talkin dogs/fairy
    Helbatz = 0x110ff0, // "#faaffa" // Whatever bats are
}

// Sociogeographic
Folkhex :: enum {
    // Simple Tribez
    Plexcity,
    Intinity,
    Piruvian,
    Criptick,
    // Wander Tribez
    Whisperz,
    Hectarez,
    Nephilim,
    Knockerz,
    // Indian Tribez
    Alendian, // Forest
    Elandian, // Mountain
    Onundian, // Desert
    Unondian, // Ocean
    // Wunder Tribez
    Etherian,
    Sophonix,
    Hexatrix,
    Atemsetz, 
}

// Player Action/skills
Arthex  :: enum {
    // Group 1
    hack = 0x000000, // "#aaa000"
    code = 0x080607, // "#a4a607"
    data = 0x0d082a, // "#a7a82a"
    navi = 0x0f2e2f, // "#a8ae2f"
    // Group 2
    link = 0x2b0a09, // "#129a09"
    wave = 0x302a0c, // "#159a0c"
    trip = 0x302c2d, // "#159c2d"
    save = 0x1f1e1e, // "#089e1e"
    // Group 3
    rust = 0x32423b, // "#15923b"
    sick = 0x2b3c43, // "#169c43"
    grow = 0x545151, // "#272151"
    risk = 0x505a62, // "#252a62"
    // Group 4
    join = 0x534c4d, // "#272c4d"
    call = 0x787b86, // "#393b86"
    emit = 0x707070, // "#353070"
    fall = 0x888585, // "#444585"
}

// Monster/NPC Actions
Acthex :: enum {
    // Group 1: Kindling
    kind = 0xfed000, // "#fed000" // humble
    piru = 0xfe0c00, // "#fe0c00" // aggressive
    crip = 0x01d0b0, // "#01d0b0" // sneak around
    folk = 0x002c0a, // "#002c0a" // group up
    // Group 2: Piruvian
    comb = 0x0912b0, // "#0912b0" // search/find
    hive = 0x02804a, // "#02804a" // gather
    crib = 0x33a795, // "#33a795" // put down
    nest = 0x043860, // "#043860" // store
    // Group 3: Criptick
    rest = 0x007890, // "#007890" // rest/stop lol
    raid = 0x06800a, // "#06800a" // attack/rush
    rave = 0x5900b0, // "#5900b0" // distract/dance
    reel = 0xa40c00, // "#a40c00" // fish
    // Group 4: Folklore
    room = 0x1c7000, // "#1c7000" // create space
    tomb = 0x0fc200, // "#0fc200" // bury
    boom = 0x00ed10, // "#00ed10" // destroy
    loom = 0x000def, // "#000def" // loiter, stay command
}

// Object types/states
Objhex  :: enum {
    blud,
    lamp,
    cord,
    herb,

    node,
    ring,
    cube,
    ball,

    bitz,
    stem,
    germ,
    root,

    seed,
    song,
    rite,
    crud,
}


// Object Modifiers, Keyverbs/Adjectives
// Ex: vespid jar would be full of venom, apidae jar full of honey
Keyhex  :: enum{
    angelo,
    daemon,
    cherub,
    adjinn,

    apidae,
    nephil,
    formic,
    dokabi,

    vulkan,
    vespid,
    ganger,
    nymphi,

    orckid,
    feline,
    canine,
    helbat,
}

OOParts :: enum {
    Hexwatch = 0xf0f0f0, // "#f0f0f0", // smartwatch, duel disk
    Carddeck = 0xe1e1e1, // "#e1e1e1", // deck of cards
    Bangstic = 0xd2d2d2, // "#d2d2d2", // capsule gun
    Aerodisk = 0xc3c3c3, // "#c3c3c3", // frisbee/tron disk

    Boomrang = 0xb4b4b4, // "#b4b4b4", // boomerang
    Boogbord = 0xa5a5a5, // "#a5a5a5", // surfboard-skateboard
    Majikrug = 0x969696, // "#969696", // Magic Carpet
    Ninscrol = 0x878787, // "#878787", // Ninja Scroll Virtual Machine Map Backpack
    
    _ = 0x787878, // "#787878"
    _ = 0x696969, // "#696969"
    _ = 0x5a5a5a, // "#5a5a5a"
    _ = 0x4b4b4b, // "#4b4b4b"

    _ = 0x3c3c3c, // "#3c3c3c"
    _ = 0x2d2d2d, // "#2d2d2d"
    _ = 0x1e1e1e, // "#1e1e1e"
    _ = 0x0f0f0f, // "#0f0f0f"

}


Zedex :: enum {
    // Group 1 - The deepest, foundational darkness
    eternia = 0x000000, // "#000000" (Eternal, foundational darkness)
    femcron = 0x080607, // "#080607"
    nemesia = 0x0d082a, // "#0d082a" (Dark blue/black)
    mortisa = 0x0f2e2f, // "#0f2e2f" (Dark, muted color of death)
    // Group 2 - Earthy, fundamental elements, shadows of the ground
    chloeia = 0x2b0a09, // "#2b0a09" (Dark, rich earth)
    halleon = 0x302a0c, // "#302a0c" (Dark, muddy brown)
    alatton = 0x302c2d, // "#302c2d" (Dark, dry soil)
    sombria = 0x1f1e1e, // "#1f1e1e" (Somber, deep shadow)
    // Group 3 - Muted, subtle, hidden natural colors
    michele = 0x32423b, // "#32423b" (Muted, mystic green)
    lorelai = 0x2b3c43, // "#2b3c43" (Deep sea/dark gray-blue)
    mistina = 0x545151, // "#545151" (Cosmic dust/diffuse gray)
    devajoi = 0x505a62, // "#505a62" (The color of a persistent shadow)
    // Group 4 - Stone, weathered, and aged surfaces
    marmora = 0x534c4d, // "#534c4d" (Marmoreal/stone gray)
    cindera = 0x787b86, // "#787b86" (Weathered stone)
    ashlynn = 0x707070, // "#707070" (Mid-gray, like cooled ash)
    miranda = 0x888585, // "#888585" (Sea-gray)
    // Group 5 - Fading, paleness, and the sudden emergence of pure color
    daphnea = 0xa59b9c, // "#a59b9c" (Ghostly, pale gray)
    oddryad = 0xb4c7b3, // "#b4c7b3" (Pale, mossy green)
    wispira = 0xece6e5, // "#ece6e5" (Whisper-light, almost white)
    furyosa = 0xff0800, // "#ff0800" (Pure, unchecked, bright red)
    // Group 6 - Red: Direct action, intense conflict
    blazing = 0xe82809, // "#e82809" (Dark, commanding red)
    avenges = 0xcd2f09, // "#cd2f09" (Deep, visceral red)
    bloodra = 0xe22f2d, // "#e22f2d" (Bright, fresh red)
    vengeur = 0xd93422, // "#d93422" (Vengeful red)
    // Group 7 - Named Reds: Individual identities in conflict
    rocioka = 0xde3163, // "#de3163"
    brianna = 0xe34234, // "#e34234"
    snitchz = 0xd24e41, // "#d24e41"
    elkiera = 0xd10047, // "#d10047"
    // Group 8 - Named Reds: Intensified, focused rage
    tajerah = 0xf10405, // "#f10405"
    kiarama = 0xcf0506, // "#cf0506"
    taijtzu = 0xae0405, // "#ae0405"
    evrtaye = 0x900405, // "#900405"
    // Group 9 - Named Reds: Thematic Crime (Spilling/Holding Blood)
    sicario = 0x710305, // "#710305"
    hitmanz = 0x4f0304, // "#4f0304"
    daolong = 0xb22222, // "#b22222"
    yakuzaz = 0x671f20, // "#671f20"
    // Group 10 - Earth and Flesh tones, grounded emotions
    sinclai = 0x6b3431, // "#6b3431" (Deep, ancient, brown-red)
    mournia = 0x463534, // "#463534" (Somber, dried blood/deep rust)
    khalida = 0xae5446, // "#ae5446" (Permanent, enduring rose-brown)
    mahogan = 0x8d493c, // "#8d493c" (Rich, dense wood color)
    // Group 11 - Deep, hidden, sensual purples and browns
    selenia = 0x685450, // "#685450" (Lunar, subtle gray-brown-pink)
    mystery = 0x763b63, // "#763b63" (Purple-brown)
    circeya = 0x814e5f, // "#814e5f" (Enchantress's color)
    sirenaz = 0x985484, // "#985484" (Alluring deep purple-pink)
    // Group 12 - Fading or muted passion, old silk
    melanie = 0x745468, // "#745468" (Dark, reflective, somber pink-gray)
    rhoslyn = 0x967187, // "#967187" (Dusty rose)
    delilah = 0x8a6d72, // "#8a6d72" (Muted, tempting pink-brown)
    aurora  = 0xcea79f, // "#cea79f" (Dawn-light, softest pink)
    // Group 13 - Fire, heat, and volcanic forces
    ignitia = 0xb83025, // "#b83025" (The slow, deep burn of fire)
    vulcana = 0x973629, // "#973629" (Raw, smoldering earth)
    eruptah = 0xcf4f34, // "#cf4f34" (Active, hot orange-red)
    blazeah = 0xe55034, // "#e55034" (Searing, intense heat)
    // Group 14 - Warmth, comfort, and the sun's gentle touch
    solaris = 0xeb6957, // "#eb6957" (Sunlight on skin)
    merciah = 0xed7d64, // "#ed7d64" (Merciful, soft heat)
    clarice = 0xd77057, // "#d77057" (Clear, warm color)
    adalina = 0xc97966, // "#c97966" (Noble and gentle glow)
    // Group 15 - Bright, vibrant energy and zest
    zestira = 0xeb9272, // "#eb9272" (Citrus peel)
    vitalin = 0xec5312, // "#ec5312" (Pure, essential energy)
    elixira = 0xa6380b, // "#a6380b" (Deep, complex tonic)
    savanna = 0x88340d, // "#88340d" (Dry earth and tall grass)
    // Group 16 - Gold and metallic sheen, high value
    aurumal = 0xd24d0b, // "#d24d0b" (Shimmering orange-gold)
    talisma = 0xe8630f, // "#e8630f" (Protective, bright gold)
    gloriah = 0xf67521, // "#f67521" (High praise and success)
    treasur = 0xd1702b, // "#d1702b" (Hard-won prize)
    // Group 17 - Earthly treasures and solid worth
    topazia = 0xaf530f, // "#af530f" (Uncut gem)
    rootena = 0x6b3509, // "#6b3509" (Deep, unmoving earth)
    fortuna = 0xd16b0f, // "#d16b0f" (Bright, striking windfall)
    carlita = 0xb7410e, // "#b7410e" (Strong and enduring)
    // Group 18 - Rich textiles and opulent interiors
    brocade = 0xa0532f, // "#a0532f" (Heavy, detailed fabric)
    amforah = 0xa77157, // "#a77157" (Ancient, cracked pottery)
    patinah = 0xa77c64, // "#a77c64" (Aged surface of bronze)
    cashmir = 0xc49976, // "#c49976" (Soft, luxurious wool)
    // Group 19 - Hidden resources and rugged terrain
    cragges = 0x654f3c, // "#654f3c" (Dark, rugged stone)
    bonanza = 0xecaf79, // "#ecaf79" (Bright, sudden find)
    vespera = 0x8b7258, // "#8b7258" (Evening light on dry hills)
    camilla = 0xcba47b, // "#cba47b" (Ritual robes)
    // Group 20 - Muted, wise, or secretive greens
    archiva = 0xac9170, // "#ac9170" (Parchment color of old records)
    secretz = 0x524837, // "#524837" (Dark, mossy green)
    dharmaa = 0x756852, // "#756852" (Subtle, correct path)
    zenitha = 0x96876c, // "#96876c" (Peak of achievement)
    // Group 21 - Ancient, preserved beauty and deep history
    egyptia = 0xb5a37c, // "#b5a37c" (Dusty, dry gold-green)
    pyramid = 0xe8d5a9, // "#e8d5a9" (Pale, dry stone)
    atlantz = 0x97875d, // "#97875d" (Lost treasure of a sunken city)
    pioneer = 0xbe7420, // "#be7420" (Color of new discovery)
    // Group 22 - The sun at its height, pure energy
    luminia = 0xf59529, // "#f59529" (Radiant, glowing energy)
    flaming = 0x89570f, // "#89570f" (Deep, consuming heat)
    heliose = 0xf3981a, // "#f3981a" (Sun god's color)
    solstis = 0xd2932a, // "#d2932a" (Sun's peak)
    // Group 23 - Heavy metals and powerful, focused brilliance
    midasya = 0xb68423, // "#b68423" (Fatal touch, pure gold)
    brassic = 0xf1af25, // "#f1af25" (Trumpet blast)
    crypton = 0x4a3606, // "#4a3606" (Dark, dense ore)
    apolloh = 0xa57a0b, // "#a57a0b" (Divine gold)
    // Group 24 - Deep, old wealth and enduring kingship
    kingdom = 0x8f7226, // "#8f7226" (Heavy, enduring gold)
    soverin = 0x6d5409, // "#6d5409" (Dark, commanding power)
    crownia = 0x917009, // "#917009" (Jewel-encrusted headpiece)
    regalia = 0xc8980a, // "#c8980a" (Official, bright majesty)
    // Group 25 - Striking, pure yellow, unmixed
    citrine = 0xebb60d, // "#ebb60d" (Clear, sharp quartz gem)
    honeybu = 0xb28c09, // "#b28c09" (Liquid, sweet gold)
    flaviah = 0xd1aa0c, // "#d1aa0c" (Ancient Roman for 'golden')
    xanthea = 0xf9ce26, // "#f9ce26" (Meaning 'yellow hair')
    // Group 26 - The beginning of green, life emerging
    edenite = 0xcdae25, // "#cdae25" (Paradise starting to bloom)
    radiant = 0xf6d00c, // "#f6d00c" (Pure, brilliant glow)
    fertilz = 0x534d08, // "#534d08" (Dark, rich soil)
    verdant = 0x706e0a, // "#706e0a" (New growth and promise)
    // Group 27 - The brilliance of new life, pure light and chlorophyll
    alchemi = 0xf7f40c, // "#f7f40c" (Philosophical gold)
    naturaa = 0xf0ec23, // "#f0ec23" (Pure, unbridled natural vitality)
    lucinda = 0x90910b, // "#90910b" (Bearer of light)
    jocelyn = 0xb0b00c, // "#b0b00c" (Cheerful, bright, and stable)
    // Group 28 - Muted, stable, domestic greens
    vestala = 0xcfcf0f, // "#cfcf0f" (Hearth-fire green)
    harvest = 0x6a6a24, // "#6a6a24" (Ripe grain and late summer)
    dorothy = 0xd0cf25, // "#d0cf25" (Gift from god)
    prudenc = 0xb6b626, // "#b6b626" (Steady, careful yellow-green)
    // Group 29 - Wild growth and untamed nature
    rustica = 0x8e8f30, // "#8e8f30" (Unrefined, wild, untamed land)
    junglez = 0x9ba30b, // "#9ba30b" (Dense, dark heart of a forest)
    virescn = 0xb9c60c, // "#b9c60c" (Starting to become green)
    flouris = 0xd7ed11, // "#d7ed11" (Peak of green health)
    // Group 30 - Deep, unyielding, permanent green
    challan = 0x596308, // "#596308" (Deep, dark layered rock)
    dayanaz = 0x788809, // "#788809" (Enduring, stable green)
    oliviah = 0x7e8d23, // "#7e8d23" (Olive branch)
    primera = 0x3a4507, // "#3a4507" (The first, original life-color)
    // Group 31 - Energetic, synthetic, and bright green
    neonisa = 0xd1f625, // "#d1f625" (Artificial, electric)
    cyberia = 0xadcf2a, // "#adcf2a" (Digital, vibrant edge)
    pixelyn = 0x88a42b, // "#88a42b" (Building block color)
    toxicia = 0xb4fd0c, // "#b4fd0c" (Alarming, unnaturally vivid green)
    // Group 32 - Lively, healthy, vital greens
    victory = 0x95c52e, // "#95c52e" (Laurel crown, success)
    rivulet = 0xaaec28, // "#aaec28" (Rushing, clear green water)
    palmyra = 0x92d21a, // "#92d21a" (Rich, cultivated green)
    vitalia = 0x73ae0e, // "#73ae0e" (Core of health and enduring life)
    // Group 33 - The true, ideal green of the natural world
    natalie = 0x8fee13, // "#8fee13" (New beginning and pure life)
    foresta = 0x50930f, // "#50930f" (Deepest, most serene woods)
    viridis = 0x88ef22, // "#88ef22" (Latin for green)
    gardena = 0x6ecc14, // "#6ecc14" (Tended, cultivated green)
    // Group 34 - Pure, powerful, elemental green
    herbaly = 0x6eea08, // "#6eea08" (Essence of a healing plant)
    primavr = 0x53b20c, // "#53b20c" (Springtime, fresh green)
    chloean = 0x6ec332, // "#6ec332" (Vigorous new shoot)
    venusia = 0x53c20b, // "#53c20b" (Lush color of love and growth)
    // Group 35 - Named Greens: Specific, intense identities
    manisha = 0x338c00, // "#338c00"
    emogenz = 0x5feb0e, // "#5feb0e"
    manuxah = 0x297106, // "#297106"
    luxlana = 0x33d301, // "#33d301"
    // Group 36 - Named Greens: Stable, deep, and established
    fkatwig = 0x2bb405, // "#2bb405"
    chantal = 0x31ea0a, // "#31ea0a"
    jessica = 0x065106, // "#065106"
    tinashe = 0x068f06, // "#068f06"
    // Group 37 - Named Greens: Clear, open, and honest
    joivial = 0x06af06, // "#06af06"
    dimanek = 0x08ce08, // "#08ce08"
    shirley = 0x07ed08, // "#07ed08"
    justina = 0x056f06, // "#056f06"
    // Group 38 - The deep waters and the edge of the shore
    azurela = 0x052f07, // "#052f07" (Darkest point before the water turns)
    sylvana = 0x09f02c, // "#09f02c" (Forest and water edge)
    riverna = 0x07cf31, // "#07cf31" (Deep, cool flow of a river)
    seafret = 0x05ae32, // "#05ae32" (Dark color of the water's mood)
    // Group 39 - Magical, elusive, and deep water greens
    elphaba = 0x028f2e, // "#028f2e"
    oceanus = 0x09f053, // "#09f053" (Bright, strange green of sea growth)
    mermaid = 0x27ab58, // "#27ab58" (Dark green of deep ocean myth)
    nimphes = 0x01ca4e, // "#01ca4e" (Perfect, unearthly, vivid green)
    // Group 40 - Grounded, solid, subtle greens
    mercyna = 0x057030, // "#057030" (Dark, gentle, and forgiving color)
    gracela = 0x04b04b, // "#04b04b" (Gray-green, subtle strength)
    floreta = 0x08f06d, // "#08f06d" (Flowering green)
    stelara = 0x506258, // "#506258" (Star-like, cool gray-green)
    // Group 41 - Measured, controlled, and wise greens
    hespira = 0x079250, // "#079250" (Evening star, calm, deep green)
    fernish = 0x09cb71, // "#09cb71"
    serenea = 0x708179, // "#708179" (Calm, balanced, tranquil gray-green)
    valkyra = 0x08a96b, // "#08a96b" (Serious color of a warrior)
    // Group 42 - Named Blues/Greens: Elements of a magical/intellectual world
    sorcery = 0x064835, // "#064835"
    alchemo = 0x09d4a9, // "#09d4a9"
    history = 0x076956, // "#076956"
    mystere = 0x2e655e, // "#2e655e"
    // Group 43 - Named Blues/Greens: Water and hidden depths
    knimbel = 0x74c3b8, // "#74c3b8"
    rinnego = 0x058979, // "#058979"
    noireci = 0x4f837d, // "#4f837d"
    aileens = 0x09504f, // "#09504f"
    // Group 44 - Named Blues/Greens: Bright, modern, and striking
    britney = 0x079fa0, // "#079fa0"
    lacinna = 0x0adede, // "#0adede"
    aryssar = 0x087071, // "#087071"
    pompoca = 0x396b6e, // "#396b6e"
    // Group 45 - The sky, its reflection, and deep foundations
    celeste = 0x93eff4, // "#93eff4" (Heavenly, light, pure air/water)
    cruciah = 0x2e4f52, // "#2e4f52" (Dark, inevitable fate)
    medusal = 0x457276, // "#457276" (Cold, distant color of a turning tide)
    serapha = 0x579aa2, // "#579aa2" (Angelic, soft, ethereal blue)
    // Group 46 - Water: Movement, depth, and coldness
    tsunami = 0x73d1db, // "#73d1db" (Crest of a wave)
    marella = 0x085c67, // "#085c67" (Small sea, deep and quiet)
    oceania = 0x0c7886, // "#0c7886" (Vast, open, deep blue)
    fjorden = 0x335c62, // "#335c62" (Dark, cold inlet)
    // Group 47 - Blue: Clarity, distance, and high-tech purpose
    cyanosa = 0x497c84, // "#497c84" (Clear, subtle blue of a summer haze)
    hightec = 0x68b9c5, // "#68b9c5" (Cool, precise digital interface)
    rangela = 0x397b87, // "#397b87" (Depth of vision)
    avatara = 0x11b2d4, // "#11b2d4" (Perfect, virtual blue)
    // Group 48 - Dark Blue: Authority, history, and seriousness
    navalah = 0x0c3846, // "#0c3846" (Naval blue, authority)
    genesis = 0x1368ae, // "#1368ae" (The beginning, first true blue)
    justice = 0x266caa, // "#266caa" (Steady, deep blue)
    magista = 0x0b6ecd, // "#0b6ecd" (Wise, cool ruler)
    // Group 49 - Deep Blue: The realm of the mind and spirit
    mindset = 0x154e91, // "#154e91" (Focused, controlled thought)
    project = 0x1478eb, // "#1478eb" (Clear, bright goal)
    mythica = 0x07316b, // "#07316b" (Dark blue of ancient truth)
    truthel = 0x074bb8, // "#074bb8" (Clear, undeniable reality)
    // Group 50 - The power of the source, deep and electric
    sparkle = 0x213b6f, // "#213b6f" (Hidden energy)
    arcana = 0x0750f0, // "#0750f0" (Secret knowledge)
    oraclea = 0x0b328e, // "#0b328e" (Perfect foresight)
    aethera = 0x0d46ce, // "#0d46ce" (Upper air, pure blue)
    // Group 51 - The electric charge, vibrant, overwhelming blue
    electra = 0x0a2faa, // "#0a2faa" (Pure, raw energy)
    hyperia = 0x0633cd, // "#0633cd" (Beyond the normal, intense color)
    plasmah = 0x0838fc, // "#0838fc" (Brilliant and hot)
    voidana = 0x03036f, // "#03036f" (Deepest point of non-existence)
    // Group 52 - The turn to violet, twilight and distant planets
    kaisela = 0x030290, // "#030290" (Dark, serene night sky)
    lilitha = 0x0302ae, // "#0302ae" (Dark, seductive blue-violet)
    galaxia = 0xa4a4cb, // "#a4a4cb" (Stardust, pale purple)
    cosmica = 0x0302d0, // "#0302d0" (Deep, unmoving color of space)
    // Group 53 - The entry to purple, magic and transformation
    mystrix = 0x0202f3, // "#0202f3" (Deep blue-violet)
    runicia = 0x04024e, // "#04024e" (Dark, hidden magic symbols)
    witchia = 0x2c037b, // "#2c037b" (Deep purple of sorcery)
    esotera = 0x37068d, // "#37068d" (Hidden, profound knowledge)
    // Group 54 - Purple: Royal, noble, and controlled power
    queenia = 0x3f08a1, // "#3f08a1" (High-born blood)
    empress = 0x4707b0, // "#4707b0" (Commanding, stable, royal purple)
    phoenix = 0x5105cd, // "#5105cd" (Color of rebirth)
    titania = 0x5d06e0, // "#5d06e0" (Fairy queen)
    // Group 55 - Named Purples: Intense, individual magic/persona
    dimeate = 0x6a05ee, // "#6a05ee"
    ogcandy = 0x6402d9, // "#6402d9"
    shirliz = 0x590686, // "#590686"
    baiyula = 0x9d02e2, // "#9d02e2"
    // Group 56 - Dark, brooding, inner reflection
    eclipse = 0x37044a, // "#37044a" (Total absence of light, deep plum)
    vesuviu = 0x7b03a8, // "#7b03a8" (Dark, volcanic, latent energy)
    abigail = 0x9804c8, // "#9804c8" (Powerful, dark emotion)
    mykayla = 0x55046d, // "#55046d"
    // Group 57 - Purple: Clarity, vision, and depth of spirit
    soulana = 0xb403e8, // "#b403e8" (Highest spiritual color)
    ajayish = 0x710390, // "#710390"
    visionz = 0x8e03b0, // "#8e03b0" (Color of inner sight)
    magnifi = 0xac03cf, // "#ac03cf" (Magnificent, bright, and commanding)
    // Group 58 - Magenta/Pink: Sudden passion, sharp beauty
    passion = 0xd004ed, // "#d004ed" (Uncontrolled, vibrant emotion)
    poisone = 0x4d0451, // "#4d0451" (Dark, tempting, a fatal allure)
    seductz = 0xe23ee8, // "#e23ee8" (Flamboyant, alluring magenta)
    roxanna = 0x6e0470, // "#6e0470" (Vibrant, strong, with a dark core)
    // Group 59 - Magenta/Pink: The edge of reality, the abstract
    madonna = 0xcd04cf, // "#cd04cf" (Pure, high magenta)
    utopian = 0xee04f0, // "#ee04f0" (Perfect, ideal, unnaturally bright)
    nihilin = 0x2d0b2d, // "#2d0b2d" (Dark, abstract color of nothingness)
    concept = 0x8f0490, // "#8f0490" (A concept, pure magenta)
    // Group 60 - Purple: Balance, high skill, and artistry
    artista = 0xae04af, // "#ae04af" (Creative focus)
    virtuos = 0xc404bc, // "#c404bc" (Mastery, high, clear purple)
    talenta = 0xe203db, // "#e203db" (Natural skill)
    harmony = 0xa4059b, // "#a4059b" (Balanced, peaceful purple)
    // Group 61 - Muted Purples: Old knowledge, quiet dignity
    cloiste = 0xb73ab1, // "#b73ab1" (Quiet reflection)
    mediate = 0x83087a, // "#83087a" (Deep, still, inner violet)
    pallass = 0x8f3388, // "#8f3388" (Dignified, muted mauve)
    chastus = 0xa5369c, // "#a5369c" (Pure, disciplined purple)
    // Group 62 - Dark, intense feeling and hidden strength
    dolorsa = 0x65035c, // "#65035c" (Sorrowful, deep, dark purple)
    valoura = 0xb453ab, // "#b453ab" (Quiet courage)
    marciah = 0xca32b5, // "#ca32b5" (Warlike, bold pink-purple)
    obsidia = 0x460e39, // "#460e39" (Deep, dark, glassy)
    // Group 63 - Pink/Magenta: Open affection, soft power
    affecia = 0xc857ad, // "#c857ad" (Display of love)
    innocen = 0xee9fdb, // "#ee9fdb" (Most delicate, untouched color)
    kindred = 0xb869a4, // "#b869a4" (Close, familial tie)
    gentles = 0xea78cb, // "#ea78cb" (Sweet, tender, soft pink)
    // Group 64 - Muted, serious, hidden emotion
    emotion = 0x88386d, // "#88386d" (Complex, difficult feeling)
    complex = 0xcf6daf, // "#cf6daf" (Difficult, layered purple-pink)
    resigna = 0x503647, // "#503647" (Quiet surrender)
    tribute = 0x693657, // "#693657" (Serious, respectful, dark color)
    // Group 65 - Pink/Mauve: Personal journey and introspection
    pilgrim = 0xad588f, // "#ad588f" (Road-worn color of a quest)
    mercuri = 0xe373bb, // "#e373bb" (Fluid, changing, brilliant pink)
    journey = 0x8b4e74, // "#8b4e74" (Color of time and travel)
    destiny = 0xc45c9c, // "#c45c9c" (Unavoidable path)
    // Group 66 - Muted Pink/White: Endings, peace, and finality
    graceia = 0xc2649e, // "#c2649e" (Elegant, refined, soft pink)
    serenit = 0xab7395, // "#ab7395" (Calm, peaceful, subdued rose)
    mortalz = 0xa5497f, // "#a5497f" (Fading color of life)
    sophian = 0xffffff, // "#ffffff" (Wise white, wisdom after knowledge)
}


Corehex :: enum {
    Purehex,
    Typehex,
    Arthex ,
    Kindhex,
    Pathhex,
    Acthex ,
    Objhex ,
    Zedex  ,
}

main :: proc() {
    fmt.println(size_of(Purehex))
    fmt.println(size_of(Typehex))
    fmt.println(size_of(Arthex ))    
    fmt.println(size_of(Kindhex))
    fmt.println(size_of(Pathhex))
    fmt.println(size_of(Acthex ))
    fmt.println(size_of(Objhex ))
    fmt.println(size_of(Zedex  ))
    fmt.println(size_of(Corehex))
}
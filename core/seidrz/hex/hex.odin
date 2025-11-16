package hex

import "core:seidrz/lex"

_: lex.BigHEADz

// Key Items
OOParts :: enum {
	TORCH = 0x9300, // "#9300" 
	CLOAK = 0x9301, // "#9301" 
	WATCH = 0x9302, // "#9302" 
	FLARE = 0x9303, // "#9303" 

	BROOM = 0x9304, // "#9304" 
	SHELL = 0x9305, // "#9305" 
	GLASS = 0x9306, // "#9306" 
	SPADE = 0x9307, // "#9307" 
	
	FLINT = 0x9308, // "#9308" 
	FLASK = 0x9309, // "#9309" 
	LAMPS = 0x930a, // "#930a" 
	SHEAR = 0x930b, // "#930b" 

	BATON = 0x930c, // "#930c" 
	FLUTE = 0x930d, // "#930d" 
	CARDZ = 0x930e, // "#930e" 
	MONEY = 0x930f, // "#930f"
}

Physic :: enum {
	Archon   = 0xf00f, // "#f00f" // UILayers
	Photon   = 0xf01f, // "#f01f" // Lighting
	Electron = 0xf02f, // "#f02f" // Technology
	Vulkon   = 0xf03f, // "#f03f" // Day/Night

	Vectron  = 0xf04f, // "#f04f" // Movement
	Numeron  = 0xf05f, // "#f05f" // Weather
	Fraction = 0xf06f, // "#f06f" // particles
	Neutron  = 0xf07f, // "#f07f" // collisions

	Tachyon  = 0xf08f, // "#f08f" // animations
	Proton   = 0xf09f, // "#f09f" // statistics
	Positron = 0xf0af, // "#f0af" // Reproduction
	Polyphon = 0xf0bf, // "#f0bf" // Farming

	Sophon   = 0xf0cf, // "#f0cf" // Education
	Phonon   = 0xf0df, // "#f0df" // Sound
	Logion   = 0xf0ef, // "#f0ef" // Memory
	Antiphon = 0xf0ff, // "#f0ff" // Errors/Glitch
}

// AI Settings
Genius :: enum {
	// Simple Tribez
	House   = 0x00ff, // "#00ff" // gifts
	Market  = 0x11ff, // "#11ff" // stores
	Arena   = 0x22ff, // "#22ff" // Combat
	Clinic  = 0x33ff, // "#33ff" // Dungeon
	// Wander Tribez
	Whisper = 0x44ff, // "#44ff" // Static NPCs  / stay in one spot
	Wander  = 0x55ff, // "#55ff" // Dynamic NPCs / wander around scene
	Wunder  = 0x66ff, // "#66ff" // Event NPCs / await player
	Knocker = 0x77ff, // "#77ff" // Rival NPCs / synch player
	// Indian Tribez
	Endian  = 0x88ff, // "#88ff" // Forest objects
	Andian  = 0x99ff, // "#99ff" // Mountain objects
	Ondian  = 0xaaff, // "#aaff" // Desert objects
	Undian  = 0xbbff, // "#bbff" // Ocean objects
	// Wunder Tribez
	Intern  = 0xccff, // "#ccff" // PopStar / Follow Mons
	Anthem  = 0xddff, // "#ddff" // Elysium / Music objects
	Entity  = 0xeeff, // "#eeff" // Gehenna / Visual Objects
	Untold  = 0xffff, // "#ffff" // Wunderland / Invisible objects
}

// AI behavior and Appearances
Species :: enum {
	// Group 1: Plexci Colors
	Noirel = 0xa0f0, // "#a0f0" // angel             /*Black, White, Gray, Transparent*/
	Vampyr = 0xa0f1, // "#a0f1" // demon             /*Black, White, Gray, Red*/
	Frankz = 0xa0f2, // "#a0f2" // cherub            /*Black, White, Gray, Green*/
	Kinder = 0xa0f3, // "#a0f3" // djinn             /*Black, White, Gray, Blue*/
	// Group 2: Endian Colors
	Vesper = 0xa0f4, // "#a0f4" // beez              /*Black, Yellow, Red, Orange*/
	Jotanz = 0xa0f5, // "#a0f5" // giantz            /*Gray, White, Cyan, Blue*/ 
	Dwarve = 0xa0f6, // "#a0f6" // antz              /*Black, Brown, Red, Orange*/
	Golemz = 0xa0f7, // "#a0f7" // ghost             /*Black, Red, Blue, Violet*/
	// Group 3: Gamebo Colors
	Tinker = 0xa0f8, // "#a0f8" // machines          /*White, light gray, dark gray, Transparent*/
	Chemix = 0xa0f9, // "#a0f9" // poison            /*Black, pink, violet, yellow*/
	Kymera = 0xa0fa, // "#a0fa" // chimeras/spore    /*Beige, Brown, Red, orange*/
	Nymphi = 0xa0fb, // "#a0fb" // plant types       /*Brown, Green, red, yellow*/
	// Group 4: Wunder Colors
	Pakrat = 0xa0fc, // "#a0fc" // rabbit/ogres      /*Brown, White, Beige, Pink*/
	Helbat = 0xa0fd, // "#a0fd" // Flying beast      /*Black, Brown, Red, Gray*/
	Balrog = 0xa0fe, // "#a0fe" // cat/dragons       /*Black, White, Orange, Red*/
	Kobold = 0xa0ff, // "#a0ff" // Talkin dogs/fairy /*White, Pink, Violet, Brown*/
}

//	Player and NPC Skills
Arcana :: enum {
	Readz  = 0xff00, // "#ff00" //
	Write  = 0xff01, // "#ff01" //
	Spark  = 0xff02, // "#ff02" //
	Trash  = 0xff03, // "#ff03" //
	
	Bless  = 0xff04, // "#ff04" //
	Curse  = 0xff05, // "#ff05" //
	Trade  = 0xff06, // "#ff06" //
	Build  = 0xff07, // "#ff07" //
	
	Forge  = 0xff08, // "#ff08" //
	Smith  = 0xff09, // "#ff09" //
	Clean  = 0xff0a, // "#ff0a" //
	Seedz  = 0xff0b, // "#ff0b" //
	
	Melee  = 0xff0c, // "#ff0c" // 
	Siren  = 0xff0d, // "#ff0d" // 
	Order  = 0xff0e, // "#ff0e" // 
	Clock  = 0xff0f, // "#ff0f" // 
}

// Elemental Type
Chakra :: enum {
	Umber = 0x46a0, // "#46a0" // 
	Omber = 0x46a1, // "#46a1" // 
	Flash = 0x46a2, // "#46a2" // 
	Ember = 0x46a3, // "#46a3" // 
	
	Aerow = 0x46a4, // "#46a4" // 
	Imber = 0x46a5, // "#46a5" // 
	Frost = 0x46a6, // "#46a6" // 
	Amber = 0x46a7, // "#46a7" // 
	
	Alloy = 0x46a8, // "#46a8" // 
	Toxin = 0x46a9, // "#46a9" // 
	Spore = 0x46aa, // "#46aa" // 
	Flora = 0x46ab, // "#46ab" // 
	
	Fauna = 0x46ac, // "#46ac" // 
	Music = 0x46ad, // "#46ad" // 
	Magic = 0x46ae, // "#46ae" // 
	Unown = 0x46af, // "#46af" // 
}

// Object Modifiers
Adject :: enum {
	Dark    = 0x6900, // "#69a0"  
	Light   = 0x6901, // "#6901"  
	Thunder = 0x6902, // "#6902"  
	Fire    = 0x6903, // "#6903"  

	Air     = 0x6904, // "#6904"  
	Water   = 0x6905, // "#6905"  
	Ice     = 0x6906, // "#6906"  
	Stone   = 0x6907, // "#6907"  

	Metal   = 0x6908, // "#6908"  
	Tonic   = 0x6909, // "#6909"  
	Fungi   = 0x690a, // "#690a"  
	Plant   = 0x690b, // "#690b"  

	Beast   = 0x690c, // "#690c"  
	Esper   = 0x690d, // "#690d"  
	Psych   = 0x690e, // "#690e" 
	Ether   = 0x690f, // "#690f" 
}

Actions :: enum {
	KILL = 0xf600, // "#f600"
	SHOW = 0xf601, // "#f601"
	DASH = 0xf602, // "#f602"
	TOSS = 0xf603, // "#f603"

	JUMP = 0xf604, // "#f604"
	DIVE = 0xf605, // "#f605"
	HOLD = 0xf606, // "#f606"
	ROCK = 0xf607, // "#f607"

	POUR = 0xf608, // "#f608"
	OPEN = 0xf609, // "#f609"
	LOCK = 0xf60a, // "#f60a"
	PICK = 0xf60b, // "#f60b"

	CALL = 0xf60c, // "#f60c"
	TALK = 0xf60d, // "#f60d"
	HIDE = 0xf60e, // "#f60e"
	FALL = 0xf60f, // "#f60f" 
}

/*
ReParts :: enum {
	_TORCH = 0x0039, // "#0039" 
	_CLOAK = 0x1039, // "#1039" 
	_WATCH = 0x2039, // "#2039" 
	_FLARE = 0x3039, // "#3039" 

	_BROOM = 0x4039, // "#4039" 
	_SHELL = 0x5039, // "#5039" 
	_GLASS = 0x6039, // "#6039" 
	_SPADE = 0x7039, // "#7039" 
	
	_FLINT = 0x8039, // "#8039" 
	_FLASK = 0x9039, // "#9039" 
	_LAMPS = 0xa039, // "#a039" 
	_SHEAR = 0xb039, // "#b039" 

	_BATON = 0xc039, // "#c039" 
	_FLUTE = 0xd039, // "#d039" 
	_CARDZ = 0xe039, // "#e039" 
	_MONEY = 0xf039, // "#f039" 
}

RePhysic :: enum {
	_Archon   = 0xf00f, // "#f00f"
	_Photon   = 0xf10f, // "#f10f"
	_Electron = 0xf20f, // "#f20f"
	_Vulkon   = 0xf30f, // "#f30f"

	_Vectron  = 0xf40f, // "#f40f"
	_Numeron  = 0xf50f, // "#f50f"
	_Fraction = 0xf60f, // "#f60f"
	_Neutron  = 0xf70f, // "#f70f"

	_Tachyon  = 0xf80f, // "#f80f"
	_Proton   = 0xf90f, // "#f90f"
	_Positron = 0xfa0f, // "#fa0f"
	_Polyphon = 0xfb0f, // "#fb0f"

	_Sophon   = 0xfc0f, // "#fc0f"
	_Phonon   = 0xfd0f, // "#fd0f"
	_Logion   = 0xfe0f, // "#fe0f"
	_Antiphon = 0xff0f, // "#ff0f"
}

ReGenius :: enum {
	_House   = 0xff00, // "#ff00"
	_Market  = 0xff11, // "#ff11"
	_Arena   = 0xff22, // "#ff22"
	_Clinic  = 0xff33, // "#ff33"

	_Whisper = 0xff44, // "#ff44"
	_Wander  = 0xff55, // "#ff55"
	_Wunder  = 0xff66, // "#ff66"
	_Knocker = 0xff77, // "#ff77"

	_Endian  = 0xff88, // "#ff88"
	_Andian  = 0xff99, // "#ff99"
	_Ondian  = 0xffaa, // "#ffaa"
	_Undian  = 0xffbb, // "#ffbb"

	_Intern  = 0xffcc, // "#ffcc"
	_Anthem  = 0xffdd, // "#ffdd"
	_Entity  = 0xffee, // "#ffee"
	_Untold  = 0xffff, // "#ffff"
}

ReSpecies :: enum {
	_Noirel = 0xf0a0, // "#f0a0"
	_Vampyr = 0xf1a1, // "#f1a1"
	_Frankz = 0xf2a2, // "#f2a2"
	_Kinder = 0xf3a3, // "#f3a3"

	_Vesper = 0xf4a4, // "#f4a4" 
	_Jotanz = 0xf5a5, // "#f5a5"
	_Dwarve = 0xf6a6, // "#f6a6"
	_Golemz = 0xf7a7, // "#f7a7"

	_Tinker = 0xf8a8, // "#f8a8"
	_Chemix = 0xf9a9, // "#f9a9"
	_Kymera = 0xfaaa, // "#faaa"
	_Nymphi = 0xfbab, // "#fbab"

	_Pakrat = 0xfcac, // "#fcac"
	_Helbat = 0xfdad, // "#fdad"
	_Balrog = 0xfeae, // "#feae"
	_Kobold = 0xffaf, // "#ffaf"
}

ReArcana :: enum {
	_Readz  = 0x00ff, // "#00ff"
	_Write  = 0x10ff, // "#10ff"
	_Spark  = 0x20ff, // "#20ff"
	_Trash  = 0x30ff, // "#30ff"
	
	_Bless  = 0x40ff, // "#40ff"
	_Curse  = 0x50ff, // "#50ff"
	_Trade  = 0x60ff, // "#60ff"
	_Build  = 0x70ff, // "#70ff"
	
	_Forge  = 0x80ff, // "#80ff"
	_Smith  = 0x90ff, // "#90ff"
	_Clean  = 0xa0ff, // "#a0ff"
	_Seedz  = 0xb0ff, // "#b0ff"
	
	_Melee  = 0xc0ff, // "#c0ff"
	_Siren  = 0xd0ff, // "#d0ff"
	_Order  = 0xe0ff, // "#e0ff"
	_Clock  = 0xf0ff, // "#f0ff"
}

ReChakra :: enum {
	_Umbra = 0xa064, // "#a064"
	_Ember = 0xa164, // "#a164"
	_Voltz = 0xa264, // "#a264"
	_Flame = 0xa364, // "#a364"
	
	_Aerow = 0xa464, // "#a464"
	_Hydro = 0xa564, // "#a564"
	_Frost = 0xa664, // "#a664"
	_Stone = 0xa764, // "#a764"
	
	_Alloy = 0xa864, // "#a864"
	_Toxin = 0xa964, // "#a964"
	_Spore = 0xaa64, // "#aa64"
	_Flora = 0xab64, // "#ab64"
	
	_Fauna = 0xac64, // "#ac64"
	_Music = 0xad64, // "#ad64"
	_Magic = 0xae64, // "#ae64"
	_Unown = 0xaf64, // "#af64"
}

ReAdject :: enum {
	_Dark    = 0x0096, // "#0096"  
	_Light   = 0x1096, // "#1096"  
	_Thunder = 0x2096, // "#2096"  
	_Fire    = 0x3096, // "#3096"  

	_Air     = 0x4096, // "#4096"  
	_Water   = 0x5096, // "#5096"  
	_Ice     = 0x6096, // "#6096"  
	_Earth   = 0x7096, // "#7096"  

	_Metal   = 0x8096, // "#8096"  
	_Tonic   = 0x9096, // "#9096"  
	_Fungi   = 0xa096, // "#a096"  
	_Plant   = 0xb096, // "#b096"  

	_Beast   = 0xc096, // "#c096"  
	_Esper   = 0xd096, // "#d096"  
	_Psych   = 0xe096, // "#e096" 
	_Ether   = 0xf096, // "#f096" 
}

ReActions :: enum {
    _GRAB = 0x006f, // "#006f"
    _SHOW = 0x106f, // "#106f"
    _DASH = 0x206f, // "#206f"
    _TOSS = 0x306f, // "#306f"

    _JUMP = 0x406f, // "#406f"
    _SWIM = 0x506f, // "#506f"
    _HOLD = 0x606f, // "#606f"
    _ROCK = 0x706f, // "#706f"

    _POUR = 0x806f, // "#806f"
    _PULL = 0x906f, // "#906f"
    _RIDE = 0xa06f, // "#a06f"
    _PICK = 0xb06f, // "#b06f"

    _ROAR = 0xc06f, // "#c06f"
    _TALK = 0xd06f, // "#d06f"
    _HIDE = 0xe06f, // "#e06f"
    _FALL = 0xf06f, // "#f06f"
}
*/

main :: proc() {
    return
}



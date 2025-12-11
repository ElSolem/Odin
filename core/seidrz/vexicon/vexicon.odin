package vexicon

Mewtex :: enum {
    // Group 1: Functions
    NINA = 0x00, // No Intz No Action(Data) // Input
    NISA = 0x01, // No Intz Single Action(Data) // Output
    NIMA = 0x02, // No Intz Multi Action(Data) // Error
    NIPA = 0x03, // No Intz Proc Action(Data)
    // Group 2: Methods
    SINA = 0x04, // Single Intz No Action(Data)
    SISA = 0x05, // Single Intz Single Action(Data)
    SIMA = 0x06, // Single Intz Multi Action(Data)
    SIPA = 0x07, // Single Intz Proc Action(Data)
    // Group 3: Procedures
    MINA = 0x08, // Multi Intz No Action(Data)
    MISA = 0x09, // Multi Intz Single Action(Data)
    MIMA = 0x0a, // Multi Intz Multi Action(Data)
    MIPA = 0x0b, // Multi Intz Proc Action(Data)
    // Group 4: Iterators
    PINA = 0x0c, // Proc Intz No Action(Data)
    PISA = 0x0d, // Proc Intz Single Action(Data)
    PIMA = 0x0e, // Proc Intz Multi Action(Data)
    PIPA = 0x0f, // Proc Intz Proc Action(Data)
    // Group 5: Plexes
    AINA = 0x10, // Atomic Intz No Action(Data)
    AISA = 0x11, // Atomic Intz Single Action(Data)
    AIMA = 0x12, // Atomic Intz Multi Action(Data)
    AIPA = 0x13, // Atomic Intz Proc Action(Data)
    // Group 6: Macros
    QINA = 0x14, // Quant Intz No Action(Data)
    QISA = 0x15, // Quant Intz Single Action(Data)
    QIMA = 0x16, // Quant Intz Multi Action(Data)
    QIPA = 0x17, // Quant Intz Proc Action(Data)
    // Group 7: Hashes
    RINA = 0x18, // Rand Intz No Action(Data)
    RISA = 0x19, // Rand Intz Single Action(Data)
    RIMA = 0x1a, // Rand Intz Multi Action(Data)
    RIPA = 0x1b, // Rand Intz Proc Action(Data)
    // Group 8: Signals
    TINA = 0x1c, // Timed Intz No Action(Data)
    TISA = 0x1d, // Timed Intz Single Action(Data)
    TIMA = 0x1e, // Timed Intz Multi Action(Data)
    TIPA = 0x1f, // Timed Intz Proc Action(Data)
    // Group 9: Logarithms
    EINA = 0xec, // Error Intz No Action(Data)
    EISA = 0xed, // Error Intz Single Action(Data)
    EIMA = 0xee, // Error Intz Multi Action(Data)
    EIPA = 0xef, // Error Intz Proc Action(Data)
}

main :: proc() {
    return
}
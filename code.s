.memorymap
    defaultslot 0
    slotsize $2000
    slot 0 $0000
    slot 1 $2000
    slot 2 $4000
    slot 3 $6000
    slot 4 $8000
    slot 5 $A000
    slot 6 $C000
    slot 7 $E000
.endme

.rombanksize $2000
.rombanks 17

.stringmaptable mainFontMap "DDSMT.tbl"

.macro text
    .stringmap mainFontMap, \1
.endm

;text "                    "
;text "                                "

.background "Digital Devil Story.rom"

.incdir ""

.bank 2
.slot 2
.org $03CC
.section "Load Title Screen text" overwrite

	ld a, $04
	ld ($E002), a
	ld ($7800), a
	ld hl, Start
	ld b, $B0
	ld de, $1000
	call LoadText
	ld hl, Continue
	ld b, $B0
	ld de, $1028
	call LoadText
	ld hl, $1DAF
        
.ends

.bank 0
.slot 2
.org $054D
.section "Cutscene 1 load text" overwrite

	ld de, $1100
	ld b, $F1
	ld a, $0D
	ld ($E002), a
	ld ($7800), a
	ld hl, Cutscene1
	call LoadText
	.ds 11, $00
	ret

.ends

.bank 0
.slot 2
.org $04D8
.section "Cutscene 2 load text" overwrite

	ld de, $1100
	ld b, $F1
	ld a, $0D
	ld ($E002), a
	ld ($7800), a
	ld hl, Cutscene2
	call LoadText
	.ds 11, $00
	ret

.ends

.bank 0
.slot 2
.org $0781
.section "Cutscene 3 load text" overwrite

	ld de, $1100
	ld b, $F1
	ld a, $0D
	ld ($E002), a
	ld ($7800), a
	ld hl, Cutscene3
	call LoadText
	.ds 22, $00
	ret

.ends

.bank 0
.slot 2
.org $0609
.section "Cutscene 4 load text" overwrite

	ld de, $1100
	ld b, $F1
	ld a, $0D
	ld ($E002), a
	ld ($7800), a
	ld hl, Cutscene4
	call LoadText
	.ds 11, $00

.ends

.bank 0
.slot 2
.org $06E1
.section "Cutscene 5 load text" overwrite

	ld de, $1100
	ld b, $F1
	ld a, $0D
	ld ($E002), a
	ld ($7800), a
	ld hl, Cutscene5
	call LoadText
	.ds 11, $00

.ends

.bank 0
.slot 2
.org $0723
.section "Cutscene 6 load text" overwrite

	ld de, $1100
	ld b, $F1
	ld a, $0D
	ld ($E002), a
	ld ($7800), a
	ld hl, Cutscene6
	call LoadText
    .ds 22, $00

.ends

.bank 2
.slot 4
.org $1A45
.section "Cutscene 7 load text" overwrite

    .dw Cutscene7

.ends

.bank 0
.slot 2
.org $0811
.section "Bad ending load text" overwrite

    ld hl, BadEnd
    ld de, $1000
    ld b, $F0
    call LoadText
    ld hl, $1A44
    ld b, $19

.ends

.bank 0
.slot 2
.org $07B0
.section "Good ending load text" overwrite

    ld hl, GoodEnd
    ld de, $1000
    ld b, $F0
    call LoadText
    ld hl, $1A47
    ld b, $13

.ends

.bank 2
.slot 4
.org $05E9
.section "Telenet text" overwrite

Telenet:    text "Presented by Telenet\END"

.ends

.bank 2
.slot 4
.org $0D8D 
.section "Password Error" overwrite

Error:      text "Password Error\END"

.ends

.bank 2
.slot 4
.org $1D60
.section "Exit Salesman text" overwrite

Exit:       text "Exit\END"

.ends

.bank 2
.slot 4
.org $084A
.section "Load Password Screen text" overwrite

	ld b, $80
	ld hl, Password
	ld a, $0D
	ld ($E002), a
	ld ($7800), a
	ld de, $0080
	call LoadText

.ends

.bank 2
.slot 4
.org $087D
.section "Load Password Screen" overwrite

	ld b, $F0
	ld a, $0D
	ld ($E002), a
	ld ($7800), a
	ld hl, PasswordScreen
	ld de, $1188
	call LoadText

.ends

.bank 2
.slot 4
.org $08A4
.section "Done text" overwrite

	ld b, $B0
	ld a, $04
	ld ($E002), a
	ld ($7800), a
	ld hl, Done
	ld de, $1388
	call LoadText

.ends

.bank 2
.slot 4
.org $1080
.section "Text routine" overwrite

LoadText:

	ld a, ($E002)
	push af
	ld a, :LABEL5080
	ld ($E002), a
	ld ($7800), a
	call LABEL5080
	ld b, a
	pop af
	ld ($E002), a
	ld ($7800), a
	ld a, b
	ret
	
.ends

.bank 2
.slot 4
.org $19CC
.section "Center Text" overwrite

CenterText:

	ld a, ($E002)
	push af
	ld a, :LABEL59CC
	ld ($E002), a
	ld ($7800), a
	call LABEL59CC
	ld b, a
	pop af
	ld ($E002), a
	ld ($7800), a
	ld a, b
	ret
	
.ends

.bank 14
.slot 4
.org $1C51
.section "HHC Text" overwrite

HHCText:

	ld a, ($E002)
	push af
	ld a, :LABEL1DC51
	ld ($E002), a
	ld ($7800), a
	call LABEL1DC51
	ld b, a
	pop af
	ld ($E002), a
	ld ($7800), a
	ld a, b
	ret
	
.ends

.bank 1
.slot 3
.org $1492
.section "Combat Log Text load" overwrite

CombatLogText:
	ld a, ($E002)
	push af
	ld a, :LABEL3492
	ld ($E002), a
	ld ($7800), a
	call LABEL3492
	ld b, a
	pop af
	ld ($E002), a
	ld ($7800), a
	ld a, b
	ret
	
.ends

.bank 4
.slot 6
.org $1E50
.section "Title 1 Image" overwrite

    .INCBIN	"title1.bin" READ 256

.ends

.bank 12
.slot 5
.org $0A80
.section "Title 2 Image" overwrite

    .INCBIN	"title2.bin" READ 1176
    
.ends

.bank 3
.slot 5
.org $14A0
.section "Title 3 Image" overwrite

    .INCBIN	"title3.bin" READ 158

.ends

.bank 6
.slot 6
.org $1F00
.section "Title 4 Image" overwrite

    .INCBIN	"title4.bin" READ 128

.ends

.bank 2
.slot 4
.org $1ABB
.section "Load Salesman Text" overwrite

    ld hl, Salesman
    ld b, $70
    ld de, $1008
    call LoadText

.ends

.bank 2
.slot 4
.org $191B
.section "Pointer load table" overwrite

	ld de, $10F0
	push de
	call CenterText

.ends

.bank 13
.slot 5
.org $151B
.section "Izanami Text Pointer table rewrite" overwrite

	.dw Izanami1, Izanami2, Izanami3, Izanami4, Izanami5, Izanami6, Izanami7, Izanami8
    .dw Izanami9, Izanami10, Izanami11, Izanami12, Izanami13, Izanami14, Izanami15, Izanami16

.ends

.bank 13
.slot 5
.org $1727
.section "Yumiko Text Pointer table rewrite" overwrite

    .dw Yumiko1, Yumiko2, Yumiko3, Yumiko4, Yumiko5, Yumiko6, Yumiko7, Yumiko8
    .dw Yumiko9, Yumiko10, Yumiko11, Yumiko12, Yumiko13, Yumiko14, Yumiko15, Yumiko16

.ends

.bank 1
.slot 3
.org $11C0
.section "Load World names" overwrite

    .dw MalkuthL, YesodL, HodL, NetzachL, TipheresL, GeburahL, ChesedL, BinahL, ChokmahL, KetherL, DaathL

.ends

.bank 1
.slot 3
.org $11D6
.section "Light World names" overwrite

    MalkuthL:   text "MALKHUT\END"
    YesodL:     text "YESOD\END"
    HodL:       text "HOD\END"
    NetzachL:   text "NETZACH\END"
    TipheresL:  text "TIFERET\END"
    GeburahL:   text "GEVURAH\END"
    ChesedL:    text "CHESED\END"
    BinahL:     text "BINAH\END"
    ChokmahL:   text "CHOKMAH\END"
    KetherL:    text "KETER\END"
    DaathL:     text "DA'AT\END"

.ends

.bank 13
.slot 5
.org $14B6
.section "Load HHC World names" overwrite

    .dw $FFFF, MalkuthH, YesodH, HodH, NetzachH, TipheresH, GeburahH, ChesedH, BinahH, ChokmahH, KetherH, DaathH

.ends

.bank 14
.slot 2
.org $17CB
.section "Load HHC Text" overwrite

	ld b, $F0
	ld hl, Files
	ld de, $00B0
	call HHCText
	call $9BBF
	xor a
	ld ($D6FD), a
	ld b, $80
	ld hl, Goto
	ld de, $01F0
	call HHCText
	ld a, ($D28A)
	or a
	jr nz, LABEL1D7FC
	ld b, $E8
	ld hl, NoComp
	ld de, $0330
	call HHCText
    jp $94D7
LABEL1D7FC:	
	ld a, ($D7A4)
	or a
	jr nz, LABEL1D81F
	ld a, ($D280)
	or a
	jr nz, LABEL1D816
	ld b, $E8
	ld hl, NoBat
	ld de, $0330
	call HHCText
    jp $94D7
LABEL1D816:	
	dec a
	ld ($D280), a
	ld a, $10
	ld ($D7A4), a
LABEL1D81F:	
	ld b, $70
	ld hl, NextSpr
	ld de, $0330
	call HHCText
	ld b, $70
	ld hl, ItemList
	ld de, $0810
	call HHCText
	ld b, $70
	ld hl, SprsMap
	ld de, $0950
	call HHCText
	ld b, $70
	ld hl, Pass
	ld de, $0A90
	call HHCText

.ends

.bank 14
.slot 2
.org $19DF
.section "Map text" overwrite 

MapText:    text "From    to   \END"

.ends

.bank 14
.slot 2
.org $1BBF
.section "Battery Text" overwrite

	ld b, $70
	ld hl, Battery
	ld de, $1298
	call HHCText

.ends

.bank 14
.slot 2
.org $15D3
.section "HHC Password Text" overwrite

	ld b, $70
	ld hl, Pass
	ld de, $02A0
	call HHCText

.ends

.bank 14
.slot 2
.org $1615
.section "Go to next SPR (No Map)" overwrite

	ld b, $70
	ld hl, NextSpr
	ld de, $0160
	call HHCText
	ld a, ($D291)
	or a
	.db $20 $0E
	ld b, $E8
	ld hl, NoMap
	ld de, $03E0
	call HHCText

.ends

.bank 14
.slot 2
.org $1AAA
.section "Item List text" overwrite
	
    ld b, $70
	ld hl, ItemList
	ld de, $00C8
	call HHCText

.ends

.bank 14
.slot 2
.org $195D
.section "Map Title Text" overwrite

	ld b, $70
	ld hl, SprsMap
	ld de, $00C0
	call HHCText

.ends

.bank 0
.slot 2
.org $11B8
.section "Load Potion Text 1" overwrite

	ld de, Potion
	call CombatLogText

.ends

.bank 0
.slot 2
.org $11CF
.section "Load Potion Text 2" overwrite

	ld de, Potion
	call CombatLogText

.ends

.bank 0
.slot 2
.org $11F9
.section "Load Potion Text 3" overwrite

	ld de, Potion
	call CombatLogText

.ends

.bank 0
.slot 2
.org $128A
.section "Load Key Text 1" overwrite

	ld de, Key
	call CombatLogText

.ends

.bank 0
.slot 2
.org $133A
.section "Load Key Text 2" overwrite

	ld de, Key
	call CombatLogText

.ends

.bank 0
.slot 2
.org $1212
.section "Load Item Text 1" overwrite

	ld de, Item
	call CombatLogText

.ends

.bank 0
.slot 2
.org $1244
.section "Load Item Text 2" overwrite

	ld de, Item
	call CombatLogText

.ends

.bank 0
.slot 2
.org $1325
.section "Load Item Text 3" overwrite

	ld de, Item
	call CombatLogText

.ends

.bank 0
.slot 2
.org $1353
.section "Load Item Text 4" overwrite

	ld de, Item
	call CombatLogText

.ends

.bank 0
.slot 2
.org $1373
.section "Load Item Text 5" overwrite

	ld de, Item
	call CombatLogText

.ends

.bank 0
.slot 2
.org $13BD
.section "Load Item Text 6" overwrite

	ld de, Item
	call CombatLogText

.ends

.bank 0
.slot 2
.org $13DD
.section "Load Item Text 7" overwrite

	ld de, Item
	call CombatLogText

.ends

.bank 0
.slot 2
.org $1399
.section "Load Item Text 8" overwrite

	ld de, Item
	call CombatLogText

.ends

.bank 0
.slot 2
.org $13F6
.section "Load Item Text 9" overwrite

	ld de, Item
	call CombatLogText

.ends

.bank 0
.slot 2
.org $141B
.section "Load Item Text 10" overwrite

	ld de, Item
	call CombatLogText

.ends

.bank 1
.slot 3
.org $02CC
.section "Load Spotted Text" overwrite

	ld de, Spotted
	call CombatLogText

.ends

.bank 1
.slot 3
.org $067B
.section "Load Damage Text 1" overwrite

	ld de, Damage
	call CombatLogText

.ends

.bank 1
.slot 3
.org $1C38
.section "Load Damage Text 2" overwrite

	ld de, Damage
	call CombatLogText

.ends

.bank 1
.slot 3
.org $1CAA
.section "Load Damage Text 3" overwrite

	ld de, Damage
    call CombatLogText

.ends

.bank 16
.slot 5
.org $0000
.section "Password Screen" overwrite

    Password:           text "Password\END"
    PasswordScreen:    .db $F4 $20 $F5 $20 $F6 $20 $20 $20 $F7 $FF
    .db $91 $92 $93 $94 $95 $00 $EA $EB $EC $ED $EE $96 $97 $98 $99 $9A $00 $EF $F0 $F1 $F2 $F3 $9B $9C $9D $9E $9F $00 $F7 $F8 $F9 $FA $FB $E0 $E1 $E2 $E3 $E4 $00 $F4 $F5 $F6 $00 $FE $E5 $E6 $E7 $E8 $E9 $00 $FF

.ends

.section "HHC Menu Text" overwrite

    Files: text "PROGRAMS\END"
    Goto: text "GOTO_NEXT_SPR\END"
    NoComp: text "NO COMPUTER\END"
    NextSpr: text "MAP_NEXT_SPR\END"
    ItemList: text "LIST_ITEMS\END"
    SprsMap: text "MAP_ALL_SPRS\END"
    Pass: text "GET_PASSWORD\END"
    NoMap: text "MAP NOT FOUND\END"
    NoBat: text "BATTERY LOW\END"
    Battery: text "BATTERY LEVEL\END"

.ends

.section "HHC World names" overwrite

    MalkuthH:   text "MALKHUT\END"
    YesodH:     text "YESOD\END"
    HodH:       text "HOD\END"
    NetzachH:   text "NETZACH\END"
    TipheresH:  text "TIFERET\END"
    GeburahH:   text "GEVURAH\END"
    ChesedH:    text "CHESED\END"
    BinahH:     text "BINAH\END"
    ChokmahH:   text "CHOKMAH\END"
    KetherH:    text "KETER\END"
    DaathH:     text "DA'AT\END"

.ends

.section "Cutscene 1 text" overwrite

Cutscene1:

	text " \"Hinokagutsuchi!\" The power of "
    text " the divine sword received from "
    text "  Izanami tears apart demonic   "
    text "             force.\END"

.ends

.section "Cutscene 2 text" overwrite

Cutscene2:

    text "You think that Master Loki could"
    text "be defeated by the likes of you?"
    text "      You and Yumiko will       "
    text "         be demon food!\END"

.ends

.section "Cutscene 3 text" overwrite

Cutscene3:

    text " To cross the world connecting  "
    text " the good and evil of the Demon "
    text "  World, you will require the   "
    text "    power of a demon-beast.     "
    text "         Run, Cerberus!\END"

.ends

.section "Cutscene 4 text" overwrite

Cutscene4:

    text " The Demon World's assaults are "
    text " endless! Will Nakajima be able " 
    text "        to save Yumiko?\END"

.ends


.section "Cutscene 5 text" overwrite

Cutscene5:

    text "   \"Akemi, I'm entrusting my    "
    text "     message to this doll.\"\END"

.ends

.section "Cutscene 6 text" overwrite

Cutscene6:

    text " \"Impressive, to end up all the "
    text " way here, but your life shall  "
    text "       end here as well.\"       "
    text "   The Demon Lord Set's voice   "
    text "    echoes in the darkness.\END"    

.ends

.section "Cutscene 7 text" overwrite

Cutscene7:

    text "Thank you for\n"
    text "saving me, Akemi.\n"
    text "Here, Set was\n"
    text "keeping this\n"
    text "key safe.\END"

.ends

.section "Izanami 1 text" overwrite
	
Izanami1:

	text "Quickly, find your\n"
    text "servant Cerberus.\END"

.ends

.section "Izanami 2 text" overwrite

Izanami2:

	text "There is no\n"
    text "going back,\n"
    text "once you set foot\n"
    text "in the Demon World.\END"

.ends

.section "Izanami 3 text" overwrite

Izanami3:

	text "As the moon waxes,\n"
    text "a \"demon\" starts\n"
    text "to move.\END"

.ends

.section "Izanami 4 text" overwrite

Izanami4:

	text "The greedy wants to\n"
    text "devour the poor.\END"


.ends

.section "Izanami 5 text" overwrite

Izanami5:

	text "The good and evil of\n"
    text "the Demon World are\n"
    text "at balance within\n"
    text "a dark world.\END"
	
.ends

.section "Izanami 6 text" overwrite
	
Izanami6:

	text "Treat Cerberus well.\n" 
    text "He has sworn to you\n"
    text "eternal loyalty.\END"

.ends

.section "Izanami 7 text" overwrite

Izanami7:

    text "Take Yumiko and come\n"
    text "see me quickly...\END"

.ends

.section "Izanami 8 text" overwrite

Izanami8:

    text "Shikome is\n"
    text "enthralled by\n"
    text "the serene smell.\END"

.ends

.section "Izanami 9 text" overwrite

Izanami9:

    text "The flowing sand\n"
    text "fills the demonic\n"
    text "hourglass.\END"

.ends

.section "Izanami 10 text" overwrite

Izanami10:

    text "May your life shine\n"
    text "when you wish upon\n"
    text "the Philosopher's\n"
    text "Stone...\END"

.ends

.section "Izanami 11 text" overwrite

Izanami11:

    text "Within darkness,\n"
    text "good and evil\n"
    text "become the sides\n"
    text "of a mirror.\END"

.ends

.section "Izanami 12 text" overwrite

Izanami12:

    text "You may enter the\n"
    text "dark mage's garden\n"
    text "with a holy\n"
    text "talisman.\END"

.ends

.section "Izanami 13 text" overwrite

Izanami13:

    text "The lion-demon\n"
    text "eats the bones as\n"
    text "it bids its time.\END"

.ends

.section "Izanami 14 text" overwrite

Izanami14:

    text "A four-legged beast\n"
    text "runs through the\n"
    text "frozen darkness\n"
    text "not unlike a\n"
    text "strong gale.\END"

.ends

.section "Izanami 15 text" overwrite

Izanami15:

    text "In the farthest\n"
    text "place, by the\n"
    text "great gate, I await.\END"


.ends

.section "Izanami 16 text" overwrite

Izanami16:

    text "Yomotsu-Shikome is\n"
    text "my servant, and she\n"
    text "can be protective\n"
    text "to a fault.\END"

.ends

.section "Yumiko 1 text" overwrite

Yumiko1:

    text "\"This world lies on\n" 
    text "the Demon World's\n" 
    text "obverse. I'm-\"\END"

.ends

.section "Yumiko 2 text" overwrite

Yumiko2:

    text "\"Akemi, you won't\n"
    text "abandon me like you\n"
    text "did to Izanami,\n"
    text "will you?\"\END"

.ends

.section "Yumiko 3 text" overwrite

Yumiko3:

    text "\"Izanami wants me,\n" 
    text "to be reunited with\n"
    text "Izanagi's\n"
    text "reincarnation--you.\"\\END" 

.ends

.section "Yumiko 4 text" overwrite

Yumiko4:

    text "\"Don't let your\n"
    text "guard down!\n"
    text "Ms. Ohara is being\n" 
    text "controlled by\n"
    text "Loki's magic!\"\END"

.ends

.section "Yumiko 5 text" overwrite

Yumiko5:

    text "\"Poor Ms. Ohara,\n"
    text "she's in love with\n"
    text "Loki. Akemi, please\n"
    text "help her...\"\END"

.ends

.section "Yumiko 6 text" overwrite

Yumiko6:

    text "\"If you defeat Loki,\n"
    text "she's sure to get\n"
    text "angry and\n"
    text "attack you.\"\END"

.ends

.section "Yumiko 7 text" overwrite

Yumiko7:

    text "\"Hidden things are\n" 
    text "revealed by\n"
    text "the moonlight.\"\END"

.ends

.section "Yumiko 8 text" overwrite

Yumiko8:

    text "\"A wandering soul\n" 
    text "is in possession\n"
    text "of a shining stone.\"\END"

.ends

.section "Yumiko 9 text" overwrite

Yumiko9:

    text "\"In the future,\n"
    text "where the Demon\n"
    text "Lords lie\n"
    text "vanquished, the\n"
    text "Sun's shield\n"
    text "shines brightly.\"\END"

.ends

.section "Yumiko 10 text" overwrite

Yumiko10:

    text "\"It hurts so much...\n"
    text "Akemi, I think\n"
    text "I'm done for...\"\END"

.ends

.section "Yumiko 11 text" overwrite

Yumiko11:

    text "\"I don't know where\n"
    text "I am... but the\n"
    text "place I'm trapped in\n" 
    text "is dark and warm.\"\END"

.ends

.section "Yumiko 12 text" overwrite

Yumiko12:

    text "\"Akemi, help!\n"
    text "Loki...\n"
    text "right here...\"\END"

.ends

.section "Yumiko 13 text" overwrite

Yumiko13:

    text "\"You must seal the\n"
    text "magic that grants\n"
    text "Loki's immortality\"\END"

.ends

.section "Yumiko 14 text" overwrite

Yumiko14:

    text "\"Flowing silver will\n"
    text "make the deluded\n"
    text "woman come back\n"
    text "to her senses.\"\END"

.ends

.section "Yumiko 15 text" overwrite

Yumiko15:

    text "\"I am... by a\n"
    text "power... even\n"
    text "stronger than\n"
    text "Loki's...\"\END"

.ends

.section "Yumiko 16 text" overwrite

Yumiko16:

    text "\"An ancient item\n" 
    text "will seal the\n"
    text "Demon Lord's power.\"\END"

.ends

.section "Salesman text" overwrite

Salesman:   text "\"Buying anything?\"\END"

.ends

.section "Bad Ending text" overwrite

BadEnd:     text "Yumiko turned into dust.\END"

.ends

.section "Good Ending text" overwrite

GoodEnd:    text "The fight is over.\END"

.ends

.section "Start/Continue/Done" overwrite

Start:	    text "Start\END"
Continue:	text "Continue\END"
Done:   	text "Done\END"
	
.ends

.section "Combat Log" overwrite

Spotted:    text "SPOTTED \END"
Damage:     text "DAMAGED\END"
Potion:     text "POTION  USED\END"
Item:       text "ITEM    USED\END"
Key:        text "KEY USED\END"

.ends

.section "Combat Log Text Graphics" overwrite

CombatLogTextGFX:   .INCBIN "title5.bin" READ 240

.ends

.section "New Writing routine" overwrite

LABEL5080:
	ld a, (hl)
	cp $FE
	ret nc
	ld c, $00
	cp $5B
	jr c, LABEL508C
	ld c, $01
LABEL508C:
	inc hl
	push bc
	push hl
	push de
	call LABEL509D
	pop de
	ld hl, $0008
	add hl, de
	ex de, hl
	pop hl
	pop bc
	jr LABEL5080
LABEL509D:
	push de
	push bc
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, $1BBF
	add hl, de
	ld b, $08
	ld de, $D62B
LABEL50AE:
	ld a, (hl)
	inc hl
	ld (de), a
	inc de
	djnz LABEL50AE
	pop bc
	push bc
	ld a, c
	or a
	jr nz, LABEL50C7
	ld b, $08
	ld hl, $D62B
LABEL50BF:
	ld a, (hl)
	srl a
	or (hl)
	ld (hl), a
	inc hl
	djnz LABEL50BF
LABEL50C7:
	pop bc
	pop de
	push bc
	push de
	ld hl, $D62B
	ld bc, $0008
	call $005C
	pop de
	pop bc
	ld a, b
	cp $FF
	ret z
	ld bc, $2000
	add hl, bc
	ld bc, $0008
	call $0056
	ret
	
.ends

.section "Newline and Center" overwrite

LABEL59CC:
	push hl
	ld c, $00
LABEL59CF:
	ld a, (hl)
	cp $FE
	jr nc, LABEL59D8
	inc c
	inc hl
	jr LABEL59CF
LABEL59D8:
	srl c
	ld a, c
	add a, a
	add a, a
	add a, a
	ld c, a
	ld b, $00
	ex de, hl
	and a
	sbc hl, bc
	ex de, hl
	pop hl
	ret

.ends

.section "Print HHC Text" overwrite

LABEL1DC51:	
	ld a, (hl)
	cp $FE
	ret nc
	ld c, $00
	cp $5B
	jr c, LABEL1DC5D
	ld c, $01
LABEL1DC5D:	
	inc hl
	push bc
	push hl
	push de
	call LABEL1DC6E
	pop de
	ld hl, $0008
	add hl, de
	ex de, hl
	pop hl
	pop bc
	jr LABEL1DC51
LABEL1DC6E:	
	push de
	push bc
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, $1BBF
	add hl, de
	ld b, $08
	ld de, $D62B
LABEL1DC7F:	
	ld a, (hl)
	inc hl
	ld (de), a
	inc de
	djnz LABEL1DC7F
	pop bc
	push bc
	ld a, c
	or a
	jr nz, LABEL1DC98
	ld b, $08
	ld hl, $D62B
LABEL1DC90:	
	ld a, (hl)
	srl a
	or (hl)
	ld (hl), a
	inc hl
	djnz LABEL1DC90
LABEL1DC98:	
	pop bc
	pop de
	push bc
	push de
	ld hl, $D62B
	ld bc, $0008
	call $005C
	pop de
	pop bc
	ld a, b
	cp $FF
	ret z
	ld bc, $2000
	add hl, bc
	ld bc, $0008
	call $0056
	ret

.ends

.section "New Combat Log text" overwrite

LABEL3492:
	push de
	call LABEL350B
	pop de
    ld b, $08
LABEL34A1:
    ld a, (de)
    cp $FF
    ret z
    cp $FE
    ret z
    push de
    push bc
    sub $20
    srl a
    ld c, $0F
    jr c, LABEL34B4
    ld c, $F0
LABEL34B4:
    add a, a
    add a, a
    add a, a
    ld e, a
    ld d, $00
    ld hl, CombatLogTextGFX
    add hl, de
    ld b, $08
    ld de, $D623
LABEL34C3:
    ld a, (hl)
    and c
    ld (de), a
    inc hl
    inc de
    djnz LABEL34C3
    ld a, c
    and $01
    ld e, a
    pop bc
    push bc
    inc b
    ld a, b
    and $01
    xor e
    jr nz, LABEL34E7
    ld hl, $D623
    ld b, $08
LABEL34DC:
    rrc (hl)
    rrc (hl)
    rrc (hl)
    rrc (hl)
    inc hl
    djnz LABEL34DC
LABEL34E7:
    ld b, $08
    ld hl, ($D2A4)
    ld de, $D623
LABEL34EF:
    call $004A
    ld c, a
    ld a, (de)
    or c
    call $004D
    inc de
    inc hl
    djnz LABEL34EF
    pop bc
    bit 0, b
    jr z, LABEL3504
    ld ($D2A4), hl
LABEL3504:
    pop de
    inc de
    djnz LABEL34A1
    jp LABEL3492

LABEL350B:
	ld a, ($D2A3)
	add a, $04
	cp $C2
	jr c, LABEL3516
	ld a, $AE
LABEL3516:
	ld hl, $1921
	ld de, $001C
	ld c, $05
LABEL351E:
	ld b, $04
LABEL3520:
	call $004D
	inc hl
	inc a
	djnz LABEL3520
	cp $C2
	jr c, LABEL352D
	ld a, $AE
LABEL352D:
	add hl, de
	dec c
	jr nz, LABEL351E
	ld a, ($D2A3)
	ld l, a
	ld h, $00
	add hl, hl
	add hl, hl
	add hl, hl
	ld bc, $0800
	add hl, bc
	ld ($D2A4), hl
	ld bc, $0020
	xor a
	call $0056
	ld a, ($D2A3)
	add a, $04
	cp $C2
	jr c, LABEL3553
	ld a, $AE
LABEL3553:
	ld ($D2A3), a
	ret

.ends
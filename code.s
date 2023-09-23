.memorymap
    defaultslot 0

    slotsize $2000
    slot 0 $0000
    slot 1 $2000
    slot 2 $4000
    slot 3 $6000
    slot 4 $8000
    slot 5 $a000
    slot 6 $c000
    slot 7 $e000
.endme

.rombanksize $2000
.rombanks 32

.stringmaptable mainFontMap "DDSMT.tbl"

.macro text
    .stringmap mainFontMap, \1
.endm

;text "                    "

.background "Digital Devil Story.rom"

.incdir ""

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
	call LOADTEXT
	.ds 11, $00
	ret

.ends

.bank 0
.slot 2
.org $04D8
.section "Cutscene 2 load text" overwrite

	ld de, $1108
	ld b, $F1
	ld a, $0D
	ld ($E002), a
	ld ($7800), a
	ld hl, Cutscene2
	call LOADTEXT
	.ds 11, $00
	ret

.ends

.bank 0
.slot 2
.org $0781
.section "Cutscene 3 load text" overwrite

	ld de, $1108
	ld b, $F1
	ld a, $0D
	ld ($E002), a
	ld ($7800), a
	ld hl, Cutscene3
	call LOADTEXT
	.ds 22, $00
	ret

.ends

.bank 0
.slot 2
.org $0609
.section "Cutscene 4 load text" overwrite

	ld de, $1120
	ld b, $F1
	ld a, $0D
	ld ($E002), a
	ld ($7800), a
	ld hl, Cutscene4
	call LOADTEXT
	.ds 11, $00
    ld hl, $2920
    ld a, $88
    call $004D
	ret

.ends

.bank 0
.slot 2
.org $06E1
.section "Cutscene 5 load text" overwrite

	ld de, $1130
	ld b, $F1
	ld a, $0D
	ld ($E002), a
	ld ($7800), a
	ld hl, Cutscene5
	call LOADTEXT
	.ds 11, $00
    ld hl, $0000
	ld ($D414), hl
	ld a, $08
	ld ($D6AC), a
	ld a, $01
	ld ($D6FE), a
	ret

.ends

.bank 0
.slot 2
.org $07B0
.section "End Screen load text" overwrite

    ld hl, End
    ld de, $1000
    ld b, $F0
    call LOADTEXT

.ends

.bank 1
.slot 3
.org $06B9
.section "Combat Log" overwrite

COMBAT:	

	text "SPOTTED\END"
    .db $00
    text "DAMAGE\END"

.ends

.bank 2
.slot 4
.orga $9080
.section "Text routine" overwrite

LOADTEXT:

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
.orga $99CC
.section "Center Text" overwrite

CENTERTEXT:

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

.bank 4
.slot 6
.orga $DE50
.section "Title 1 Image" overwrite

    .INCBIN	"title1.bin" READ 256

.ends

.bank 12
.slot 5
.org $A80
.section "Title 2 Image" overwrite

    .INCBIN	"title2.bin" READ 1136
    
.ends

.bank 2
.slot 4
.orga $9ABB
.section "Salesman Text" overwrite

    ld hl, Salesman
    ld b, $70
    ld de, $1020
    call LOADTEXT

.ends

.bank 2
.slot 4
.org $191B
.section "Pointer load table" overwrite

	ld de, $10F0
	push de
	call CENTERTEXT
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
.org $11D6
.section "Light World names" overwrite

    text "MALKUTH\END"
    text "YESOD\END"
    text "HOD\END"
    text "NETZACH\END"
    text "TIPHERETH\END"
    text "GEBURAH\END"
    text "CHESED\END"
    text "BINAH\END"
    text "CHOKMAH\END"
    text "KETHER\END"
    text "DAAT\END"


.ends

.bank 13
.slot 0
.orga $14CE
.section "Dark World names" overwrite

    text "MALKUTH\END"
    text "YESOD\END"
    text "HOD\END"
    text "NETZACH\END"
    text "TIPHERETH\END"
    text "GEBURAH\END"
    text "CHESED\END"
    text "BINAH\END"
    text "CHOKMAH\END"
    text "KETHER\END"
    text "DAAT\END"

.ends

.bank 16
.slot 5
.orga $ABFD
.section "Salesman text" overwrite

Salesman:

    text "\"Want to buy something?\"\END"

.ends

.bank 16
.slot 5
.orga $B18A
.section "Password Screen" overwrite

Password:

	.db $01 $00 $05 $01 $04 $01 $03 $01 $02 $01 $01 $01 $01 $02 $01 $03 $01 $04 $01 $05
	text "PASSWORD\END"
	.db $F4 $20 $F5 $20 $F6 $20 $20 $20 $F7 $FF
.db $91 $92 $93 $94 $95 $00 $EA $EB $EC $ED $EE $96 $97 $98 $99 $9A $00 $EF $F0 $F1 $F2 $F3 $9B $9C $9D $9E $9F $00 $F7 $F8 $F9 $FA $FB $E0 $E1 $E2 $E3 $E4 $00 $F4 $F5 $F6 $00 $FE $E5 $E6 $E7 $E8 $E9 $00 $FF $00 $00 $00 $00

.ends

.section "Cutscene 1 text" overwrite

Cutscene1:

	text "\"Hinokagutsuchi!\" The power of the divine sword received from Izanami tears apart demonic force.\END"

.ends

.section "Cutscene 2 text" overwrite

Cutscene2:

    text "Master Loki has been defeated by the likes of you? You and Yumiko will be demon food!\END"

.ends

.section "Cutscene 3 text" overwrite

Cutscene3:

    text "To cross the world connecting the good and evil of the Demon World, you will require the power of a demon-beast. Run, Cerberus!\END"

.ends

.section "Cutscene 4 text" overwrite

Cutscene4:

    text "The Demon World's assaults are ceaseless! Will Nakajima be able to save Yumiko?\END"

.ends


.section "Cutscene 5 text" overwrite

Cutscene5:

    text "\"Akemi, I'm entrusting my message to this doll.\"\END"

.ends

.section "Cutscene 6 text" overwrite

Cutscene6:

    text "\"Impressive, to end up all the way here, but your life shall end here as well.\" The Demon Lord Set's voice echoes in the darkness.\END"

.ends

.section "Izanami 1 text" overwrite
	
Izanami1:

	text "Quickly, find your\\n"
    text "servant Cerberus.\END"

.ends

.section "Izanami 2 text" overwrite

Izanami2:

	text "There is no\\n"
    text "going back,\\n"
    text "once you set foot\\n"
    text "in the Demon World.\END"

.ends

.section "Izanami 3 text" overwrite

Izanami3:

	text "As the moon waxes,\\n"
    text "a \"demon\" starts\\n"
    text "to move.\END"

.ends

.section "Izanami 4 text" overwrite

Izanami4:

	text "The greedy wants to\\n"
    text "devour the poor.\END"


.ends

.section "Izanami 5 text" overwrite

Izanami5:

	text "The good and evil of\\n"
    text "the Demon World are\\n"
    text "at balance within\\n"
    text "a dark world.\END"
	
.ends

.section "Izanami 6 text" overwrite
	
Izanami6:

	text "Treat Cerberus well.\\n" 
    text "He has sworn to you\\n"
    text "eternal loyalty.\END"

.ends

.section "Izanami 7 text" overwrite

Izanami7:

    text "Take Yumiko and come\\n"
    text "see me quickly...\END"

.ends

.section "Izanami 8 text" overwrite

Izanami8:

    text "Shikome is\\n"
    text "enthralled by\\n"
    text "the serene smell.\END"

.ends

.section "Izanami 9 text" overwrite

Izanami9:

    text "The flowing sand\\n"
    text "fills the demonic\\n"
    text "hourglass.\END"

.ends

.section "Izanami 10 text" overwrite

Izanami10:

    text "May your life shine\\n"
    text "when you wish upon\\n"
    text "the Philosopher's\\n"
    text "Stone...\END"

.ends

.section "Izanami 11 text" overwrite

Izanami11:

    text "Within darkness,\\n"
    text "good and evil\\n"
    text "become the sides\\n"
    text "of a mirror.\END"


.ends

.section "Izanami 12 text" overwrite

Izanami12:

    text "You may enter the\\n"
    text "dark mage's garden\\n"
    text "with a holy\\n"
    text "talisman.\END"


.ends

.section "Izanami 13 text" overwrite

Izanami13:

    text "The lion-demon\\n"
    text "eats the bones as\\n"
    text "it bids its time.\END"

.ends

.section "Izanami 14 text" overwrite

Izanami14:

    text "A four-legged beast\\n"
    text "runs through the\\n"
    text "frozen darkness\\n"
    text "not unlike a\\n"
    text "strong gale.\END"

.ends

.section "Izanami 15 text" overwrite

Izanami15:

    text "In the farthest\\n"
    text "place, by the\\n"
    text "great gate, I await.\END"


.ends

.section "Izanami 16 text" overwrite

Izanami16:

    text "Yomotsu-Shikome is\\n"
    text "my servant, and she\\n"
    text "can be protective\\n"
    text "to a fault.\END"

.ends

.section "Yumiko 1 text" overwrite

Yumiko1:

    text "\"This world lies on\\n" 
    text "the Demon World's\\n" 
    text "obverse. I'm-\"\END"

.ends

.section "Yumiko 2 text" overwrite

Yumiko2:

    text "\"Akemi, you won't\\n"
    text "abandon me like you\\n"
    text "did to Izanami,\\n"
    text "will you?\"\END"

.ends

.section "Yumiko 3 text" overwrite

Yumiko3:

    text "\"Izanami wants me,\\n" 
    text "to be reunited with\\n"
    text "Izanagi's\\n"
    text "reincarnation --" 
    text "you.\"\END"


.ends

.section "Yumiko 4 text" overwrite

Yumiko4:

    text "\"Don't let your\\n"
    text "guard down!\\n"
    text "Ms. Ohara is being\\n" 
    text "controlled by\\n"
    text "Loki's magic!\"\END"

.ends

.section "Yumiko 5 text" overwrite

Yumiko5:

    text "\"Poor Ms. Ohara,\\n"
    text "she's in love with\\n"
    text "Loki. Akemi, please\\n"
    text "help her...\"\END"

.ends

.section "Yumiko 6 text" overwrite

Yumiko6:

    text "\"If you defeat Loki,\\n"
    text "she's sure to get\\n"
    text "angry and\\n"
    text "attack you.\"\END"

.ends

.section "Yumiko 7 text" overwrite

Yumiko7:

    text "\"Hidden things are\\n" 
    text "revealed by\\n"
    text "the moonlight.\"\END"

.ends

.section "Yumiko 8 text" overwrite

Yumiko8:

    text "\"A wandering soul\\n" 
    text "is in possession\\n"
    text "of a shining stone.\"\END"

.ends

.section "Yumiko 9 text" overwrite

Yumiko9:

    text "\"In the future,\\n"
    text "where the Demon\\n"
    text "Lords lie\\n"
    text "vanquished, the\\n"
    text "Sun's shield\\n"
    text "shines brightly.\"\END"

.ends

.section "Yumiko 10 text" overwrite

Yumiko10:

    text "\"It hurts so much...\\n"
    text "Akemi, I think\\n"
    text "I'm done for...\"\END"

.ends

.section "Yumiko 11 text" overwrite

Yumiko11:

    text "\"I don't know where\\n"
    text "I am... but the\\n"
    text "place I'm trapped in\\n" 
    text "is dark and warm.\"\END"

.ends

.section "Yumiko 12 text" overwrite

Yumiko12:

    text "\"Akemi, help!\\n"
    text "Loki...\\n"
    text "right here...\"\END"

.ends

.section "Yumiko 13 text" overwrite

Yumiko13:

    text "\"You must seal the\\n"
    text "magic that grants\\n"
    text "Loki's immortality\"\END"

.ends

.section "Yumiko 14 text" overwrite

Yumiko14:

    text "\"Flowing silver will\\n"
    text "make the deluded\\n"
    text "woman come back\\n"
    text "to her senses.\"\END"

.ends

.section "Yumiko 15 text" overwrite

Yumiko15:

    text "\"I am... by a\\n"
    text "power... even\\n"
    text "stronger than\\n"
    text "Loki's...\"\END"

.ends

.section "Yumiko 16 text" overwrite

Yumiko16:

    text "\"An ancient item\\n" 
    text "will seal the\\n"
    text "Demon Lord's power.\"\END"

.ends

.section "End Screen text" overwrite

End:

    text "The fight is over.\END"

.ends

.bank 16
.slot 5
.orga $BFEC
.section "Start/Continue/Done" overwrite

Menu:

	text "Start\END"
	text "Continue\END"
	text "Done\END"
	
.ends

.bank 16
.slot 5
.orga $A000
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
	call LABEL005C
	pop de
	pop bc
	ld a, b
	cp $FF
	ret z
	ld bc, $2000
	add hl, bc
	ld bc, $0008
	call LABEL0056
	ret
	
LABEL005C:
	ex de, hl
	call LABEL07DF
	ld a, (de)
	out ($98), a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, $F7
	ret
	
LABEL0056:
	push af
	call LABEL07DF
	pop af
	out ($98), a
	push af
	dec bc
	ld a, c
	or b
	jr nz, $F7
	pop af
	ret
	
LABEL07DF:
	ld a, l
	di
	out ($99), a
	ld a, h
	and $3F
	or $40
	out ($99), a
	ei
	ret
	
.ends

.bank 16
.slot 5
.orga $A100
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
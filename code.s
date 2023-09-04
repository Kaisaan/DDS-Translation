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

.bank 1
.slot 3
.org $6C2
.section "Combat Log" overwrite
	
	text "DAMAGE\END"
    text "SPOTTED\END"

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
.section "Text Pointer table rewrite" overwrite

	.dw Izanami1, Izanami2, Izanami3, Izanami4, Izanami5, Izanami6, Izanami7, Izanami8
    .dw Izanami9, Izanami10, Izanami11, Izanami12, Izanami13, Izanami14, Izanami15, Izanami16

.ends

.bank 13
.slot 0
.orga $14CE
.section "World text" overwrite

	text "TEST\END"

.ends

.bank 16
.slot 5
.orga $B000
.section "Cutscene 1 text" overwrite

Cutscene1:

	text "\"Hinokagutsuchi!\" The power of  the sword received from Izanami destroys the demon's power.\END"

.ends

.bank 16
.slot 5
.orga $ABFD
.section "Salesman text" overwrite

Salesman:

    text "Want to buy something?\END"

.ends

.bank 16
.slot 5
.orga $B6E7
.section "Izanami 1 text" overwrite
	
Izanami1:

	text "You should look for\\n"
	text "your companion\\n"
	text "Cerberus.\END"
	
.ends

.section "Izanami 2 text" overwrite

Izanami2:

	text "Once you set foot in\\n"
	text "the demon world,\\n"
	text "there's no going\\n"
	text "back.\END"
	
.ends

.section "Izanami 3 text" overwrite

Izanami3:

	text "When the moon\\n"
	text "is full, demons\\n"
	text "start moving\END"

.ends

.section "Izanami 4 text" overwrite

Izanami4:

	text "Those obssessed with\\n"
	text "money eat away\\n"
	text "at the poor.\END"

.ends

.section "Izanami 5 text" overwrite

Izanami5:

	text "The good and\\n"
	text "the evil of\\n"
	text "the demon world\\n"
	text "is kept in balance\\n"
	text "by the dark world.\END"
	
.ends

.section "Izanami 6 text" overwrite
	
Izanami6:

	text "Treat Cerberus well.\\n"
	text "It has sworn eternal\\n"
	text "loyalty to you.\END"

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

    text "When you wish upon\\n"
    text "the philosopher's\\n"
    text "stone, your wisdom\\n" 
    text "shall shine...\END"

.ends

.section "Izanami 11 text" overwrite

Izanami11:

    text "In the darkness,\\n"
    text "good and evil\\n"
    text "are separated in two\\n"
    text "sides of a mirror.\END"

.ends

.section "Izanami 12 text" overwrite

Izanami12:

    text "You may enter the\\n"
    text "dark mage's chamber\\n"
    text "with a\\n"
    text "holy talisman.\END"

.ends

.section "Izanami 13 text" overwrite

Izanami13:

    text "The demonic lion\\n"
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

    text "I'll be waiting by\\n"
    text "the gate of the\\n"
    text "farthest land.\END"

.ends

.section "Izanami 16 text" overwrite

Izanami16:

    text "Yomotsu is my\\n"
    text "servant, but do let\\n"
    text "your guard down\\n"
    text "lest you get hurt.\END"

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

.bank 16
.slot 5
.orga $BFEC
.section "Start/Continue" overwrite

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
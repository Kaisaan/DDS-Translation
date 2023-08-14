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


.background "Digital Devil Story.rom"

.bank 0
.slot 0
.orga $054D
.section "Cutscene 1 load text" overwrite

	ld de, $1100
	ld b, $F1
	ld a, $10
	ld ($E002), a
	ld ($7800), a
	ld hl, $A000
	call $9080
	ld de, $1328
	ld a, $0D
	ld ($E002), a
	ld ($7800), a
	ret

.ends

.bank 1
.slot 1
.orga $26C2
.section "Combat Log" overwrite
	
    text "DAMAGE"

.ends

.bank 16
.slot 0
.orga $0000
.section "Cutscene 1 text" overwrite

	.db $22					; It won't let me use "" characters within a string even with the table file
	text "Hinokagutsuchi!";
	.db $22
	text "\SThe\Spower\Sof\S\Sthe\Ssword\Sreceived\Sfrom\SIzanami\Sdestroys\Sthe\Sdemon's\Spower."
	.db $FF

.ends





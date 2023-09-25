# Password System Notes
Leina is much more experience with Z80 Assembly and is able to make better notes than I can.

# Password System 
Password Error will appear when:
1. when the last byte is not the right checksum value
2. when the bits in the 8d9c struct are set in the bits in the d7a8 struct
3. after the 8d9c struct check, if any values in the d7a8 struct are >= 2b
4. if the 5 bits that make d6ae are all 0 (as the levels are 1-indexed)
5. if d6ae becomes >= $15

# Password System Details
You can also do a vram watchpoint instead of searching ram. Doing either leads you to `_LABEL_4965_`
$d000 - number of letters inputted
$d7a8+ - the inputted string

This bit adds 1 to $d000 inputted
```
        ld a, ($D000)
        inc a
        cp $10
        jr z, _LABEL_499F_
        ld ($D000), a
```
Once all 16 characters are inputted, the password is checked at `_LABEL_499F_`, and you'll see a bunch of places where it could jump to `_LABEL_4A11_` to print a failure message
* in-place changes characters between $e0+ to $a0+, so all characters are in the $91-$bb range
* in-place subtracts $91 from them so they're in the $00-$2a range
```
        ld hl, _RAM_D7A8_
        ld b, $10
    _LABEL_49A4_:    
            ld a, (hl)
            cp $E0
            jr c, _LABEL_49AB_
            sub $40
    _LABEL_49AB_:    
            sub $91
            ld (hl), a
            inc hl
            djnz _LABEL_49A4_
```
* adds the 1st 14 characters values together
```
        ld hl, _RAM_D7A8_
        ld b, $0E
        xor a
    _LABEL_49B7_:    
            add a, (hl)
            inc hl
            djnz _LABEL_49B7_
```
* gets that value mod $2b, that value must be equal to the last of the 16 characters
```
    _LABEL_49BB_:    
            sub $2B
            jr nc, _LABEL_49BB_
        add a, $2B
        ld b, a

        ld a, ($D7B7)
        cp b
        jr nz, _LABEL_4A11_
```
* gets the 2nd last character value, gets its lower 3 bits, then doubles the value (so it's $00-$0e)
* for the 1st 14 characters, it subtracts the above value, looping from $00 to $2b if it's < 0
```
        ld a, ($D7B6)
        and $07
        add a, a
        ld e, a
        ld b, $0E
        ld hl, _RAM_D7A8_
    _LABEL_49D4_:    
            ld a, (hl)
            sub e
            jr nc, _LABEL_49DA_
            add a, $2B
    _LABEL_49DA_:    
            ld (hl), a
            inc hl
            djnz _LABEL_49D4_
```
* For the 1st 15 characters, it makes sure those $00-$2a values don't have certain bits set (by masking against `$C8 $C8 $C8 $C8 $E0 $E0 $E0 $D8 $E0 $D8 $E0 $E0 $E0 $F0 $E0` in $8d9c)
```
        ld de, _RAM_D7A8_
        ld hl, $8D9C
        ld b, $0F
    _LABEL_49E6_:    
            ld a, (de)
            and (hl)
            jr nz, _LABEL_4A11_
            inc de
            inc hl
            djnz _LABEL_49E6_
```
* Finally, it makes sure the 2nd last character's lower 4 bits, combined with the 4th last character's bit 4, are non-0, and lower than $15
```
        ld a, ($D7B6)
        and $0F
        ld l, a
        ld a, ($D7B4)
        and $10
        or l
        jr z, _LABEL_4A11_
        cp $15
        jr nc, _LABEL_4A11_
        call _LABEL_4AC9_
        ret
```

You can try to follow along what's in `_LABEL_4AC9_`, especially if you have known ram locations that the password might set, but I'm assuming the bits clear in $8d9c are the relevant flags used to load user data

so after all the transformations, given the masks, the relevant bits in the 15 characters are `$37 $37 $37 $37 $1f $1f $1f $27 $1f $27 $1f $1f $1f $0f $1f`

Here's the specifics, but of course, 4AC9 does a few more things, which I'll paste after

where ix = $d277<br>
$d7a8 - $37<br>
  bit 5 - if set, sets $d6c1 to 1<br>
  bit 4 - if set, sets ix+14 to 1<br>
  bit 2 - if set, sets ix+17 to 1<br>
  bits 0-1 - +1, then `*$80`, that word is stored in $d6bc<br>
<br>
$d7a9 - $37<br>
  bit 5 - if set, sets $d6be and ix+33 to 1<br>
  bit 4 - if set, sets ix+31 to 1<br>
  bits 0-2 - if non-0, gets the `value*5` into $d263, and sets ix+13 to 1<br>
<br>
$d7aa - $37<br>
  bit 5 - if set, sets $d7a5 to 1<br>
  bit 4 - if set, sets ix+20 to 1<br>
  bits 0-2 - stored in ix+9<br>
<br>
$d7ab - $37<br>
  bit 5 - if set, sets $d6bf to 1<br>
  bit 4 - if set, sets ix+27 to 1<br>
  bits 0-2 - stored in ix+10<br>
<br>
$d7ac - $1f<br>
  bit 4 - if set, sets ix+18 to 1<br>
  bit 3 - if set, sets ix+15 to 1<br>
  bits 0-2 - stored in ix+11<br>
<br>
$d7ad - $1f<br>
  bit 4 - if set, sets ix+16 to 1<br>
  bit 3 - if set, sets ix+19 to 1 and $d7a4 to $10<br>
  bits 0-2 - stored in ix+12<br>
<br>
$d7ae - $1f<br>
  bit 4 - if set, sets ix+25 to 1<br>
  bit 3 - if set, sets ix+24 to 1<br>
  bits 0-2 - the `value*32` is stored in $d45c. If non-0, sets ix+4 to 1<br>
<br>
$d7af - $27<br>
  bit 5 - see $d7b0<br>
  bits 0-2 - the `value*32` is stored in $d45b. If non-0, sets ix+5 to 1<br>
<br>
$d7b0 - $1f<br>
  bits 3-4 - combined with $d7af's bit 5, then /8 and stored in ix+29<br>
  bits 0-2 - stored in ix+32<br>
<br>
$d7b1 - $27<br>
  bit 5 - see $d7b2<br>
  bits 0-2 - stored in ix+23<br>
<br>
$d7b2 - $1f<br>
  bits 3-4 - combined with $d7b1's bit 5, then /8 and stored in ix+28<br>
  bits 0-2 - stored in ix+26<br>
<br>
$d7b3 - $1f<br>
  bits 3-4 - see $d7b6<br>
  bits 0-2 - stored in ix+22<br>
<br>
$d7b4 - $1f<br>
  bit 4 - see $d7b6<br>
  bits 0-3 - should be stored in $d71c, but $d7b5 overrides it<br>
<br>
$d7b5 - $0f<br>
  bits 0-3 - stored in $d71c<br>
<br>
$d7b6 - $1f<br>
  bit 4 - *2 and combined with $d7b3's bits 3-4, then /8 and stored in ix+30<br>
  bits 0-3 - combined with $d7b4's bit 4, and stored in $d6ae<br>
<br>

Other code run
```
; At the start of 4AC9
        ld bc, $A201
        call $0047 (WRTVDP)
        call _LABEL_853_
        ld a, $01
        ld ($D471), a
        ld hl, $1800
        ld bc, $0300
        ld a, $80
        call $0056 (FILVRM)
        ld hl, _RAM_D43A_
        ld de, _RAM_D43A_ + 1
        ld (hl), $F0
        ld bc, $001F
        ldir
        ld hl, $0000
        ld ($D000), hl
        ld ($D002), hl
; Before the write to $d71c from $d7b4/$d7b5
        ld a, $0E
        ld ($A000), a
        ld ($E002), a
        ld a, ($D6AE)
        dec a
        ld l, a
        ld h, $00
        add hl, hl
        add hl, hl
        add hl, hl
        add hl, hl
        ld de, _DATA_1C169_
        add hl, de
        ld e, (hl)
        inc hl
        ld d, (hl)
        ex de, hl
        ld b, (hl)
        inc hl
        ld de, $0006
_LABEL_4C9C_:    
        ld a, ($D6AE)
        cp (hl)
        jr z, _LABEL_4CA5_
        add hl, de
        djnz _LABEL_4C9C_
_LABEL_4CA5_:    
        inc hl
        ld a, (hl)
        ld ($D6AF), a
        inc hl
        inc hl
        inc hl
        ld de, $0000
        ld bc, $0000
        ld a, (hl)
        cp $0A
        jr nc, _LABEL_4CBD_
        ld c, $00
        ld e, a
        jr _LABEL_4CCF_
    
_LABEL_4CBD_:    
        cp $34
        jr c, _LABEL_4CC8_
        ld c, $2A
        sub $2A
        ld e, a
        jr _LABEL_4CCF_
    
_LABEL_4CC8_:    
        sub $0A
        and $FE
        ld c, a
        ld e, $0A
_LABEL_4CCF_:    
        inc hl
        ld a, (hl)
        cp $09
        jr nc, _LABEL_4CDA_
        ld b, $00
        ld d, a
        jr _LABEL_4CEC_
    
_LABEL_4CDA_:    
        cp $35
        jr c, _LABEL_4CE5_
        ld b, $2C
        sub $2C
        ld d, a
        jr _LABEL_4CEC_
    
_LABEL_4CE5_:    
        sub $06
        and $FE
        ld b, a
        ld d, $09
_LABEL_4CEC_:    
        ld ($D4B7), bc
        ld ($D4B9), de
        ld bc, $0000
        ld ($D473), bc
        ld ($D474), bc
; After the writes to $d71c
        call _LABEL_11F_
        ld hl, _DATA_1A1D9_
        ld a, ($D6AE)
        cp $0C
        jr c, _LABEL_4D1F_
        ld de, $ABF1
_LABEL_4D1F_:    
        ld a, $01
        call _LABEL_B11_
        call _LABEL_916_
        xor a
        ld ($D71F), a
        call _LABEL_E1D_
        call _LABEL_3464_
        ld a, $BE
        ld ($D2A3), a
        ld a, $01
        ld ($D27A), a
        ld ($D278), a
        ld a, $03
        ld ($D275), a
        ld a, $01
        ld ($D462), a
        ld hl, ($D6BC)
        ld ($D271), hl
        ld a, $FF
        ld ($D45A), a
        call _LABEL_B2D_
        call _LABEL_4183_
        ld a, $03
        ld ($E002), a
        ld ($A000), a
        ld hl, $AF10
        ld de, $3800
        ld bc, $0060
        call $005C (LDIRVM)
        ld hl, $2D70
        ld bc, $00A0
        ld a, $F0
        call $0056 (FILVRM)
        call _LABEL_3077_
        call _LABEL_310B_
        call _LABEL_50E5_
        ld bc, $E201
        call $0047 (WRTVDP)
        ld a, $13
        ld ($D6AC), a
        ret
```

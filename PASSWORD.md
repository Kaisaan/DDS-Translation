# Password System Notes  
The game's password system is a lot more complicated than I thought it would be. Here's all the notes I've made so far.    
    
# Password System Summary  
## Keyboard Breakdown  
```  
91 92 93 94 95		EA EB EC ED EE  
  
96 97 98 99 9A		EF F0 F1 F2 F3  
  
9B 9C 9D 9E 9F		F7 F8 F9 FA FB  
  
E0 E1 E2 E3 E4		F4 F5 F6    BACK  
  
E5 E6 E7 E8 E9		ENTER  
```  
## Example conversion  
Alright so the input value starts with    
```95 95 95 95    95 9D 95 95    95 95 95 95   95 95 93 E6```  
  
After the initial "passthrough" it subtracts $91, or $D1 if the value is $E0 or greater    
```04 04 04 04      04 0C 04 04    04 04 04 04    04 04 02 15```  
  
It does some subtraction with the second last value (bitwise AND $07 then doubled)    
```00 00 00 00      00 08 00 00     00 00 00 00      00 00 02 15```  
  
There's supposed to be some bitwise AND stuff with a bunch of values at $8D9C but it's just showing up as reads from the ram (those new values are put into a then?)  
  
And then at this point, ix = $D277 and iy = $D7A8   
this is where the fun stuff™️ (that I don't understand) happens where different values from iy+N (different values of above) are read, and ix is written to accordingly based on bit stuff, in this case only up to D7B6 (the second last character was read)  
## Password Fails  
There's only 5 checks (as in, 5 jumps to `_LABEL_4A11`)  
  
1. After the first "passthrough" (subtraction) it adds up the first 14 characters, it then subtracts $2B from this total and then check if its a negative result (it will subtract $2B again if not negative again), It will then add back $2B, if this result does not equal the value of the final character, then it is invalid  
  
2. After the second "passthrough" (with the bitwise AND $07 doubled then subtracted) it does bitwise AND with the values in `4D9C` in the ROM, which are `C8 C8 C8 C8 E0 E0 E0 D8 E0 D8 E0 E0 E0 F0 E0`. If any of these AND operations result in a non-zero value, it's invalid
<br>
*Leina summarized the rest*  
  
# Password System Details  
Label 4965 (routine for adding characters?)    
Load to hl the value of D000 (h = cursor position, l = pointer Y coord)    
Load to h the value $00    
Load to de the address of D7A8 (first character value)    
Add hl and de and store to hl (hl = D7A8 + 0F = D7B7)    
Load to the value of hl, a (a is the value of the character entered)    
*Continues*    
    
Label 499F    
Load to hl the address of D7A8    
Load to b the value of $10    
    
Label 49A4    
Load to hl the address of D7A8     
Load to b the value $10     
Load to a the value of hl (the value of D7A8)    
If a < $E0 then set C flag, otherwise reset C flag    
Jump to Label 49AB if C flag is set    
(If C flag is reset) Subtract $40 from a    
    
(If a < $E0, subtract $91, otherwise when a >= $E0 subtract $D1)    
    
Label 49AB    
Subtract $91 from a    
Load the value of a into the address of dl (put a into D7A8)    
Increment hl (to D7A9)    
Jump to Label 49A4 if not equal to zero    
Load to hl the address of D7A8 (first character value)    
Load to B the value of $0E    
XOR a with itself and store result into a (a = 0)    
    
Label 49B7    
Add a and the value of hl (a = value of hl)    
Increment hl    
Decrease B, Jump to Label 49B7 if b is not zero    
    
(Add up first 14 (subtracted) values of characters to a)    
    
Label 49BB    
Subtract $2B from a (If negative then C flag is set)    
Jump to Label 49BB if Z flag is reset (if a is 0)    
Add a and $2B and store to a    
Load the value of a into b    
Load the value of D7B7 into a (character value of 16th letter)    
If a == b then set Z flag, otherwise a != b and reset Z flag    
Jump to Label 4A11 if Z flag is not set    
Load the value of D7B6 into a (a = character value of 15th letter)    
Bitwise AND a with $07 (00000111) and store to a (check if last three bits are set)    
Add a and a and store to a (a = 2*a)    
Load to e the value of a    
Load to b the value $0E (set counter)    
Load to hl the address of D7A8 (first character value)    
    
Label 49D4    
Load to a the value of hl (the value of the first character)    
Subtract e from a and store into a    
If C flag is not set (as in, e - a is not negative) then jump to 49DA    
Add a and $2B then store to a    
    
(For first 14 character values, subtract e (15th character AND 00000111 times 2) then add $2B if negative then write back to address)    
    
Label 49DA    
Put a into the value of hl (D7A8) (put a into the value of first character)    
Increase hl (hl is now D7A9) and set N flag    
Decrease b, jump to Lavel 49D4 if b is not zero (end of counter)    
Load to de the address of D7A8    
Load to hl $8D9C     
Load to b $0F (set counter)   
    
Label 49E6    
Load to a the value of de (first character value after subtraction and then subtraction again)    
Bitwise AND a with the value of hl (HL = $C8 = 11001000)    
If Z flag is reset (a is not $00), then jump to Label 4A11    
Increase de (next character)    
Increase hl     
Decrease b and jump to Label 49E6 if  b is not zero (end counter)    
Load to hl the address of D7A8 (first character value)    
Load to b the value of $0F (set counter)    
    
Values of $8D9C (in CPU)    
```$C8 $C8 $C8 $C8 $E0 $E0 $E0 $D8 $E0 $D8 $E0 $E0 $E0 $F0 $E0```  
  
With the values of all characters, Bitwise AND with the above respective values  
jump to 4A11 if the result is 0    
    
Label 49F3    
Load to a the value of hl (first character value)    
If a < $2B, then set C flag, otherwise a >= $2B and reset C flag    
Jump to Label 4A11 if C flag is reset    
Increase hl (next character)    
Decrease b, jump to label 49F3 (end counter)    
Load to a the value of D7B6 (last character value)    
Bitwise AND a with $0F (00001111) and store to a    
Load to l the value of a    
Load to a the value of D7B4 (13th character value)    
Bitwise AND a with $10 (00010000) and store to a    
Bitwise OR l with a and store to a    
If Z is set (a is zero) then Jump to Label 4A11    
If a < $15 then set C flag, otherwise a >= $15 and reset C flag    
If C is reset then Jump to Label 4A11    
Call Label 4AC9    
Return    
    
Label 4A11 (Wrong password)    
Load to hl the address $8D8D    
Load to de the address $0948    
Load to b the value of $80    
Call Label 5080    
Load to hl the address $0000    
    
Label 4AC9    
Load to bc the address $A201    
Call $0047    
Call Label 853    
Load to a the value of $01    
Load to D471 the value of a ($01)    
Load to hl the address of $1800    
Load to bc the address $0300    
Load to a the value of $80    
Call $0056    
Load to hl the address of D43A  
Load to de the address of D43A + 1  
load to the address of hl (D43A) the value of $F0   
Load to bc the address of $001F  
Fills D43A-D459 with the value $F0  
Load to hl the address $0000  
Load to the address of $D000 the value of hl ($0000)   
Load to the address of $D002 the value of hl ($0000) (These 8 bytes are now all 0)  
Load to ix the address of $D277  
Load to iy the address of $D7A8 (first character value)  
If the value of iy+0 ($D7A8)'s 5th bit is set, if it is set then reset Z flag, otherwise set Z flag  
Jump to Label 4B0B if Z flag is set  
Load to a the value of $01  
Load the value of a into the address of D6C1  
  
Label 4B0B  
If the value of iy+0 ($D7A8)'s 4th bit is set, if it is set then reset Z flag, otherwise set Z flag  
Jump to Label 4B15 if Z flag is set  
Load to the address of ix+$14 the value of $01  
  
Label 4B15  
If the value of iy+0 ($D7A8)'s 2th bit is set, if it is set then reset Z flag, otherwise set Z flag  
Jump to Label 4B1F if Z flag is set  
Load to the address of ix+$17 the value of $01  
  
Label 4B1F  
Load to a the value at the address of iy+$00 ($D7A8)  
Bitwise AND a with $03 (00000011) and store to a  
Increment a  
Load to h the value of a  
Load to l the value of $00  
Shift all bits in h to the right, set bit 7 to 0, bit 0's old value is set to the C flag  
Rotate all bits to the right, the value of the C flag is put into bit 7, the leftmost bit to C  
Load to $D6BC the value of hl  
If the value of iy+1 ($D7A9)'s 5th bit is set, if it is set then reset Z flag, otherwise set Z flag  
Jump to Label 4B3D if Z flag is set  
Load to a the value of $01  
Load to $D6BE the value of a  
Load to ix+$33 the value of a  
  
Label 4B3D  
If the value of iy+1 ($D7A9)'s 4th bit is set, if it is set then reset Z flag, otherwise set Z flag  
Jump to Label 4B47 if Z flag is set  
Load to ix+$31 the value of $01  
  
Label 4B47  
Load to a the value of iy+$1  
Bitwise AND a with $07 (00000111) and store to a (check if last three bits are set)  
Jump to Label 4B59 if Z flag is set (Jump if a AND $07 is zero)  
Load to b the value of a  
Load to the address of ix+$13 the value of $01  
Add a to itself  
Add a to itself  
Add b to a and store result to a  
Load to $D263 the value of a  
  
Label 4B59  
If the value of iy+2 ($D7AA)'s 5th bit is set, if it is set then reset Z flag, otherwise set Z flag  
Jump to Label 4B64 if Z flag is set  
Load to a the value of $01  
Load to $D7A5 the value of a  
  
Label 4B64  
If the value of iy+2 ($D7AA)'s 5th bit is set, if it is set then reset Z flag, otherwise set Z flag  
Jump to Label 4B6E if Z flag is set  
Load to the address of ix+$20 the balue of $01  
  
Label 4B6E  
Load to a the value of address iy+$2  
Bitwise AND a with $07 (00000111) and store to a (check if last three bits are set)  
Load to the address of $ix+$9 the value of a  
If the value of iy+3 ($D7AB)'s 5th bit is set, if it is set then reset Z flag, otherwise set Z flag  
Jump to Label 4B81 if Z flag is set  
Load to a the value of $01  
Load to $D6BF the value of a ($01)  
  
Label 4B81  
If the value of iy+3 ($D7AB)'s 4th bit is set, if it is set then reset Z flag, otherwise set Z flag  
Load to the address of ix+$27 the value of $01  
  
Label 4B8B  
Load to a the value of the address of iy+$3  
Bitwise AND a with $07 (00000111) and store to a (check if last three bits are set)  
Load to the address of ix+$10 the value of a  
Load to a the value of the address of iy+$4  
Bitwise AND a with $07 (00000111) and store to a (check if last three bits are set)  
Load to the address of ix+$11 the value of a  
If the value of iy+4 ($D7AC)'s 4th bit is set, if it is set then reset Z flag, otherwise set Z flag  
Jump to Label 4BA5 if Z flag is set  
Load to the address of ix+$18 the value of $01  
  
Label 4BA5  
If the value of iy+4 ($D7AC)'s 3rd bit is set, if it is set then reset Z flag, otherwise set Z flag  
Jump to Label 4BAF if Z flag is set  
Load to the address of ix+$15 the value of $01  
  
Label 4BAF   
Load to a the value of the address of iy+$5  
Bitwise AND a with $07 (00000111) and store to a (check if last three bits are set)  
Load to the address of ix+$12 the value of a  
If the value of iy+$5 ($D7AD)'s 4th bit is set, if it is set then reset Z flag, otherwise set Z flag  
Jump to Label 4BC1 if Z flag is set  
Load to the address of ix+$16 the value of $01  
  
Label 4BC1  
If the value of iy+$5 ($D7AD)'s 3rd bit is set, if it is set then reset Z flag, otherwise set Z flag  
Jump to Label 4BD0 if Z flag is set  
Load to the address of ix+$19 the value of $01  
Load to a the value of $10  
Load to $D7A4 the value of a  
Load to a the value of iy+$6  
Bitwise AND a with $07 (00000111) and store to a (check if last three bits are set)  
Add a to itself  
Add a to itself  
Add a to itself  
Add a to itself  
Add a to itself (multiply a by 5)  
Load to $D45C the value of a  
Bitwise OR the value of a and store to a  
  
Label 4BD0  
Load to a the value of the address of iy+$6  

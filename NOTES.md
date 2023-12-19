# ROM differences
There are two common dumps of this game that are recognized by most MSX emulators.

|Name|GoodMSX|Kanji|
| --- | --- | --- |
|CRC-32|25FC11FA|367D385E|
|Bank 1|$68|$60|
|Bank 2|$70|$80|
|Bank 3|$78|$A0|
|Original|True|False|
|Mapper|[ASCII8](https://www.msx.org/wiki/MegaROM_Mappers#ASCII8_.28ASCII.29)|[Konami](https://www.msx.org/wiki/MegaROM_Mappers#Konami.27s_MegaROMs_without_SCC)|

The only difference between the ROMs is that they use different mappers. So the only different hex values in the ROMs are related to the address of banks used.
**This translation uses the original, ASCII8 ROM for patching.**

# Useful RAM Values
`$D000` is the current position of the password cursor<br>
`$D001` is the current Y position of the password arrow<br>
`$D002` is the current X position of the password arrow<br>
<br>
`$D265` is the moon state<br>
`$D266` is the moon state timer<br>
<br>
`$D271` is Nakajima's current HP<br>
`$D272` is Nakajima's current level<br>
<br>
`$D27E` is the number of Jewels(?)<br>
`$D27F` is the number of Bones<br>
`$D280` is the number of Batteries<br>
`$D281` is the number of Large Potions<br>
`$D282` is the number of Medium Potions<br>
`$D283` is the number of Small Potions<br>
`$D284` is the number of Cerberus<br>
`$D285` is the number of Potions(?)<br>
`$D286` is the number of Tags(?)<br>
`$D287` is the number of Cat's Eyes<br>
`$D288` is the number of Canes<br>
`$D289` is the number of Fire<br>
`$D28A` is the number of HHC<br>
`$D28B` is the number of Red Jewels<br>
`$D28C` is the number of Macca<br>
`$D28D` is the number of Keys<br>
`$D28E` is the number of Hourglasses<br>
`$D28F` is the number of Boots<br>
`$D290` is the number of Bird Keys<br>
`$D291` is the number of Maps<br>
`$D292` is the number of Bombs<br>
`$D293` is the number of Roasts<br>
`$D294` is the number of Bells<br>
`$D295` is the number of Lanterns<br>
`$D296` is the number of T Coin<br>
`$D297` is the number of Triangles<br>
`$D298` is the number of Yumiko Dolls<br>
<br>
`$D6AE` is the current area number<br>
`$D6AF` is the current floor number<br>
<br>
`$D6BB` is the amount of Macca<br>
<br>
`$D71C` is Nakajima's INT stat<br>
<br>
`$D7A4` is the current amount of HHC Battery (Max is $10, decreases by 1 each time it is used)<br>
<br>
`$D7A8` through `$D7B7` are the character values (According to DDSMT.tbl) of the inputted characters<br>

# Text Printing Routine
Label `$5080` is the text printing routine  
It loads text data from address stored in `hl`  
Prints text location based on what's stored in `de` (YYXX Where XX is X position in pixels and YY is line number)  
Text colour (X) and highlight (Y) based on what's loaded in `b` based on the [MSX colour palette](https://paulwratt.github.io/programmers-palettes/HW-MSX/HW-MSX-palettes.html)
In cutscenes, one line can print 32 characters 
Automatically wraps but no line break  
Characters for the text are loaded from [the BIOS](https://www.msx.org/wiki/MSX_font) based on their hex value  
Stops printing text until it sees the `$FF` character

# Pointer Table Text
Some text will use a pointer table to load its text into `hl`  
It will also used the fixed value of `de = $10F0` but will call `$59CC`  
The routine at `$59CC` uses the character value `$FE` as a newline and also centers the text
Text loaded with this routine can only print 20 characters per line

# Izanami Text
Visiting a new Izanami shrine displays a text message. After exiting Nakajima's INT stat increases by 1  
Izanami has a new message for each level of INT  
The pointer table for Izanami's messages are at `$1B51B` and are indexed by the value of `$D71C` (Nakajima's current INT)  

# Yumiko Doll Text
The pointer table for the Yumiko Dolls' messages are at `$1B727` and are indexed by the value of `$D71D`

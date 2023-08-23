# Useful RAM Values
`$D271` is Nakajima's current HP<br>
`$D272` is Nakajima's current level<br>
<br>
`$D6AE` is the current area number<br>
`$D6AF` is the current floor number<br>
<br>
`$D000` is the current position of the password cursor<br>
`$D001` is the current Y position of the password arrow<br>
`$D002` is the current X position of the password arrow<br>
<br>
`$D7A8` through `$D7B7` are the character values (According to DDSMT.tbl) of the inputted characters<br>

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

# Text Printing Routine
Label `$5080` is the text printing routine  
It loads text data from address stored in `hl`  
Prints text location based on what's stored in `de` (YYXX Where XX is X position in pixels and YY is line number)  
Text colour (X) and highlight (Y) based on what's loaded in `b` based on the [MSX colour palette](https://paulwratt.github.io/programmers-palettes/HW-MSX/HW-MSX-palettes.html)
One line can hold 32 characters  
Automatically wraps but no line break  
Characters for the text are loaded from [the BIOS](https://www.msx.org/wiki/MSX_font) based on their hex value  
Stops printing text until it sees the `$FF` character

# Pointer Table Text
Some text will use a pointer table to load its text into `hl`  
It will also used the fixed value of `de = $10F0` but will call `$59CC`  
The routine at `$59CC` uses the character value `$FE` as a newline and also centers the text
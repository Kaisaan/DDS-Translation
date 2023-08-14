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
Label 5080 is the text printing routine
It loads text data from address stored in hl
Prints text based on what's stored in de (XXYY Where XX is X position in pixels and YY is line number)
Text colour (X) and highlight (Y) based on what's loaded in b
|X or Y value|Colour|Colour Code|
| --- | --- | --- |
|0|Blank|#000000|	
|1|Black|#000000|
|2|Green|#1ccb42|
|3|Light Green|#5edc78|
|4|Purple|#5554ed|
|5|Light Purple|#7d75fc|
|6|Red|#d2534d|
|7|Cyan|#43ebf6|
|8|Light Red|#fd5554|
|9|Lighter Red|#ff7978|
|A|Yellow|#d3c155|
|B|Light Yellow|#e5ce80|
|C|Green|#21b03e|
|D|Purple|#c95bba|
|E|Grey|#cfcbca|
|F|White|#ffffff|

One line can hold 32 characters  
Automatically wraps but no line break  
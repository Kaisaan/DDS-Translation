# Useful RAM Values
`$D271` is Nakajima's current HP 
`$D272` is Nakajima's current level

`$D6AE` is the current area number
`$D6AF` is the current floor number

`$D000` is the current position of the password cursor
`$D001` is the current Y position of the password arrow
`$D002` is the current X position of the password arrow

`$D7A8` through `$D7B7` are the character values (According to DDSMT.tbl) of the inputted characters

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
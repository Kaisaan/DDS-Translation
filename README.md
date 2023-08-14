# DDS-Translation
Stuff for translating and further demystifying Digital Devil Story - Reincarnation of the Goddess by Telenet.
I have a page about the game and its other versions on [my website](https://kaisaan.github.io/pages/dss.html) but it's still a work in progress.

# Building
Have [wla-dx](https://github.com/vhelin/wla-dx) installed and have the game's ROM as `Digital Devil Story.rom`. Then run `make` and it will result in the new `DDSE.rom` file.
Make sure your ROM has a CRC-32 of `25FC11FA` otherwise loading the text may fail.

# Contributing
If you want to help with translation, we have a [Spreadsheet](https://docs.google.com/spreadsheets/d/1oDYWFWq-gdgdt5zBz0KaMGqM_4g3SZWNQ_7SA0C65jQ/edit?usp=sharing) for all the lines. 
Please request for access on the Google Sheets page, or message me on Discord (kaisaan) for access.

# Maps
Thanks to [leina](https://github.com/leinacc), the data for the maps have been extracted. I wrote a converter to change the .txt data into .bmp files.
The image files are flipped vertically and are missing data such as chests, stairs, and enemy data. I have an example .psd file in the maps folder to show what I would want the final .png file for a map to look like.

# Passwords
The one thing to make testing overall easier is figuring out the game's password system. Leina and I have already put in a lot of work in figuring out how it works, but I still have not fully reversed-engineered it.

# Credits
Gabriulio - Translation
Leiana - Lots of hacking
Calindro - Hacking
abridgewater - Hacking and Japanese advice
YasaSheep - Japanese
Zarby89 - Extra table file help
Sugunii - Special Thanks

Classic Persona Modding - Where I'm able to post progress
Romhacking.net - Where I got a lot of hacking help
PC-9800 Series Central - Advice on working with real hardware
SMT Modding Discord - Extra support
my server - where i posted random out of context progress


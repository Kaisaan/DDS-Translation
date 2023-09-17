# DDS-Translation
Stuff for translating and further demystifying *Digital Devil Story - Reincarnation of the Goddess* by Telenet.
<br>I have a page about the game and its other versions on [my website](https://kaisaan.github.io/pages/dds.html) but it's still a work in progress.
<br>Another, much more detailed, place to learn more about the game is [this reddit post](https://old.reddit.com/r/Megaten/comments/15zdfwp/digital_devil_story_megami_tensei_telenet_version/) by Natreg.

# How it Works
The game loads the character graphics from the BIOS of the MSX. English letters are always going to be included of the BIOS regardless of the region, so I'm just able to change the value in the text data.  
Because the English text is going to be larger than the space allotted for the original Japanese text, I expanded the ROM from 128kb to 256kb and just change banks as needed.

# Progress
|Task|Progress|
| --- | --- |
|Lines Inserted|7|
|Lines Translated|All|
|Manual Translated|0 Pages|

# Building
Have [wla-dx](https://github.com/vhelin/wla-dx) installed and have the game's ROM as `Digital Devil Story.rom`. Then run `make` and it will result in the new `DDSE.rom` file.
<br>Make sure your ROM has a CRC-32 of `25FC11FA` otherwise loading the text may fail.

# Contributing
If you want to help with translation, we have a [Spreadsheet](https://docs.google.com/spreadsheets/d/1oDYWFWq-gdgdt5zBz0KaMGqM_4g3SZWNQ_7SA0C65jQ/edit?usp=sharing) for all the lines. 
<br>Please request for access on the Google Sheets page, or message me for access.

# Testing
Getting to the text in the game is very tedious as they're few and far between. I'm going to need help with accessing the text, collecting passwords, and documenting maps. Please contact me if you want to help with testing.

# Maps
[DDSLibrary](http://ddslib.html.xdomain.jp/game/pc8801/01.html) Has maps for all the levels. While the site doesn't specifically have maps for the MSX release. I assume the content is the same.

# Passwords
The one thing to make testing overall easier is figuring out the game's password system. Leina and I have already put in a lot of work in figuring out how it works, but I still have not fully reversed-engineered it.

# Manual
I am also interested in getting the manual translated. The best scan of the manual I could find is on [necretro.org](https://retrocdn.net/images/c/ca/Digital_Devil_Story_Megami_Tensei_PC88_Manual.pdf).

# Contact
You can contact me on Discord with the username `kaisaan` or you can join the [Classic Persona Modding](https://discord.gg/ahg9gegCcm) to see updates on this project in the [`#msx-megaten-telenet-translation`](https://discord.com/channels/934828922032504852/1137420237428494336) channel.

# Credits
Gabriulio - Translation<br>
MKCA - Translation<br>
Leina - Lots of Hacking help<br>
Calindro - Hacking and Debugging help, also creator of Emulicious<br>
abridgewater - Hacking and Japanese help<br>
YasaSheep - Japanese help<br>
Zarby89 - Extra table file help<br>
Z64Gaming - Title Screen Graphics<br>
Sugunii - Special Thanks<br>
<br>
Supporters: comrade_hee_ho, seatsafteyswitch, eiowlta, quantumdog, reachforthemoon, naoyatoudou, Scone#6977, amazingcretin, alison1337, liamcarney, theoomslayer, boimses, hiking., xzippyzachx, yoush03<br>
<br>
[Classic Persona Modding](https://discord.gg/ahg9gegCcm) - Where I'm able to post progress<br>
[Romhacking.net](https://discord.gg/uAufcgz) - Where I got a lot of hacking help<br>
[PC-9800 Series Central](http://discord.gg/j2ns7UQ) - Advice on working with real hardware<br>
[SMT Modding Discord](https://discord.gg/9JGwcwMEkF) - Extra support<br>
GDYU - Moral Support<br>
my server - where i posted random out of context progress


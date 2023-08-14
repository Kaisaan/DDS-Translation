all: DDSE.rom

code.o: code.s
	wla-z80 -o $@ $<

DDSE.rom: code.o
	wlalink -S linkfile $@

	@if which md5sum &>/dev/null; then md5sum $@; else md5 $@; fi
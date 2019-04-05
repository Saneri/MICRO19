all: pract4a.com, pract4b.exe, pract4c.exe

pract4a.com: pract4a.obj
	tlink /v /t pract4a
pract4a.obj: pract4a.asm
	tasm /z pract4a.asm

pract4b.exe: pract4b.obj
	tlink /v pract4b
pract4b.obj: pract4b.asm
	tasm /z pract4b.asm

pract4c.exe: pract4c.obj
	tlink /v pract4c
pract4c.obj: pract4c.asm
	tasm /z pract4c.asm

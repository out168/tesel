CC = wla-z80
CFLAGS = -oi
CFLAGSL = -l
LD = wlalink
LDFLAGS = -vdiS

MAIN = tesel

all: $(MAIN).rom

$(MAIN).rom: $(MAIN).o libv9990.o Makefile linkfile sprites.sc5 tiles.sc5
	$(LD) $(LDFLAGS) linkfile $(MAIN).rom

$(MAIN).o: $(MAIN).z80
	$(CC) $(CFLAGS) $(MAIN).z80 $(MAIN).o

libv9990.o: libv9990.z80
	$(CC) $(CFLAGSL) libv9990.z80 libv9990.o

clean:
	rm -f *.o *.sym *.rom *~ 

CFLAGS+= -Wall
LDADD+= -lX11 
LDFLAGS=
EXEC=catwm

PREFIX?= /usr
BINDIR?= $(PREFIX)/bin

CC=gcc

all: $(EXEC)

config.h: config.h.def
	cp config.h.def config.h

catwm: config.h catwm.o
	$(CC) $(LDFLAGS) -Os -o $@ $+ $(LDADD)

install: all
	install -Dm 755 catwm $(DESTDIR)$(BINDIR)/catwm

clean:
	rm -f catwm *.o

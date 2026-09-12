include config.mk

.PHONY: all clean install uninstall

all: sled
sled: sled.o eprintf.o arg.h util.h
	$(CC) $(LDFLAGS) -o sled sled.o eprintf.o

clean:
	rm -f *.o sled

install: sled
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f sled $(DESTDIR)$(PREFIX)/bin
	mkdir -p $(DESTDIR)$(MANDIR)/man1
	cp -f sled.1 $(DESTDIR)$(MANDIR)/man1
	[ -n "$(LINK_ED)" ] && ln -sf sled $(DESTDIR)$(PREFIX)/bin/ed

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/sled $(DESTDIR)$(MANDIR)/man1/sled.1

.c.o:
	$(CC) $(CFLAGS) -o $@ -c $<

#!/usr/bin/make -f
# -*- mode: makefile-gmake; coding: utf-8 -*-

include ../i-nex.mk

IMG_SIZES ::= 16 22 32 48 64 128 256

all: install

install:
	@cp $(CURDIR)/i-nex.png $(CURDIR)/i-nex-256.png
	for px in $(IMG_SIZES) ; do \
		install -d $(DESTDIR)$(PREFIX)/share/icons/hicolor/$${px}x$${px}/apps
		cp -f $(CURDIR)/i-nex-$${px}.png \
			$(DESTDIR)$(PREFIX)/share/icons/hicolor/$${px}x$${px}/apps/i-nex.png ; \
		chmod 0644 $(DESTDIR)$(PREFIX)/share/icons/hicolor/$${px}x$${px}/apps/i-nex.png ; \
	done
	@$(RM) $(CURDIR)/i-nex-256.png

uninstall:
	for px in $(IMG_SIZES) ; do \
		test -f $(DESTDIR)$(PREFIX)/share/icons/hicolor/$${px}x$${px}/apps/i-nex.png && \
			$(RM) $(DESTDIR)$(PREFIX)/share/icons/hicolor/$${px}x$${px}/apps/i-nex.png ; \
	done

.PHONY: all install uninstall

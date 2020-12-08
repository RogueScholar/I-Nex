#!/usr/bin/make -f
# -*- mode: makefile-gmake; coding: utf-8 -*-

include ../i-nex.mk

all: make

make: make-binary

make-binary: compile-i-nex-edid

compile-i-nex-edid:
	@echo -e '$(OK_COLOR)Compiling EDID parser... $(OK_STRING)$(NO_COLOR)'
	$(CC) -o i-nex-edid i-nex-edid.c $(CFLAGS) $(additional_confflags)
	chmod 0755 $(CURDIR)/i-nex-edid

install: install-bin
install-bin: install-bin-i-nex-edid

install-bin-i-nex-edid:
	$(INSTALL_DM)0755 -t $(DESTDIR)$(bindir) $(CURDIR)/i-nex-edid

clean:
	@echo -e '$(ACTION_COLOR)Cleaning EDID parser build directory...$(NO_COLOR)'
	$(RM) $(CURDIR)/i-nex-edid

.PHONY: all make make-binary compile-i-nex-edid install install-bin \
	install-bin-i-nex-edid clean

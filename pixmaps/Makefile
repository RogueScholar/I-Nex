#!/usr/bin/make -f
# -*- mode: makefile-gmake; coding: utf-8 -*-
#
# SPDX-FileCopyrightText: © 2013-2016 Michał Głowienka <eloaders@linux.pl>
# SPDX-FileCopyrightText: © 2020 Peter J. Mello <admin@petermello.net>
#
# SPDX-License-Identifier: LGPL-3.0-or-later
# ------------------------------------------------------------------------------

include ../i-nex.mk

IMG_SIZES ::= 16 22 32 48 64 128 256

all: install

install:
	@cp $(CURDIR)/i-nex.png $(CURDIR)/i-nex-256.png
	for px in $(IMG_SIZES) ; do \
		install -d $(DESTDIR)$(appicondir)/$${px}x$${px}/apps ; \
		cp -f $(CURDIR)/i-nex-$${px}.png \
			$(DESTDIR)$(appicondir)/$${px}x$${px}/apps/i-nex.png ; \
		chmod 0644 $(DESTDIR)$(appicondir)/$${px}x$${px}/apps/i-nex.png ; \
	done
	@$(RM) $(CURDIR)/i-nex-256.png

uninstall:
	for px in $(IMG_SIZES) ; do \
		test -f $(appicondir)/$${px}x$${px}/apps/i-nex.png && \
			$(RM) $(appicondir)/$${px}x$${px}/apps/i-nex.png ; \
	done

.PHONY: all install uninstall

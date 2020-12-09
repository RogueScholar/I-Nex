#!/usr/bin/make -f
# -*- mode: makefile-gmake; coding: utf-8 -*-
#
# SPDX-FileCopyrightText: © 2014-2016 Michał Głowienka <eloaders@linux.pl>
# SPDX-FileCopyrightText: © 2020 Peter J. Mello <admin@petermello.net>
#
# SPDX-License-Identifier: LGPL-3.0-or-later
# ------------------------------------------------------------------------------

include ../i-nex.mk

MANPAGE_FILES = $(wildcard *.1)

all: install

install: install-man

install-man:
	@echo -e '$(OK_BGCOLOR)Installing manpages...$(NO_COLOR)'
	$(INSTALL_DM)0644 -t $(DESTDIR)$(PREFIX)$(MANDIR) $(MANPAGE_FILES)
	$(COMPRESS) $(addprefix $(DESTDIR)$(PREFIX)$(MANDIR)/,$(MANPAGE_FILES))

.PHONY: all install install-man

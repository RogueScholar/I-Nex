#!/usr/bin/make -f
# -*- mode: makefile-gmake; coding: utf-8 -*-
#
# SPDX-FileCopyrightText: © 2013-2016 eloaders <eloaders@linux.pl>
# SPDX-FileCopyrightText: © 2020 Peter J. Mello <admin@petermello.net>
#
# SPDX-License-Identifier: LGPL-3.0-or-later
# ------------------------------------------------------------------------------

include i-nex.mk

all: make

make: build-inex build-json

install: install-inex install-json install-changelogs install-desktop-files \
	install-manpages install-pixmaps install-udev-rule link-inex

clean: clean-inex clean-json

distclean: clean
	@echo -e '$(OK_BGCOLOR)Cleaning artifacts from directory tree...$(NO_COLOR)'
	find . \( -name '.gambas' -o -name '*.gambas' -o -name '.directory' -o \
		-name 'autom4te.cache' \) -execdir $(RM) $(RMDIR_OPT) '{}' \+
	cd I-Nex && $(RM) config.log config.status configure install-sh missing

sysclean:
	@echo -e '$(OK_BGCOLOR)Uninstalling I-Nex...$(NO_COLOR)'
	$(MAKE) -C I-Nex uninstall

build-inex:
	@echo -e '$(OK_BGCOLOR)Building I-Nex...$(NO_COLOR)'
	$(MAKE) -C I-Nex

build-json:
	@echo -e '$(OK_BGCOLOR)Building EDID parser...$(NO_COLOR)'
	$(MAKE) -C JSON

install-inex: build-inex
	@echo -e '$(OK_BGCOLOR)Installing I-Nex...$(NO_COLOR)'
	$(MAKE) -C I-Nex install

install-json: build-json
	@echo -e '$(OK_BGCOLOR)Installing EDID parser...$(NO_COLOR)'
	$(MAKE) -C JSON install

install-changelogs:
	@echo -e '$(OK_BGCOLOR)Installing changelog...$(NO_COLOR)'
	$(INSTALL_DM)0644 -t $(DESTDIR)$(PREFIX)$(DOCSDIR) $(CURDIR)/Changelog.md

install-desktop-files:
	@echo -e '$(OK_BGCOLOR)Installing XDG desktop/metainfo files...$(NO_COLOR)'
	$(INSTALL_DM)0644 -t $(DESTDIR)$(PREFIX)/share/applications \
		$(CURDIR)/pl.linux.i_nex.desktop
	$(INSTALL_DM)0644 -t $(DESTDIR)$(PREFIX)/share/metainfo \
		$(CURDIR)/pl.linux.i_nex.metainfo.xml

install-manpages:
	@echo -e '$(OK_BGCOLOR)Installing manpages...$(NO_COLOR)'
	$(MAKE) -C manpages

install-pixmaps:
	@echo -e '$(OK_BGCOLOR)Installing application icons...$(NO_COLOR)'
	$(MAKE) -C pixmaps

install-udev-rule:
	@echo -e '$(OK_BGCOLOR)Installing udev rules...$(NO_COLOR)'
	$(INSTALL_DM)0644 $(CURDIR)/i2c_smbus.rules \
		$(DESTDIR)$(UDEV_RULES_DIR)/60-i2c_smbus.rules

link-inex: install-inex
	@echo -e '$(OK_BGCOLOR)Creating symlink to launch as `inex'...$(NO_COLOR)'
	install -d $(DESTDIR)$(bindir)
	ln -s $(DESTDIR)$(bindir)/i-nex.gambas $(DESTDIR)$(bindir)/i-nex

clean-inex:
ifneq (,$(wildcard I-Nex/Makefile))
	@echo -e '$(OK_BGCOLOR)Cleaning build directory...$(NO_COLOR)'
	$(MAKE) -C I-Nex distclean
endif

clean-json:
	@echo -e '$(OK_BGCOLOR)Cleaning EDID parser build directory...$(NO_COLOR)'
	$(MAKE) -C JSON clean

.PHONY: all make install clean distclean sysclean build-inex build-json \
	install-inex install-json install-changelogs install-desktop-files \
	install-manpages install-pixmaps install-udev-rule link-inex clean-inex \
	clean-json

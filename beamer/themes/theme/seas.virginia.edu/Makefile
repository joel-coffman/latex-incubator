.PHONY: default
default: beamerthemeseas.virginia.edu.sty example.pdf beamerthemeseas.virginia.edu.pdf

minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

beamerthemeseas.virginia.edu.sty: | beamercolorthemewahoo.sty beamerouterthemelogo.sty
beamerthemeseas.virginia.edu.pdf: beamerthemeseas.virginia.edu.sty example.pdf | email.sty theme-doc.sty minted

example.pdf: beamerthemeseas.virginia.edu.sty

include $(shell git rev-parse --show-toplevel)/Makefile.mk

# fall-back for Beamer themes
beamercolorthemewahoo.sty:
	$(MAKE) --directory=../../color/wahoo $@

beamerouterthemelogo.sty:
	$(MAKE) --directory=../../outer/logo $@


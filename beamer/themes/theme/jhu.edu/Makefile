.PHONY: default
default: beamerthemejhu.edu.sty example.pdf beamerthemejhu.edu.pdf

minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

beamerthemejhu.edu.sty: | beamercolorthemebluejay.sty beamerouterthemelogo.sty
beamerthemejhu.edu.pdf: beamerthemejhu.edu.sty example.pdf | email.sty theme-doc.sty minted

example.pdf: beamerthemejhu.edu.sty

include $(shell git rev-parse --show-toplevel)/Makefile.mk

# fall-back for Beamer themes
beamercolorthemebluejay.sty:
	$(MAKE) --directory=../../color/bluejay $@

beamerouterthemelogo.sty:
	$(MAKE) --directory=../../outer/logo $@

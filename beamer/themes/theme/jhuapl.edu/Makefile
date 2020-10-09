.PHONY: default
default: beamerthemejhuapl.edu.sty example.pdf beamerthemejhuapl.edu.pdf

minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

beamerthemejhuapl.edu.sty: | beamerthemejhu.edu.sty
beamerthemejhuapl.edu.pdf: beamerthemejhuapl.edu.sty example.pdf | email.sty theme-doc.sty minted

example.pdf: beamerthemejhuapl.edu.sty

include $(shell git rev-parse --show-toplevel)/Makefile.mk

# fall-back for Beamer themes
beamerthemejhu.edu.sty:
	$(MAKE) --directory=../jhu.edu $@


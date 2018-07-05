.PHONY: default
default: beamerthemeengineering.jhu.edu.sty example.pdf beamerthemeengineering.jhu.edu.pdf

minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

beamerthemeengineering.jhu.edu.sty: | beamerthemejhu.edu.sty
beamerthemeengineering.jhu.edu.pdf: beamerthemeengineering.jhu.edu.sty example.pdf | email.sty theme-doc.sty minted

example.pdf: beamerthemeengineering.jhu.edu.sty

include ../../../../Makefile.mk

# fall-back for Beamer themes
beamerthemejhu.edu.sty:
	$(MAKE) --directory=../jhu.edu $@

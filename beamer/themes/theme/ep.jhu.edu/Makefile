.PHONY: default
default: beamerthemeep.jhu.edu.sty example.pdf beamerthemeep.jhu.edu.pdf

minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

beamerthemeep.jhu.edu.sty: | beamerthemejhu.edu.sty
beamerthemeep.jhu.edu.pdf: beamerthemeep.jhu.edu.sty example.pdf | email.sty theme-doc.sty minted

example.pdf: beamerthemeep.jhu.edu.sty

include ../../../../Makefile.mk

# fall-back for Beamer themes
beamerthemejhu.edu.sty:
	$(MAKE) --directory=../jhu.edu $@

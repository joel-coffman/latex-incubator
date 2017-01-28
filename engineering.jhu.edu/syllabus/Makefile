.PHONY: default
default: minted syllabus.sty syllabus.pdf

.PHONY: minted
minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

include ../../Makefile.mk

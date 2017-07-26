.PHONY: default
default: minted subtitle.sty subtitle.pdf

.PHONY: minted
minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

include ../Makefile.mk

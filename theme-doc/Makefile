.PHONY: default
default: minted theme-doc.sty theme-doc.pdf

.PHONY: minted
minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

include ../Makefile.mk

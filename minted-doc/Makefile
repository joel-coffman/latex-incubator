.PHONY: default
default: minted minted-doc.sty minted-doc.pdf

.PHONY: minted
minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

include ../Makefile.mk

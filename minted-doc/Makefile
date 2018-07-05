.PHONY: default
default: minted-doc.sty minted-doc.pdf

minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

minted-doc.sty:
minted-doc.pdf: | email.sty minted-doc.sty minted

include ../Makefile.mk

.PHONY: default
default: editing.sty editing.pdf

minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

editing.sty:
editing.pdf: editing.sty | email.sty minted-doc.sty minted

include ../Makefile.mk

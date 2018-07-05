.PHONY: default
default: theme-doc.sty theme-doc.pdf

minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

theme-doc.sty: | minted-doc.sty
theme-doc.pdf: | email.sty theme-doc.sty minted

include ../Makefile.mk

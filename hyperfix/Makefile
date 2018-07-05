.PHONY: default
default: hyperfix.sty hyperfix.pdf

minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

hyperfix.sty:
hyperfix.pdf: | email.sty hyperfix.sty minted-doc.sty minted

include ../Makefile.mk

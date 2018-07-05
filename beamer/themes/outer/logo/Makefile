.PHONY: default
default: beamerouterthemelogo.sty beamerouterthemelogo.pdf

minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

beamerouterthemelogo.sty:
beamerouterthemelogo.pdf: beamerouterthemelogo.sty example.pdf | email.sty theme-doc.sty minted

example.pdf: beamerouterthemelogo.sty

include ../../../../Makefile.mk

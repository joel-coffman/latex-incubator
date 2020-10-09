.PHONY: default
default: subtitle.sty subtitle.pdf

minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

subtitle.sty:
subtitle.pdf: | email.sty minted-doc.sty subtitle.sty minted

include $(shell git rev-parse --show-toplevel)/Makefile.mk

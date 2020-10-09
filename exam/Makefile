.PHONY: default
default: minted exam.sty exam.pdf

minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

exam.sty:
exam.pdf: | email.sty exam.sty minted-doc.sty minted

include $(shell git rev-parse --show-toplevel)/Makefile.mk

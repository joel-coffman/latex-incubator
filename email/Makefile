.PHONY: default
default: email.sty email.pdf

minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

email.sty: | hyperfix.sty
email.pdf: | email.sty minted-doc.sty minted

include $(shell git rev-parse --show-toplevel)/Makefile.mk

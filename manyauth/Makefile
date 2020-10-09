.PHONY: default
default: manyauth.sty manyauth.pdf

minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

manyauth.sty:
manyauth.pdf: | email.sty manyauth.sty minted

include $(shell git rev-parse --show-toplevel)/Makefile.mk

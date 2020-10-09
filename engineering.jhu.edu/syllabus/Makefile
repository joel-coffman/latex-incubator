.PHONY: default
default: syllabus.sty syllabus.pdf

minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

syllabus.sty:
syllabus.pdf: syllabus.sty | email.sty minted

include $(shell git rev-parse --show-toplevel)/Makefile.mk

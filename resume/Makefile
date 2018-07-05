.PHONY: default
default: resume.sty resume.pdf

minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

resume.sty:
resume.pdf: | email.sty minted

include ../Makefile.mk


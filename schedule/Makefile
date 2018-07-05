.PHONY: default
default: schedule.sty schedule.pdf

minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

schedule.sty:
schedule.pdf: | email.sty

include ../Makefile.mk

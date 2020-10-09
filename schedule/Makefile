.PHONY: default
default: schedule.sty schedule.pdf

minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

schedule.sty:
schedule.pdf: | email.sty minted

include $(shell git rev-parse --show-toplevel)/Makefile.mk

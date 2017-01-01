.PHONY: default
default: minted \
         $(patsubst %.ins,%.sty,$(wildcard *.ins)) \
         $(patsubst %.tex,%.pdf,$(wildcard *.tex)) \
         $(patsubst %.dtx,%.pdf,$(wildcard *.dtx))

.PHONY: minted
minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

include ../../../../Makefile.mk

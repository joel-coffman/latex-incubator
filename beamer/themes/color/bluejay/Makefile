.PHONY: default
default: $(patsubst %.ins,%.sty,$(wildcard *.ins)) \
         $(patsubst %.tex,%.pdf,$(wildcard *.tex)) \
         $(patsubst %.dtx,%.pdf,$(wildcard *.dtx))

include ../../../../Makefile.mk

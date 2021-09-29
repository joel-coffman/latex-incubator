# use Bash as the shell when interpreting the Makefile
SHELL := /bin/bash

.PHONY: all
all: packages documentation

packages = $(patsubst %.dtx,%.sty,$(wildcard *.dtx))
documentation = $(patsubst %.dtx,%.pdf,$(wildcard *.dtx))

.PHONY: packages
packages: $(packages)

.PHONY: documentation
documentation: $(documentation)

examples:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

$(documentation): email.sty hyperfix.sty minted-doc.sty | examples

include $(shell git rev-parse --show-toplevel)/texmf/Makefile.tex

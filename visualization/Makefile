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

$(documentation): $(packages) | examples

derivatives += $(patsubst %.dtx,%.sty,$(wildcard *.dtx)) \
               tikzlibrarypgfplots.*.code.tex

include $(shell git rev-parse --show-toplevel)/Makefile.mk

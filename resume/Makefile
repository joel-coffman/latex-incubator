.PHONY: all
all: packages documentation

packages = $(patsubst %.dtx,%.sty,$(wildcard *.dtx))
documentation = $(patsubst %.dtx,%.pdf,$(wildcard *.dtx))

documents := $(documentation) $(patsubst %.tex,%.pdf,$(wildcard *.tex))

.PHONY: packages
packages: $(packages)

.PHONY: documentation
documentation: $(documentation)

.PHONY: documents
documents: $(documents)

minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

$(packages): hyperfix.sty
$(documentation): email.sty | minted

resume.pdf: example.pdf

include $(shell git rev-parse --show-toplevel)/texmf/Makefile.tex

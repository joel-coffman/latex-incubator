.PHONY: all
all: packages documentation

packages = $(patsubst %.dtx,%.sty,$(wildcard *.dtx))
documentation = $(patsubst %.dtx,%.pdf,$(wildcard *.dtx))

.PHONY: packages
packages: $(packages)

.PHONY: documentation
documentation: $(documentation)

minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

$(packages):
$(documentation): example.pdf
$(documentation): email.sty hyperfix.sty minted-doc.sty theme-doc.sty | minted

example.pdf: beamerouterthemelogo.sty

include $(shell git rev-parse --show-toplevel)/texmf/Makefile.tex

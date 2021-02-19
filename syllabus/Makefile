.PHONY: default
default: packages documentation

packages = $(patsubst %.dtx,%.sty,$(wildcard *.dtx))
documentation = $(patsubst %.dtx,%.pdf,$(wildcard *.dtx))

.PHONY: packages
packages: $(packages)

.PHONY: documentation
documentation: $(documentation) $(packages)

minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

$(packages):
$(documentation): | email.sty minted-doc.sty minted

derivatives += syllabus.sty whiting.logo.small.horizontal.black.eps

include $(shell git rev-parse --show-toplevel)/Makefile.mk

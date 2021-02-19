.PHONY: default
default: packages documentation

packages = $(patsubst %.dtx,%.sty,$(wildcard *.dtx))
documentation = $(patsubst %.dtx,%.pdf,$(wildcard *.dtx))

.PHONY: packages
packages: $(packages)

.PHONY: documentation
documentation: $(documentation) $(packages)

$(packages):
$(documentation): | email.sty theme-doc.sty

include $(shell git rev-parse --show-toplevel)/Makefile.mk

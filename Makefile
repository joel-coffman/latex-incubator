# use Bash as the shell when interpreting the Makefile
SHELL := /bin/bash


packages := $(shell find * -mindepth 1 -name Makefile \
                           -not -path "cookiecutter/*" -exec dirname {} \;)

.PHONY: default
default: $(packages)

.PHONY: $(packages)
$(packages):
	$(MAKE) -C $@

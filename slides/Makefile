.PHONY: default
default: slides.sty slides.pdf

slides.sty:
slides.pdf: | email.sty theme-doc.sty

include $(shell git rev-parse --show-toplevel)/Makefile.mk

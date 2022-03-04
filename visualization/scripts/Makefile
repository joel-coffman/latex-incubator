documents = $(patsubst %.tex,%.pdf,$(wildcard *.tex))

.PHONY: all
all: $(documents)


include $(shell git rev-parse --show-toplevel)/texmf/Makefile.tex

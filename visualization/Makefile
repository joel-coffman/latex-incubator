include $(shell git rev-parse --show-toplevel)/texmf/Makefile.tex

examples:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

$(documentation): | examples

derivatives += $(patsubst %.dtx,%.sty,$(wildcard *.dtx)) \
               tikzlibrarypgfplots.*.code.tex

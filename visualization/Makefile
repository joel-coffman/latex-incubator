documentation := $(patsubst %.dtx,%.pdf,$(wildcard *.dtx))

documents := $(documentation) \
             $(patsubst %.tex,%.pdf,\
                        $(filter-out $(wildcard *.code.tex),$(wildcard *.tex)))

include $(shell git rev-parse --show-toplevel)/texmf/Makefile.tex

examples:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

$(documentation): | examples

derivatives += $(patsubst %.dtx,%.sty,$(wildcard *.dtx)) \
               tikzlibrarypgfplots.*.code.tex

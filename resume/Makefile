include $(shell git rev-parse --show-toplevel)/texmf/Makefile.tex

minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

$(packages): hyperfix.sty
$(documentation): email.sty | minted

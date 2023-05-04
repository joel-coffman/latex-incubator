include $(shell git rev-parse --show-toplevel)/texmf/Makefile.tex

examples:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

$(documentation): email.sty hyperfix.sty minted-doc.sty | examples

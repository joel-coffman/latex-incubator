include $(shell git rev-parse --show-toplevel)/texmf/Makefile.tex

minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

$(documentation): example.pdf
$(documentation): email.sty hyperfix.sty minted-doc.sty theme-doc.sty | minted

example.pdf: beamerouterthemelogo.sty

include $(shell git rev-parse --show-toplevel)/texmf/Makefile.tex

minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

$(documentation): email.sty minted-doc.sty | minted

derivatives += syllabus.sty whiting.logo.small.horizontal.black.eps

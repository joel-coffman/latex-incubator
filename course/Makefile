.PHONY: default
default: course.sty course.pdf

minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

course.sty:
course.pdf: course.sty | minted

include ../Makefile.mk

# define TEX as pdflatex
TEX=pdflatex -shell-escape #-interaction batchmode

# set search path -- because we're using symbolic links to a "generic" Makefile,
# use the path of the referenced file
VPATH=$(shell dirname `readlink Makefile || pwd`) 
DEPENDENCIES=$(shell find ../ -name "*.tex" -or -name "*.eps")

# note that glossary.tex and references.bib are found via VPATH
%.pdf: %.tex $(DEPENDENCIES) $(wildcard *.cls) $(wildcard *.sty)
	$(TEX) -draftmode $*
	# 
	$(TEX) -draftmode $*
	$(TEX) $*

%.cls: %.dtx %.ins
	$(TEX) -draftmode $*
	#
	$(TEX) -draftmode $*.dtx
	$(TEX) $*.dtx

%.sty: %.dtx %.ins hgid.tex
	$(TEX) -draftmode $*.ins
	$(TEX) -draftmode $*.dtx
	makeindex -s gind.ist -o $*.ind $*.idx
	makeindex -s gglo.ist -o $*.gls $*.glo
	$(TEX) -draftmode $*.dtx
	$(TEX) $*.dtx


.PHONY: clean
clean:
	$(RM) *.acn *acr *.alg *.aux *.bbl *.blg *.dvi *.glb *.glx *.glg *.glo *.gls *.ist *.idx *.ind *.ilg *.log *.lof *.lot *.out *.toc
	find . -name "*.bak" -print0 | xargs -0 $(RM)

.PHONY: veryclean
veryclean: clean
	find . -name "*.aux" -print0 | xargs -0 $(RM)
	$(RM) *.pdf

.PHONY: force
force: veryclean default 


HGID:=$(shell hg parents --template "{node|short}" | sed 's/.*/\\\\providecommand{\\hgid}{&}/')

.PHONY: hgstamp
hgid.tex:
	[ -f $@ ] || touch $@
	echo '$(HGID)' | cmp -s $@ - || echo '$(HGID)' > $@


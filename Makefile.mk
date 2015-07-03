# define TEX as pdflatex
TEX=pdflatex -shell-escape #-interaction batchmode

# note that glossary.tex and references.bib are found via VPATH
%.pdf: %.tex $(wildcard *.cls) $(wildcard *.sty)
	$(TEX) -draftmode $*
	if grep -E '^\\@istfilename' $*.aux; then makeglossaries $*; fi
	if grep -E '\\(citation|bibdata|bibstyle)' $*.aux; then bibtex $*; fi
	$(TEX) -draftmode $*
	$(TEX) $*

%.cls: %.dtx %.ins hgversion.tex
	$(TEX) -draftmode $*
	#
	$(TEX) -draftmode $*.dtx
	$(TEX) $*.dtx

%.sty: %.dtx %.ins hgversion.tex
	$(TEX) -draftmode $*.ins
	-grep -E "^No \\@istfilename found in '$*.aux'.$" $*.aux || makeglossaries $*
	-grep -E '\\(citation|bibdata|bibstyle)' $*.aux && bibtex $*
	$(TEX) -draftmode $*.dtx
	makeindex -s gind.ist -o $*.ind $*.idx
	makeindex -s gglo.ist -o $*.gls $*.glo
	$(TEX) -draftmode $*.dtx
	$(TEX) $*.dtx


.PHONY: clean
clean:
	$(RM) *.acn *.acr *.alg *.aux *.bbl *.blg *.dvi *.glb *.glx *.glg *.glo *.gls *.ist *.idx *.ind *.ilg *.log *.lof *.lot *.nav *.out *.snm *.toc
	find . -name "*.bak" -print0 | xargs -0 $(RM)

.PHONY: veryclean
veryclean: clean
	find . -name "*.aux" -print0 | xargs -0 $(RM)
	$(RM) *.pdf

.PHONY: force
force: veryclean default


HGVERSION:=$(shell hg id --id | sed 's/.*/\\\\providecommand{\\hgversion}{&}/')

.PHONY: hgversion
hgversion:
	[ -f $@.tex ] || touch $@.tex
	/bin/echo -e '$(HGVERSION)' | cmp -s $@.tex - || echo '$(HGVERSION)' > $@.tex

hgversion.tex: hgversion

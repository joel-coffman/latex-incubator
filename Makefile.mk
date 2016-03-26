# function to determine the current (included) Makefile
where-am-i = $(CURDIR)/$(word $(words $(MAKEFILE_LIST)), $(MAKEFILE_LIST))
# location of this Makefile (presumably the root directory of a project)
CWD := $(dir $(call where-am-i))

# add texmf directory to TEXINPUTS environment variable to find included files
# (e.g., packages)
export TEXINPUTS := .:$(CWD)texmf//:${TEXINPUTS}

# define TEX as pdflatex
TEX=pdflatex -shell-escape #-interaction batchmode

%.pdf: %.tex $(wildcard *.cls) $(wildcard *.sty) $(CWD)/references.bib
	$(TEX) -draftmode $*
	if sed -n 's/\\@input{\(.*\)}/\1/p' $*.aux | \
	        xargs grep -E '\\(citation)' $*.aux; then bibtex $*; fi
	if grep -E '^\\@istfilename' $*.aux; then makeglossaries $*; fi
	if [ -f $*.idx ]; then makeindex $*; fi
	$(TEX) -draftmode $*
	$(TEX) $*

%.cls: %.dtx %.ins .version.tex
	$(TEX) -draftmode $*
	#
	$(TEX) -draftmode $*.dtx
	$(TEX) $*.dtx

%.sty: %.dtx %.ins .version.tex
	$(TEX) -draftmode $*.ins
	if grep -E '^\\@istfilename' $*.aux; then makeglossaries $*; fi
	if grep -E '\\citation' $*.aux; then bibtex $*; fi
	$(TEX) -draftmode $*.dtx
	makeindex -s gind.ist -o $*.ind $*.idx
	makeindex -s gglo.ist -o $*.gls $*.glo
	$(TEX) -draftmode $*.dtx
	$(TEX) $*.dtx


.PHONY: clean
clean:
	$(RM) *.acn *.acr *.alg *.aux *.bbl *.blg *.dvi *.glb *.glx *.glg *.glo *.gls *.idx *.ind *.ilg *.ist *.log *.lof *.lot *.nav *.out *.snm *.toc *.vrb
	find . -name "*.bak" -print0 | xargs -0 $(RM)

.PHONY: veryclean
veryclean: clean
	$(RM) *.aux *.pdf

.PHONY: force
force: veryclean default


VERSION:=$(shell hg id --id | sed 's/.*/\\\\providecommand{\\\\version}{&}/')

.PHONY: .version
.version:
	[ -f $@.tex ] || touch $@.tex
	$(shell which echo) -e '$(VERSION)' | cmp -s $@.tex - || echo '$(VERSION)' > $@.tex

.version.tex: .version

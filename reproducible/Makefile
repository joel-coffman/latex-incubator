include $(shell git rev-parse --show-toplevel)/texmf/Makefile.tex

minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

$(documentation): | minted

.PHONY: test
test: $(documentation)
	sha1sum $(documentation) > sha1sums
	$(RM) $(documentation)
	$(MAKE) --quiet $(documentation) > /dev/null 2>&1
	sha1sum --check sha1sums && $(RM) sha1sums

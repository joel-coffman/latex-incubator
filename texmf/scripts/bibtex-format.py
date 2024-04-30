#!/usr/bin/env python

import bibtexparser


with open('references.bib', 'r') as f:
    library = f.read()
    library = bibtexparser.parse_string(library)

with open('references_bibtexparser.bib', 'w') as f:
    formatter = bibtexparser.BibtexFormat()
    formatter.indent = '  '
    formatter.block_separator = '\n\n'
    formatter.trailing_comma = True

    library = bibtexparser.write_string(library, bibtex_format=formatter)
    f.write(library)

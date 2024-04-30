#!/usr/bin/env python

import bibtexparser


library = bibtexparser.parse_file('references.bib')

with open('references_bibtexparser.bib', 'w') as f:
    formatter = bibtexparser.BibtexFormat()
    formatter.indent = '  '
    formatter.block_separator = '\n\n'
    formatter.trailing_comma = True

    library = bibtexparser.write_string(library, bibtex_format=formatter)
    f.write(library)

#!/usr/bin/env python

import argparse
import os.path

import bibtexparser


parser = argparse.ArgumentParser(description='Format a BibTeX database')
parser.add_argument('paths', metavar='file', nargs='+', type=str,
                    help='BibTeX database to format')

args = parser.parse_args()

formatter = bibtexparser.BibtexFormat()
formatter.indent = '  '
formatter.block_separator = '\n\n'
formatter.trailing_comma = True

for path in args.paths:
    library = bibtexparser.parse_file(path)

    root, ext = os.path.splitext(path)
    with open(root + '_bibtexparser' + ext, 'w') as f:
        library = bibtexparser.write_string(library, bibtex_format=formatter)
        f.write(library)

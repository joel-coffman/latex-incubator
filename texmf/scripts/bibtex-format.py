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
formatter.block_separator = '\n'
formatter.trailing_comma = True

for path in args.paths:
    # save backup of original file
    with (open(path, 'r') as original,
          open(path + '.bak', 'w') as backup):
        backup.write(original.read())

    # format the original file
    library = bibtexparser.parse_file(path)
    with open(path, 'w') as f:
        library = bibtexparser.write_string(library, bibtex_format=formatter)
        f.write(library)

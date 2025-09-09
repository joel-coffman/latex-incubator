#!/usr/bin/env bash

set -e
set -u
set -x

shopt -s expand_aliases


if ! which bibtex-tidy > /dev/null 2>&1; then
  alias bibtex-tidy='npx bibtex-tidy'
fi


for path in $@; do
  # make backup of original file
  cp "$path" "$path.bak"

  # format the original file
  npx bibtex-tidy --modify \
      --space=2 \
      --blank-lines --no-align \
      --curly --months --remove-empty-fields \
      --sort=key \
      --duplicates=key,doi,citation \
      --trailing-commas \
      "$path"
done

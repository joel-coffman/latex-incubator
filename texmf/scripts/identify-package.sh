#!/usr/bin/env bash

set -e
set -u


# print help message if executed without arguments
if [ $# -lt 1 ]; then
  echo "Usage: $(basename "$0") file [...]"
  exit
fi

# search latest Debian image for file(s)
set -x
docker run --interactive --rm debian:latest /bin/bash <<-SCRIPT
	set -x

	apt update --quiet
	apt install --no-install-recommends --quiet --yes apt-file

	apt-file update
	for file in "$@"; do
	  apt-file search "\$file"
	done
SCRIPT

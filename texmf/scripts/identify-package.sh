#!/bin/bash

set -e
set -u
set -x


docker run --interactive --rm debian:latest /bin/bash <<SCRIPT
set -x

apt update --quiet
apt install --no-install-recommends --quiet --yes apt-file

apt-file update
for file in $*; do
  apt-file search "\$file"
done
SCRIPT

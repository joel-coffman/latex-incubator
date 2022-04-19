#!/bin/bash

set -e
set -u
set -x


docker run --interactive --rm debian:latest /bin/bash <<SCRIPT
set -x

apt update
apt install --no-install-recommends --yes apt-file

apt-file update
for file in $*; do
  apt-file search "\$file"
done
SCRIPT

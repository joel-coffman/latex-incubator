#!/bin/bash

set -e
set -u
set -x


docker run --rm debian:latest /bin/bash -c "
set -x

apt update
apt install --no-install-recommends --yes apt-file

apt-file update
for file in $*; do
  apt-file search "\$file"
done
"

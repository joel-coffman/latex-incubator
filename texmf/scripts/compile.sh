#!/usr/bin/env bash

set -e
set -u
set -x


project="$(mktemp --directory --tmpdir=../)"
cp --recursive --reflink "$(pwd)/." "$project"

docker run --interactive \
        --mount type=bind,source="$(realpath "$project")",target=/project --rm \
		debian:trixie /bin/bash <<-SCRIPT
    set -x

    cd /project

    apt update --quiet
    apt install --no-install-recommends --yes \
            \$(cat .circleci/dependencies/apt.list)

    git config --global --add safe.directory /project

    git clean -f -x

    make --jobs=$(nproc) --output-sync=recurse || make
SCRIPT

rm -rf "$project"

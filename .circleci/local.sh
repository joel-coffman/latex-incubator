#!/usr/bin/env bash

set -e
set -u
set -x


config="$(dirname "$0")/config.yml"

jobs=$@
if [ -z "$jobs" ]; then  # no jobs specified
  if ! pip freeze | grep --quiet PyYAML; then
    pip install --user PyYAML
  fi

  # parse CircleCI configuration for list of jobs
  jobs="$(python - <<-PYTHON
	import yaml

	with open('$config', 'r') as stream:
	    data = yaml.safe_load(stream)

	jobs = data['jobs'].keys()
	print(' '.join(jobs))
PYTHON
  )"
fi

cd "$(git rev-parse --show-toplevel)"
for job in $jobs; do
  circleci local execute --job "$job"
done

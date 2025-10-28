#!/usr/bin/env bash

set -euo pipefail

pushd "${PWD}/setup" > /dev/null

if [[ ! -d './venv' ]]; then
  # venv of latest python 3 version
  python3 -m venv ./venv
fi
source ./venv/bin/activate
pip install -r requirements.txt
ansible-galaxy install -r requirements.yml

echo "Setup successfully completed" >&1
popd > /dev/null

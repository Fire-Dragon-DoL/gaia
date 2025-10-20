#!/usr/bin/env bash

decho() {
  echo "[Hades] " "$@" >&2
}

set -euo pipefail
mkdir -p ~/Code
HADES_REPO_PATH="$(mktemp -d /tmp/hades-XXXXXXXXXX)"
git clone 'https://github.com/Fire-Dragon-DoL/hades.git' "$HADES_REPO_PATH"

decho "Bootstrap succeeded"
exit 0

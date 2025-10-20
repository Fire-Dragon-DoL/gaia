#!/usr/bin/env bash

decho() {
  echo "[Hades] " "$@" >&2
}

set -euo pipefail
mkdir -p ~/Code
git clone git@github.com:Fire-Dragon-DoL/hades.git ~/Code/hades

decho "Bootstrap succeeded"
exit 0

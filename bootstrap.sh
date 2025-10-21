#!/usr/bin/env bash

set -euo pipefail

CHEZMOI_SOURCE_DIR="$HOME/.local/share/chezmoi"
GITHUB_USERNAME="Fire-Dragon-DoL"
CHEZMOI_GITHUB_REPO="https://github.com/$GITHUB_USERNAME/hades.git"

decho() {
  echo "[Hades] " "$@" >&2
}

is-installed() {
  if command -v "$1" &> /dev/null; then
    decho "$1 already installed"
    return 0
  fi

  return 1
}

pacman-install-missing() {
  is-installed "$1" || sudo pacman -S "$1"
}

pacman-install-missing 'chezmoi'
[[ -d "$CHEZMOI_SOURCE_DIR" ]] || chezmoi init "$CHEZMOI_GITHUB_REPO"

decho "Bootstrap succeeded"
exit 0

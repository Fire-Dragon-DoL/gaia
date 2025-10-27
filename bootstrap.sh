#!/usr/bin/env bash

set -euo pipefail

CHEZMOI_SOURCE_DIR="$HOME/.local/share/chezmoi"
GITHUB_USERNAME="Fire-Dragon-DoL"
CHEZMOI_GITHUB_REPO="https://github.com/$GITHUB_USERNAME/gaia.git"

decho() {
  echo "[Gaia] " "$@" >&2
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

is-installed 'wl-copy' || sudo pacman -S 'wl-clipboard'
pacman-install-missing 'chezmoi'
[[ -d "$CHEZMOI_SOURCE_DIR" ]] || chezmoi init "$CHEZMOI_GITHUB_REPO"

mkdir -p ~/.ssh
chmod 0700 ~/.ssh
[[ -f "~/.ssh/id_ed25519" ]] && chmod 0600 "~/.ssh/id_ed25519"
[[ -f "~/.ssh/id_ed25519.pub" ]] && chmod 0644 "~/.ssh/id_ed25519.pub"

decho "Bootstrap succeeded"
exit 0

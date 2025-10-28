#!/usr/bin/env bash

set -euo pipefail

CHEZMOI_SOURCE_DIR="$HOME/.local/share/chezmoi"
GITHUB_USERNAME="Fire-Dragon-DoL"
CHEZMOI_GITHUB_REPO="git@github.com:${GITHUB_USERNAME}/gaia.git"

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

mkdir -p "$HOME/.ssh"
chmod 0700 "$HOME/.ssh"
if [[ ! -f "$HOME/.ssh/id_ed25519" ]]; then
  read -p "Export id_ed25519 and id_ed25519.pub from 1Password into .ssh and press ENTER"
fi
[[ -f "$HOME/.ssh/id_ed25519" ]] && chmod 0600 "$HOME/.ssh/id_ed25519"
[[ -f "$HOME/.ssh/id_ed25519.pub" ]] && chmod 0644 "$HOME/.ssh/id_ed25519.pub"

[[ -d "$CHEZMOI_SOURCE_DIR" ]] || chezmoi init --ssh "$CHEZMOI_GITHUB_REPO"

decho "Bootstrap succeeded"
exit 0

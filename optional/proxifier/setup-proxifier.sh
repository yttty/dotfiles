#!/usr/bin/env bash
set -euo pipefail

PLUGIN_ROOT="${HOME:?HOME must be set}/.plugins"
PROXIFIER_DIR="$PLUGIN_ROOT/proxifier"
mkdir -p -- "$PROXIFIER_DIR"

download_path="$(mktemp "$PROXIFIER_DIR/.proxifier.sh.XXXXXX")"
trap 'rm -f -- "$download_path"' EXIT

curl -fLo "$download_path" \
    https://raw.githubusercontent.com/yttty/dotfiles/main/optional/proxifier/proxifier.sh
mv -fT -- "$download_path" "$PROXIFIER_DIR/proxifier.sh"

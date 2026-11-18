#!/usr/bin/env bash
# Install these hooks into a git repository by pointing core.hooksPath at them.
#
# Usage:
#   ./install.sh [path/to/repo]     # install into one repo (default: current dir)
#   ./install.sh --global           # install for every repo on this machine
#   ./install.sh --uninstall [repo] # remove the setting
set -euo pipefail

HOOKS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/hooks" && pwd)"

chmod +x "$HOOKS_DIR"/* 2>/dev/null || true

case "${1:-}" in
  --global)
    git config --global core.hooksPath "$HOOKS_DIR"
    echo "Installed globally: core.hooksPath=$HOOKS_DIR"
    ;;
  --uninstall)
    repo="${2:-.}"
    git -C "$repo" config --unset core.hooksPath || true
    echo "Uninstalled from $repo"
    ;;
  -h|--help)
    sed -n '2,8p' "$0"
    ;;
  *)
    repo="${1:-.}"
    git -C "$repo" rev-parse --git-dir >/dev/null
    git -C "$repo" config core.hooksPath "$HOOKS_DIR"
    echo "Installed into $repo: core.hooksPath=$HOOKS_DIR"
    ;;
esac

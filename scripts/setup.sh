#!/bin/bash

set -euo pipefail

# Verify command line argument is passed
if [ $# -eq 0 ]; then
  echo "No OS provided - usage: $0 (ubuntu|rocky|mac)"
  exit 1
fi

# Check provided OS is allowed
OS="$1"
case "$OS" in
  ubuntu|rocky|mac)
    echo "Running setup with OS: $OS"
    ;;
  *)
    echo "Unsupported OS provided, expected (ubuntu|rocky|mac)"
    exit 1
    ;;
esac

# Change to the .dotfiles directory
cd "$(dirname $0)/.."

# Check if necessary programs are installed
./scripts/helpers/check_installs.sh $OS

# Symlink dotfiles into home directory
stow .

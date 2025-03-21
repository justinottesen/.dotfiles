#!/bin/bash

set -euo pipefail

# Change to the .dotfiles directory
cd "$(dirname $0)/.."

# Check if necessary programs are installed
./scripts/helpers/check_installs.sh

# Symlink dotfiles into home directory
stow .
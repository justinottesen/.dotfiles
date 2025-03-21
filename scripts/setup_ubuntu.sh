#!/bin/bash

set -euxo pipefail

# Change to the .dotfiles directory
cd "$(dirname $0)/.."

# Symlink dotfiles into home directory
stow .
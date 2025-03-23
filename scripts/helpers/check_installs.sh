#!/bin/bash

set -euo pipefail

# OS="$1" # Checked in 'setup.sh', assumed to be valid here, maybe used later

# Commands which can be checked with a simple 'command -v' call
declare -a PROGRAMS=(
  # Required for setup
  "git"
  "stow"
  # General development
  "tmux"
  "zsh"
  "make"
  # C/C++ development
  "gcc"
  "clang"
  "clang-format"
  "clang-tidy"
  "cmake"
  # Neovim & dependencies
  "nvim"
  "unzip"
  "rg"
)

for prog in "${PROGRAMS[@]}"
do
  command -v "$prog" >/dev/null 2>&1 || { echo >&2 "$prog is not installed. Aborting."; exit 1; }
done

# Other installs which need to be specially checked

# Oh My Zsh
if [ ! -d ~/.oh-my-zsh ]; then
  echo "Oh My Zsh is not installed. Aborting."; exit 1;
fi

#!/bin/bash

set -euo pipefail

# OS="$1" # Checked in 'setup.sh', assumed to be valid here, maybe used later

declare -a PROGRAMS=(
  # Not sure how you even have this without git
  "git"
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

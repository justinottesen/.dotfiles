#!/bin/bash

set -euo pipefail

declare -a PROGRAMS=(
  "git"
  "clang-format"
)

for prog in "${PROGRAMS[@]}"
do
  command -v "$prog" >/dev/null 2>&1 || { echo >&2 "$prog is not installed. Aborting."; exit 1; }
done
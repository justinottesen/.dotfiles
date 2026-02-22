# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Ensure env vars exist if there isn't a login shell
[[ -r "$HOME/.config/shell/env" ]] && . "$HOME/.config/shell/env"

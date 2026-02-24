# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Ensure env vars exist if there isn't a login shell
[[ -r "$HOME/.config/shell/env" ]] && . "$HOME/.config/shell/env"

# Create a .bashrc-extra to have untracked machine specific options
[ -f "$HOME/.bashrc-extra" ] && . "$HOME/.bashrc-extra"

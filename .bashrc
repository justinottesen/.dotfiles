#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Silence deprecation warning on MacOS
export BASH_SILENCE_DEPRECATION_WARNING=1

# Set default editor to neovim
export VISUAL="nvim"
export EDITOR="$VISUAL"

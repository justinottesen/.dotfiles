[ -r "$HOME/.profile" ] && . "$HOME/.profile"

# Create a .bash_profile-extra to have untracked machine specific options
[ -f "$HOME/.bash_profile-extra" ] && . "$HOME/.bash_profile-extra"

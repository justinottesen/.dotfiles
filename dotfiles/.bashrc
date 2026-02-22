
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set default editor to neovim
export VISUAL="nvim"
export EDITOR="$VISUAL"

# Set CMake preferences
export CMAKE_GENERATOR=Ninja
export CMAKE_EXPORT_COMPILE_COMMANDS=ON

# Use ccache and clang
export CC="ccache clang"
export CXX="ccache clang++"

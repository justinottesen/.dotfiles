{ config, pkgs, lib, ... }:

let
  repo = "${config.home.homeDirectory}/nixos-dotfiles";
in {
  # Base user info
  home = {
    username = "justin";
    homeDirectory = "/home/justin";
  };

  # Instead of using nix to configure everything and locking us into NixOS, we
  # use regular dotfiles for configuring.
  home.activation = {
    # Stow the dotfiles from this repo to their expected paths
    stowDotfiles = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      set -euo pipefail
      export STOW_BIN="${pkgs.stow}/bin/stow"
      ${pkgs.bash}/bin/bash ${toString repo}/scripts/stow-dotfiles
    '';
    # Symlink the scripts dir into the .local/bin dir
    symlinkScripts = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      set -euo pipefail
      ${pkgs.bash}/bin/bash ${toString repo}/scripts/symlink-scripts
    '';
  };

  # However, some things are nix specific, we want those still
  home.file.".config/shell/nix-extra-env".text = ''
    export PKG_CONFIG_PATH="/etc/profiles/per-user/${config.home.username}/lib/pkgconfig";
  '';

  # We still use nixos for the packages we install for reproducibility
  home.packages = with pkgs; [
    # Basic install requirements
    git
    stow
    gnumake
    gnutar

    # Development packages
    ccache
    ninja
    gtest.dev
    sqlite
    sqlite.dev
    pkg-config
    tree
    claude-code
    gh
    tmux
    valgrind
    (pkgs.fenix.complete.withComponents [
      "cargo"
      "rustc"
      "rust-src"
      "rustfmt"
      "clippy"
    ])
    # gcc, clang and CMake are system packages

    # CLI Web access
    curl
    wget

    # Fonts
    nerd-fonts.jetbrains-mono

    # Neovim & dependencies
    neovim
    fd
    lua5_1
    luarocks
    tree-sitter
    ripgrep

    # Language Servers
    bash-language-server
    clang-tools
    lua-language-server
    cmake-language-server
    pkgs.fenix.complete.rust-analyzer

    # Web browsers
    google-chrome
    firefox

    # OS Dev
    qemu
    nasm
    asm-lsp
  ];

  # Other config options
  fonts.fontconfig.enable = true;
  
  # DO NOT CHANGE - see configuration.nix
  home.stateVersion = "25.11";
}

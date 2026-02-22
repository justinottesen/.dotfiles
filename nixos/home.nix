{ config, pkgs, lib, ... }:

let
  repo = "${config.home.homeDirectory}/nixos-dotfiles";
in {
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

  # We still use nixos for the packages we install for reproducibility
  home.packages = with pkgs; [
    # Basic install & development requirements
    git
    stow
    # gcc and clang are system packages

    # Neovim & dependencies
    neovim
    lua5_1
    luarocks
    ripgrep
  ];
  
  # DO NOT CHANGE - see configuration.nix
  home.stateVersion = "25.11";
}

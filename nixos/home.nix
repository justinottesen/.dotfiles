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
  home.activation.stowDotfiles = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    set -euo pipefail
    export STOW_BIN="${pkgs.stow}/bin/stow"
    ${pkgs.bash}/bin/bash ${toString repo}/scripts/stow-dotfiles
  '';

  # We still use nixos for the packages we install for reproducibility
  home.packages = with pkgs; [
    git
    neovim
    stow
  ];
  
  # DO NOT CHANGE - see configuration.nix
  home.stateVersion = "25.11";
}

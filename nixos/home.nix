{ config, pkgs, lib, ... }:

let
  repo = "${config.home.homeDirectory}/nixos-dotfiles";
  dotfiles = "dotfiles";
in {
  home = {
    username = "justin";
    homeDirectory = "/home/justin";
    packages = with pkgs; [
      git
      neovim
      stow
    ];
  };

  home.activation.stowDotfiles = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    set -euo pipefail

    ${pkgs.stow}/bin/stow \
      --dir "${toString repo}" \
      --target "$HOME" \
      --restow \
      "${toString dotfiles}"
  '';

  # DO NOT CHANGE - see configuration.nix
  home.stateVersion = "25.11";
}

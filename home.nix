{ config, pkgs, ... }:

{
  home.username = "justin";
  home.homeDirectory = "/home/justin";

  programs.git = {
    enable = true;
    userName = "Justin Ottesen";
    userEmail = "justinottesen@gmail.com";
  };

  # DO NOT CHANGE - see configuration.nix
  home.stateVersion = "25.11";
}

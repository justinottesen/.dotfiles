{ config, pkgs, ... }:

{
  home.username = "justin";
  home.homeDirectory = "/home/justin";

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Justin Ottesen";
        email = "justinottesen@gmail.com";
      };
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };
  };

  # DO NOT CHANGE - see configuration.nix
  home.stateVersion = "25.11";
}

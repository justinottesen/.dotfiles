{ config, pkgs, ... }:

{

  home = {
    username = "justin";
    homeDirectory = "/home/justin";
  };

  programs = {
    git = {
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
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
    };
  };

  # DO NOT CHANGE - see configuration.nix
  home.stateVersion = "25.11";
}

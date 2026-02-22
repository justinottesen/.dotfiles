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
    nixvim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      colorschemes.catppuccin.enable = true;
      plugins.lualine.enable = true;
    };
    ripgrep.enable = true;
  };

  # DO NOT CHANGE - see configuration.nix
  home.stateVersion = "25.11";
}

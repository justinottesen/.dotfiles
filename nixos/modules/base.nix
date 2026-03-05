{ config, lib, pkgs, ... }:

{
  # Clean up old NixOS generations
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  security.sudo.wheelNeedsPassword = true;
  users.users.justin = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    python3
    cmake
    clang
    gcc
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}

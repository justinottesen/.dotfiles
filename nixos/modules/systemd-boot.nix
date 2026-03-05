{ config, lib, pkgs, ... }:

{
  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 5;
    };
    efi.canTouchEfiVariables = true;
  };

  # Make the boot default the newest
  systemd.services.clear-systemd-boot-default = {
    description = "Clear systemd-boot EFI default so newest NixOS generation is default";
    wantedBy = [ "multi-user.target" ];

    unitConfig.RequiresMountsFor = [ "/boot" ];
    after = [ "local-fs.target" ];

    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.systemd}/bin/bootctl set-default \"\"";
    };
  };


}

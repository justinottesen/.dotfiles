{
  description = "NixOS system by Justin Ottesen";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    mkHost = hostName: nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ({ ... }: {
          system.configurationRevision =
	        if self ? rev then builtins.substring 0 20 self.rev
	        else if self ? dirtyRev then "dirty-" + builtins.substring 0 20 self.dirtyRev
	        else "dirty";
	    })

        ./hosts/${hostName}/default.nix

        home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.justin = import ./home/base.nix;
            backupFileExtension = "backup";
          };
        }
      ];
    };
  in {
    nixosConfigurations = {
      nixos-thinkpad = mkHost "nixos-thinkpad";
    };
  };
}

{
  description = "NixOS system by Justin Ottesen";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixvim, ... }: {
    nixosConfigurations.nixos-thinkpad = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ({ ... }: {
          system.configurationRevision =
	    if self ? rev then builtins.substring 0 20 self.rev
	    else if self ? dirtyRev then "dirty-" + builtins.substring 0 20 self.dirtyRev
	    else "dirty";
	})
        ./configuration.nix
        home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.justin = import ./home.nix;
            backupFileExtension = "backup";
	    sharedModules = [
              nixvim.homeModules.nixvim
	    ];
          };
        }
      ];
    };
  };
}

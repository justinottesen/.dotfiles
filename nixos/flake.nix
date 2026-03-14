{
  description = "NixOS system by Justin Ottesen";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";

    # We get most of our packages from home-manager
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # claude-code is new and constanly getting updates, we want them
    claude-code = {
      url = "github:sadjow/claude-code-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nightly Rust toolchains
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, claude-code, fenix, ... }:
  let
    mkHost = hostName: nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ({ ... }: {
          # Tie the commit hash to the generation
          system.configurationRevision =
	        if self ? rev then builtins.substring 0 20 self.rev
	        else if self ? dirtyRev then "dirty-" + builtins.substring 0 20 self.dirtyRev
	        else "dirty";

          # Set overlays for specific packages
          nixpkgs.overlays = [ claude-code.overlays.default fenix.overlays.default ];
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
      nixos-desktop = mkHost "nixos-desktop";
    };
  };
}

{
  description = "My personal Nix flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, nix-darwin, home-manager, ... }: {
    darwinConfigurations.ooj = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        { system.stateVersion = 5; }
        home-manager.darwinModules.home-manager {
          users.users.ooj = import ./home.nix;
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
          };
        }
      ];
    };
  };
}

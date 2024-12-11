{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, home-manager, nix-darwin, nixpkgs }:
  let
    # Import the external configuration
    configurationPath = ./darwin/configuration.nix;
    homeManagerConfigurationPath = ./darwin/home.nix;
  in
  {
    darwinConfigurations."ooj" = nix-darwin.lib.darwinSystem {
      # Include both nix-darwin and home-manager modules
      modules = [
        configurationPath
        homeManagerConfigurationPath
        home-manager.nixosModules.home-manager
      ];

      # Pass Home Manager-specific options
      specialArgs = {
        inherit (home-manager) lib;
      };
    };
  };
}
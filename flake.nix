{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    # Import the external configuration
    configurationPath = ./darwin/configuration.nix;
  in
  {
    darwinConfigurations."ooj" = nix-darwin.lib.darwinSystem {
      # Reference the external configuration file
      modules = [ configurationPath ];
    };
  };
}
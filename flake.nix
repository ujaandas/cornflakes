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
  {
    darwinConfigurations = {
      macbook = nix-darwin.lib.darwinSystem {
        modules = [
          ./darwin/macbook.nix
          ./shared/modules/shell.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.ooj = import ./home.nix;
          }
        ];
      };
    };
  # let
  #   # Import the external configuration
  #   configurationPath = ./darwin/configuration.nix;
  #   homeManagerConfigurationPath = ./home.nix;
  # in
  # {
  #   darwinConfigurations."ooj" = nix-darwin.lib.darwinSystem {
  #     # Include both nix-darwin and home-manager modules
  #     modules = [
  #       configurationPath
  #       # homeManagerConfigurationPath
  #       home-manager.darwinModules.home-manager
  #       {
  #           home-manager.useGlobalPkgs = true;
  #           home-manager.useUserPackages = true;
  #           home-manager.users.ooj = import homeManagerConfigurationPath;
  #       }
  #     ];
  #   };
  # };
  };
}
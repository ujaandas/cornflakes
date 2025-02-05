{
  description = "Example nix-darwin system flake";

  inputs = {
    # Giant monorepo with packages and software 
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # System-level software and system settings
    nix-darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Config and home directory linking
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # Destructure inputs for readability
  outputs = inputs@{ self, home-manager, nix-darwin, nixpkgs }: 
  {
    darwinConfigurations = {
      ooj = let 
        username = "ooj";
        homeDirectory = "/Users/ooj";
        pkgs = nixpkgs;
        specialArgs = { inherit username homeDirectory; };
      in
      nix-darwin.lib.darwinSystem {
        inherit specialArgs;
        modules = [
          ./users
          ./hosts/macbook.nix
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = inputs // specialArgs;
              users.${username} = import ./users/${username}/home.nix;
            };
          }
        ];
      };
    };
  };
}

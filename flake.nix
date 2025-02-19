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

    # Age encrypted secrets
    agenix.url = "github:ryantm/agenix";
  };

  # Destructure inputs for readability
  outputs = inputs@{ self, home-manager, nix-darwin, agenix, nixpkgs }: {
    darwinConfigurations = {
      ooj =
        let
          username = "ooj";
          homeDirectory = "/Users/ooj";
          specialArgs = { inherit username homeDirectory inputs; };
        in
        nix-darwin.lib.darwinSystem {
          inherit specialArgs;
          modules = [
            ./users
            ./hosts/macbook
            agenix.nixosModules.default
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

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
  outputs = inputs@{ self, nixpkgs, nix-darwin, home-manager, agenix }: {
    templates = import ./templates;
    darwinConfigurations =
      let
        users = [ "ooj" "alice" "bob" ];
        systems = [ "macbook" "imac" "mac-mini" ];

        # TODO: add mkUser and mkSystem builders

        generateCombination = user: system: {
          name = "${user}-${system}";
          value = {
            username = user;
            system = system;
          };
        };

        combinations = builtins.listToAttrs
          (builtins.concatMap
            (user:
              builtins.map
                (system: generateCombination user system)
                systems
            )
            users
          );

        createSystemConfig = value: inputs:
          nix-darwin.lib.darwinSystem {
            specialArgs = { inherit inputs; username = value.username; };
            modules = [
              ./hosts/${value.system}
              ./users/${value.username}
              agenix.nixosModules.default
              home-manager.darwinModules.home-manager
            ];
          };
      in
      builtins.mapAttrs (_: value: createSystemConfig value inputs) combinations;
  };
}

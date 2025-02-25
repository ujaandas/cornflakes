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
  outputs = { self, nixpkgs, nix-darwin, home-manager, agenix }: {
    darwinConfigurations =
      let
        users = [ "ooj" "alice" "bob" ];
        systems = [ "macbook" "imac" "mac-mini" ];

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

        createSystemConfig = { name, value }: inputs:
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
      builtins.mapAttrs (name: value: createSystemConfig { name = name; value = value; } { nixpkgs = nixpkgs; nix-darwin = nix-darwin; home-manager = home-manager; agenix = agenix; }) combinations;
  };
}

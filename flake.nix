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
      ooj = let 
        username = "ooj";
        system = "aarch64-darwin";
        pkgs = inputs.nixpkgs.packages.${system};
        specialArgs = { inherit username pkgs system; };
      in
      nix-darwin.lib.darwinSystem {
        inherit specialArgs;

        modules = [
          ./devices/darwin/macbook.nix
          ./users/${username}/config.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = inputs // specialArgs;
            # home-manager.users.${username} = import ./users/${username}/home.nix // import ./home;
            home-manager.users.${username} = import ./home/default.nix {
              inherit pkgs username system;
            };
          }
        ];
      };
    };
  };
}
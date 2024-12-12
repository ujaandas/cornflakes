{ username, pkgs, ... }:

{
  home.stateVersion = "23.05";
  imports = [ 
    ./shared.nix { inherit pkgs; }
    ../users/ooj/home.nix { inherit pkgs; }
    ../devices/macbook/home.nix
  ];

  programs.home-manager.enable = true;
}
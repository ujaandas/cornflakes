{ config, pkgs, ... }:

let
  shared = import ./shared.nix { inherit pkgs; };
  user = import ../users/ooj.nix { inherit pkgs; };
in
{
  home.stateVersion = "23.05";
  imports = [ shared user device ];

  programs.home-manager.enable = true;
}
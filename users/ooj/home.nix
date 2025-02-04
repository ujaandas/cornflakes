{ pkgs, ... }:

{
  imports = [ ../common.nix ./modules/zsh.nix ./modules/git.nix ];
}

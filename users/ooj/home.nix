{ pkgs, ... }:

{
  imports = [ ../common.nix ./zsh/default.nix ];

  home.username = "ooj";
  home.homeDirectory = "/Users/ooj";

  programs.git = {
    enable = true;
    userName = "Ujaan Das";
    userEmail = "ujaandas03@gmail.com";
  };

  programs.zsh = import ./zsh/default.nix { inherit pkgs; };
}

{ pkgs, ... }:

{
  imports = [ ./common.nix ];

  home.username = "ooj";
  home.homeDirectory = "/Users/ooj";

  programs.git = {
    enable = true;
    userName = "Ujaan Das";
    userEmail = "ujaandas03@gmail.com";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;
    syntaxHighlighting.enable = true;
    plugins = [];
  };
}

{ pkgs, ... }:

{
  imports = [
    ../../home/shared.nix
  ];

  home = {
    username = "ooj";
    homeDirectory = "/Users/ooj";
  };

  programs = {
    
    git = {
      enable = true;
      userName = "Ujaan Das";
      userEmail = "ujaandas03@gmail.com";
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      enableVteIntegration = true;
      syntaxHighlighting.enable = true;
      plugins = [];
    };
  };
}

{ pkgs, ... }:

{
  home.username = "ooj";
  home.homeDirectory = "/Users/ooj";

  home.packages = with pkgs; [
    zsh
    starship
    git
  ];

  programs.zsh = {
    enable = true;
    ohMyZsh.enable = true;
  };

  programs.starship = {
    enable = true;
  };

  # User-specific dotfiles
  home.file.".gitconfig".text = ''
    [user]
      name = "ooj"
      email = "ooj@example.com"
  '';
}
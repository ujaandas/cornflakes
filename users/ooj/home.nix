{ pkgs, ... }:

{
  imports = [ ../common.nix ./modules/zsh.nix ./modules/git.nix ];

  home.packages = with pkgs; [
    zoxide
    tldr
    scc
    eza
    duf
    bat
    fzf
    navi
    lazygit
    lazydocker
    httpie
  ];
}

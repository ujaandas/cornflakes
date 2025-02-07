{ pkgs, ... }:

{
  imports = [ ../common.nix ./modules/zsh.nix ./modules/git.nix ./modules/tmux/tmux.nix ./modules/wezterm/wezterm.nix ];

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

{ pkgs, username, ... }:

{
  imports = [
    ../common.nix
    ./programs/zsh.nix
    ./programs/git.nix
    ./programs/tmux/tmux.nix
    ./programs/wezterm/wezterm.nix
    ./programs/nvim/nvim.nix
  ];

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

{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    terminal = "tmux-256color";
    historyLimit = 50000;
    prefix = "C-b";
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      tmux-which-key
      tokyo-night-tmux   
    ];
    extraConfig = builtins.readFile ./tmux.conf;
  };
}

{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    terminal = "tmux-256color";
    historyLimit = 50000;
    prefix = "C-b";
    plugins = with pkgs; [
      # No plugins, they're all dumb
    ];
    extraConfig = builtins.readFile ./tmux.conf;
  };
}

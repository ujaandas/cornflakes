{ pkgs, ... }:

{
  enable = true;
  enableCompletion = true;
  enableVteIntegration = true;
  syntaxHighlighting.enable = true;
  autocd = true;
  autosuggestion.enable = true;
  oh-my-zsh = {
    enable = true;
    theme = "robbyrussell";
    plugins = ["git" "sudo"];
  };
  plugins = [
    {
      name = "powerlevel10k";
      src = pkgs.zsh-powerlevel10k;
      file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    }
    {
      name = "powerlevel10k-config";
      src = ./p10k;
      file = "p10k.zsh";
    }
  ];
  shellAliases = {
    ll = "ls -l";
    nixup = "nix run nix-darwin --extra-experimental-features nix-command --extra-experimental-features flakes -- switch --flake ~/.config/nix";
  };
  history.size = 10000;
}

{ pkgs, ... }:

{
  programs.zsh = {
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
    ];
    initExtra = ''
      source ~/.p10k.zsh
      eval "$(zoxide init zsh)"

      # Override ls with exa
      function ls {
        exa --icons "$@"
      }

      # Use brew for GUI apps
      eval "$(/opt/homebrew/bin/brew shellenv)"
    '';
    shellAliases = {
      ll = "ls -l";
      cd = "z";
      nixup = "nix run nix-darwin --extra-experimental-features nix-command --extra-experimental-features flakes -- switch --flake ~/.config/nix";
    };
    history.size = 10000;
  };
}

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
      plugins = ["git" "sudo" "direnv"];
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
      # CLI tool overlays
      ll = "ls -l";
      cd = "z";
      
      # Nix shorthands
      snowrun = "nix run nix-darwin --extra-experimental-features nix-command --extra-experimental-features flakes -- switch --flake ~/.config/nix";
      snowhome = "home-manager switch --flake ~/.config/nix#$(whoami)";
      snowup = "nix flake update --recreate-lock-file";
      snowcl = "nix-collect-garbage -d";
      snowli = "nix-env -q";
      snowroll = "nix-env --rollback";
    };
    history.size = 10000;
  };
}

{pkgs, ...}: 

{
  imports = [
    ../../home/shared.nix
  ];
  
  programs.git = {
    enable = true;
    userName = "Ujaan Das";
    userEmail = "ujaandas03@gmail.com";
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };
  home.file = {
    ".zshrc".text = ''
      # Conda initialization
      # >>> conda initialize >>>
      # !! Contents within this block are managed by 'conda init' !!
      __conda_setup="$('/Users/ooj/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
      if [ $? -eq 0 ]; then
          eval "$__conda_setup"
      else
          if [ -f "/Users/ooj/miniconda3/etc/profile.d/conda.sh" ]; then
              . "/Users/ooj/miniconda3/etc/profile.d/conda.sh"
          else
              export PATH="/Users/ooj/miniconda3/bin:$PATH"
          fi
      fi
      unset __conda_setup
      # <<< conda initialize <<<
    '';
  };
} 
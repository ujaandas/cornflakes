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
  };
  home.file = {
    ".zshrc".text = ''
      export ZSH_THEME="powerlevel10k/powerlevel10k"
      source ~/.zshrc
    '';
  };
} 
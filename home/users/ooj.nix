{ pkgs, ... }:

{
  imports = [
    ../modules
  ];

  home.username = "ooj";
  home.homeDirectory = "/Users/ooj";

  home.packages = with pkgs; [
    zsh
    starship
    git
  ];

  programs.zsh = {
    enable = true;
    ohMyZsh.enable = true;
  };

  programs.starship = {
    enable = true;
  };

  # User-specific dotfiles
  home.file.".gitconfig".text = "
  [user]
	name = Ujaan Das
	email = ujaandas03@gmail.com
[init]
	defaultBranch = main
[color]
	ui = auto
[pull]
	rebase = false
[core]
	excludesfile = /Users/ooj/.gitignore_global
	editor = code --wait
";
}

{ pkgs, ... }:

{
  imports = [
    ../../shared-modules
    ./modules
  ];

  home.username = "ooj";
  home.homeDirectory = "/Users/ooj";

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

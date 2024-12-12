{ pkgs, ... }:

{
  home.packages = with pkgs; [ git vim htop ];
  home.sessionVariables = {
    EDITOR = "vim";
    PATH = "${pkgs.coreutils}/bin:${pkgs.findutils}/bin:${pkgs.gnugrep}/bin";
  };
}
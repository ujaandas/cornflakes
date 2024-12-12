{ pkgs, ... }:

{
  services.bluetooth.enable = true;
  hardware.apple.enable = true;

  home.packages = with pkgs; [ firefox alacritty ];
}
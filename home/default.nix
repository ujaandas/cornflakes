{ config, pkgs, ... }:

{
  home.stateVersion = "23.05";
  imports = [ 
    import ./shared.nix
    import ../users/ooj/home.nix
    # import ../devices/macbook/home.nix
  ];

  programs.home-manager.enable = true;
}
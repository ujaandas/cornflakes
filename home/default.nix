{ config, pkgs, ... }:

{
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # Import the user-specific configuration from home/ooj.nix
  imports = [
    ./home/shared-modules
    ./home/users/ooj
  ];

  # Additional configurations can go here
  home.packages = [
    # Additional packages
  ];

  home.file = {
    # Additional dotfiles
  };

  home.sessionVariables = {
    # Additional session variables
  };

  programs.home-manager.enable = true;
}

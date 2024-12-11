{ pkgs, lib, ... }: {
  # Enable Home Manager
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  # Define Home Manager configuration for your user
  home-manager.users.ooj = {
    # Home Manager's user packages
    home.packages = [
      pkgs.neovim
      pkgs.htop
    ];

    # Enable Zsh as the shell
    programs.zsh.enable = true;

    # Configure Git
    programs.git = {
      enable = true;
      userName = "Your Name";
      userEmail = "your.email@example.com";
    };

    # Example: Set up XDG configuration files
    xdg.configFile."keybindings/custom.conf".text = ''
      # Custom keybindings go here
    '';
  };
}
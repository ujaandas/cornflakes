{ pkgs, ... }: 
{
  imports = [
    ./common.nix
  ];

  # Set Git commit hash for darwin-version.
  system.configurationRevision = null;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  environment.systemPackages = with pkgs; [
    
  ];

  # Use homebrew ONLY to install GUI apps
  homebrew = {
    enable = true;
    brews = [];
    casks = [
      "firefox"
      "google-chrome"
      "wezterm"
      "visual-studio-code"
    ];
    taps = [];
    onActivation.cleanup = "zap";
  };
}
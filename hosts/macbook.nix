{ pkgs, ... }: 
{
  imports = [
    ./common.nix
  ];

  # Set Git commit hash for darwin-version.
  system.configurationRevision = null;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Dev stuff here
  environment.systemPackages = with pkgs; [
  ];

  # Use homebrew ONLY to install GUI apps
  homebrew = {
    enable = true;
    brews = []; # This should be EMPTY! All GUI apps are casks
    casks = [
      # "firefox"
      # "google-chrome"
      "wezterm"
      # "visual-studio-code"
    ];
    taps = [];
    onActivation.cleanup = "zap";
  };

  system = {
    # So no need to relog each time
    activationScripts.postUserActivation.text = ''
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';
    
    # MacOS preferences
    defaults = {
      dock.autohide = true;
      menuExtraClock.Show24Hour = true;
    };
  };

  # Use fingerprint for sudo
  security.pam.enableSudoTouchIdAuth = true;
}
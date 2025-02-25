{ pkgs, ... }:
{
  # Set Git commit hash for darwin-version.
  system.configurationRevision = null;

  nix.settings = {
    trusted-users = [ "ooj" ]; # root is added by default
  };

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Dev stuff here
  environment.systemPackages = with pkgs; [
  ];

  # Use homebrew ONLY to install GUI apps
  homebrew = {
    enable = true;
    brews = [
      "mongodb-community@8.0"
    ]; # This should be EMPTY! All GUI apps are casks
    casks = [
      # "firefox"
      # "google-chrome"
      "wezterm"
      "tailscale"
      # "visual-studio-code"
    ];
    taps = [
      "mongodb/brew"
    ];
    onActivation.cleanup = "zap";
  };

  system = {
    # So no need to relog each time
    activationScripts.postUserActivation.text = ''
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';

    # MacOS preferences
    defaults = {
      # dock settings
      dock.autohide = true;
      dock.enable-spring-load-actions-on-all-items = true;
      # mouse settings
      # ".GlobalPreferences"."com.apple.mouse.scaling" = -1;
      # trackpad settings

    };
  };

  # Use fingerprint for sudo
  security.pam.enableSudoTouchIdAuth = true;
}

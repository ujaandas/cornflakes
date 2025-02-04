{ pkgs, ... }: 
{
  imports = [
    ./common.nix
  ];

  # Set Git commit hash for darwin-version.
  system.configurationRevision = null;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
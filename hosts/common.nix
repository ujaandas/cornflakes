{ pkgs, ... }: 
{
  services.nix-daemon.enable = true;
  nix.settings.experimental-features = "nix-command flakes";
  system.stateVersion = 5;
  
  environment.systemPackages = with pkgs; [
    # terminal
    tree
    curl
    fd

    # ssh
    openssh
    ssh-copy-id

    # archive
    xz
    zstd

    # media
    ffmpeg
  ];
}
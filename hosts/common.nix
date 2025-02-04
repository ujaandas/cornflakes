{ pkgs, ... }: 
{
  services.nix-daemon.enable = true;
  nix.settings.experimental-features = "nix-command flakes";
  system.stateVersion = 5;
  
  environment.systemPackages = with pkgs; [
    tree
    curl
    fd
    openssh
    ssh-copy-id
    xz
    zstd
    ffmpeg
    jetbrains-mono
    meslo-lgs-nf
  ];
}
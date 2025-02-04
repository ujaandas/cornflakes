{ pkgs, ... }: 
{
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
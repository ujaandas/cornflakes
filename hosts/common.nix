{ pkgs, inputs, ... }:
{
  services.nix-daemon.enable = true;
  nix.settings = {
    experimental-features = "nix-command flakes";
  };
  system.stateVersion = 5;

  # Useful CLI apps, nothing heavy here
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
    git
    tmux
    neovim
    htop
    coreutils
    nmap
    direnv
    nixpkgs-fmt
    devenv
    inputs.agenix.packages."${system}".default
  ];
}

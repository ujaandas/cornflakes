# Flakemanity

This is my attempt at a clean, modular, and straightforward-enough (for me) Nix setup.

## File Structure

- `flake.nix`: This is the entry point for the setup. It defines the flake, including its inputs, outputs, and the configurations for different systems and users.
- `hosts/`: The hosts directory "hosts" system-level configuration for my devices.
  - `common.nix`: Common and vital packages to be used across all systems.
  - `macbook.nix`: Core settings and packages for my macbook, to be used by all users (not specific to just me!).
- `users/`: The users directory contains configurations that are unique to each user, such as environment settings, personal application configurations, and any other customizations for the user's environment that overlay the system.
  - `ooj/`
    - `home.nix`: I define what packages I want for my user here.
    - `modules/*.nix`: Any user-specific customizations I need to make, I make here and import in my home.nix.
  - `default.nix`: This holds basic information for each available user for the Flake to interface with.

## Applying the Configuration

To apply the configuration, use the following command:

```sh
nix run nix-darwin --extra-experimental-features nix-command --extra-experimental-features flakes -- switch --flake ~/.config/nix
```

Rebuild the configuration:

```sh
darwin-rebuild switch --flake ~/.config/nix
```

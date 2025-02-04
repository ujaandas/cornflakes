# Flakemanity

This setup uses Nix Flakes to manage system configurations and user environments on macOS. Below is a brief explanation of each section and the steps to apply the configuration.

## File Structure

- `flake.nix`: This is the entry point for my Nix setup. It defines the Flake, including its inputs, outputs, and the configurations for different systems.
- `home/shared.nix`: This file is used for configurations and settings that are common across all users and machines. It includes general application settings, environment variables, and default package installations that should be available to every user.
- `hosts/macbook.nix`: This file is specific to my MacBook. It contains machine-specific configurations, hardware settings, system-wide applications, and other host-specific tweaks.
- `users/ooj/home.nix`: This file is user-specific and contains configurations that are unique to me. This includes environment settings, personal application configurations, and any other customizations for the user's environment that overlay the system.

## Applying the Configuration

To apply the configuration, use the following command:

```sh
nix run nix-darwin --extra-experimental-features nix-command --extra-experimental-features flakes -- switch --flake ~/.config/nix
```

Rebuild the configuration:

```sh
darwin-rebuild switch --flake ~/.config/nix
```

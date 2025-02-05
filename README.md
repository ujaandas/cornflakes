# Snowy ❄️

This is my attempt at a clean, modular, and straightforward-enough (for me) Nix setup, making use of flakes, nix-darwin and home-manager.

## File Structure

- `flake.nix`: Defines all inputs, outputs, and configurations for different systems and users.
- `hosts/`: System-level configuration for my devices.
  - `common.nix`: Common and vital packages to be used across all systems.
  - `macbook.nix`: Core settings and packages for my macbook, to be used by all users (not specific to just me!).
- `users/`: Configurations that are unique to each user, such as environment settings, personal application configurations, and any other customizations for the user's environment that overlay the system.
  - `ooj/`: Me!
    - `home.nix`: I define what packages I want here.
    - `modules/*.nix`: Any user-specific package customizations I need to make, I make here and then import in my `home.nix`.
  - `default.nix`: This holds basic information for each available user for the Flake to interface with.

## Some Quirks

Obviously, there's not strict structure or pattern you have to follow, but I've employed the following:

1. Any packages or configurations defined under any `common.nix` should be universal across all systems.
2. Any packages or configurations defined under `hosts/` should be user-ambiguous.
3. Touch and modify `flake.nix` as little as possible.
4. Until home-manager apps can be found by Spotlight and Alfred without hassle, use Homebrew to install any and all GUI apps.
5. Nix should be the only thing inside `/.config`. Any and all settings for any core programs should be managed via Nix.

## Applying the Configuration

I'm still working on scripts to install/interact with the config.

To apply the configuration, use the following command:

```sh
nix run nix-darwin --extra-experimental-features nix-command --extra-experimental-features flakes -- switch --flake ~/.config/nix
```

Rebuild the configuration:

```sh
darwin-rebuild switch --flake ~/.config/nix
```

Or, simply run:

```sh
nixup
```

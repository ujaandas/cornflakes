let
  moduleFiles = builtins.filter (path: builtins.match ".*\.nix$" path != null) (builtins.attrNames (builtins.readDir ./));
  modules = map (file: import (./ + file)) moduleFiles;
in {
  imports = modules;
}

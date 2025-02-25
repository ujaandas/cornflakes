{ inputs, specialArgs, username, ... }:

{
  users.users = {
    ${username} = {
      name = username;
      home = "/Users/${username}";
    };
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = inputs // specialArgs;
    users.${username} = import ./home.nix;
  };
}

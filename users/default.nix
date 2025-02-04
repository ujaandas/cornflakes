{ config, pkgs, ... }:
{
  users.users = {
    ooj = {
      name = "ooj";
      home = "/Users/ooj";
    };
    jess = {
      name = "jess";
      home = "/Users/jess";
    };
  };
}

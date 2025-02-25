let
  ooj = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHkV8Ewnp2RpiAgRxrdnueUulNSjcT+zNNCQBR+BOt4m ujaandas03@gmail.com";
in
{
  "github-ssh-key.age".publicKeys = [ ooj ];
}

# nix run github:ryantm/agenix -- <ARGS>
# ie; agenix -e secret.age (edit secret, looks in ~/.ssh for private key)
# ie; agenix -e secret.age -i ~/.ssh/custom_secret_loc (custom secret loc.)

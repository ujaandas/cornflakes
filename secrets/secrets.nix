let
  ooj = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHkV8Ewnp2RpiAgRxrdnueUulNSjcT+zNNCQBR+BOt4m ujaandas03@gmail.com";
in
{
  "github-ssh-key.age".publicKeys = [ ooj ];
}
